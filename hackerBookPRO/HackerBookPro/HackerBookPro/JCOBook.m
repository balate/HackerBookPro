#import "JCOBook.h"
#import "JCOAuthor.h"
#import "JCOPdf.h"
#import "JCOImage.h"
#import "JCOTag.h"
#import "helper.h"




@interface JCOBook ()

// Private interface goes here.
-(void) authorsFromJSON:(NSString *) stringJSON
                context:(NSManagedObjectContext *)context;


@end

@implementation JCOBook
// Custom logic goes here.



#pragma mark - class methods
+(NSArray *)observableKeys{
    
    return @[JCOBookAttributes.isFavourite];
    
}

+(instancetype) bookWithTitle:(NSString *) title
                       pdfURL:(NSString *) pdfURL
                    imageURL:(NSString *) imageURL
                   isFavorite:(BOOL) isFavorite
                         tags:(NSSet *)tags
                      authors:(NSSet *)author
                      context:(NSManagedObjectContext *) context{
    
    JCOBook *book = [self insertInManagedObjectContext:context];
    
    book.title = title;
    book.imageURL = imageURL;
    book.pdfURL = pdfURL;
    [book setIsFavouriteValue:isFavorite];
    book.tag = tags;
    book.authors = author;
    book.imageURL = [JCOImage insertInManagedObjectContext:context];
    
    return book;
    
}

+(instancetype) bookWithDictionary: (NSDictionary *) dict
                           context:(NSManagedObjectContext *) context{
    
    JCOBook *book = [JCOBook bookWithTitle:[dict objectForKey:TITLE]
                                    pdfURL:[dict objectForKey:PDF_URL]
                                  imageURL:[dict objectForKey:IMAGE_URL]
                                isFavorite:NO
                                      tags:nil
                                   authors:nil
                                   context:context];
    
    return book;
    
}


+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI
                                            context:(NSManagedObjectContext *) context{
    
    NSURL *uri = [NSKeyedUnarchiver unarchiveObjectWithData:archivedURI];
    if (uri == nil) {
        return nil;
    }
    
    
    NSManagedObjectID *nid = [context.persistentStoreCoordinator
                              managedObjectIDForURIRepresentation:uri];
    if (nid == nil) {
        return nil;
    }
    
    
    NSManagedObject *ob = [context objectWithID:nid];
    if (ob.isFault) {
        
        return (JCOBook*)ob;
    }else{
        
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:ob.entity.name];
        req.predicate = [NSPredicate predicateWithFormat:@"SELF = %@", ob];
        
        NSError *error;
        NSArray *res = [context executeFetchRequest:req
                                              error:&error];
        if (res == nil) {
            return nil;
        }else{
            return [res lastObject];
        }
    }
    
    
}

#pragma mark - set properties


-(void) setWithDictionary:(NSDictionary *) dict{
    
    [self authorsFromJSON:[dict objectForKey:AUTHORS]
                  context:self.managedObjectContext];
    
    [self tagsFromJSON:[dict objectForKey:TAGS]
               context:self.managedObjectContext];
    
}

-(void) updateImage{
    
    //download image in backgronud queue
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        NSURL *jsonURL = [NSURL URLWithString:self.imageURL];
        NSData *data = [NSData dataWithContentsOfURL:jsonURL];
        //navigate to main queue
        dispatch_async(dispatch_get_main_queue(), ^{
           
            //add image to CoreData
            JCOImage *img = [JCOImage insertInManagedObjectContext:self.managedObjectContext];
            img.imgData = data;
            self.imageURL = img;
        });
        
    });
    
    
}

-(void) updatePdf{
    
     //download pdf in backgronud queue
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        NSURL *jsonURL = [NSURL URLWithString:self.pdfURL];
        NSData *data = [NSData dataWithContentsOfURL:jsonURL];
        //navigate to main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            //add pdf to CoreData
            JCOPdf *p= [JCOPdf insertInManagedObjectContext:self.managedObjectContext];
            p.pdfData = data;
            self.pdf = p;
        });
        
    });
    
    
}



#pragma mark - methods for parsing

-(void) tagsFromJSON:(NSString *) stringJSON
             context:(NSManagedObjectContext *)context{
    
    
    
    NSArray *tags = [stringJSON componentsSeparatedByString:@", "];
    
   
    for (NSString *name in tags) {
        
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JCOTag entityName]];
        req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JCOTagAttributes.nameTag                                                              ascending:YES
                                                               selector:@selector(caseInsensitiveCompare:)]];
        req.fetchBatchSize = 20;
        req.predicate= [NSPredicate predicateWithFormat:@"name = %@",name];
        NSError *error;
        NSArray *result = [self.managedObjectContext executeFetchRequest:req
                                                                   error:&error];
        if ([result count] != 0 ) {
            
 
            [self addTagObject:[result lastObject]];
        }else{
            
            
            [self addTagObject:[JCOTag tagWithName:name
                                           context:context]];
        }
    }
    
}

-(void) authorsFromJSON:(NSString *) stringJSON
                context:(NSManagedObjectContext *)context{
    
    
    NSArray *authors = [stringJSON componentsSeparatedByString:@", "];
    
    
    for (NSString *name in authors) {
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JCOAuthor entityName]];
        req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JCOAuthorAttributes.name
                                                              ascending:YES
                                                               selector:@selector(caseInsensitiveCompare:)]];
        req.fetchBatchSize = 20;
        req.predicate= [NSPredicate predicateWithFormat:@"name = %@",name];
        NSError *error;
        NSArray *result = [self.managedObjectContext executeFetchRequest:req
                                                                   error:&error];
        if ([result count] != 0 ) {
            [self addAuthorsObject:[result lastObject]];
        }else{
            [self addAuthorsObject:[JCOAuthor authorWithName:name
                                                     context:context]];
        }
    }
    
}




#pragma mark - methods for last object

// Returns an NSData with the serialized URI representation of the
// objectID. Ready to save it in a NSUserDefaults, for example.
-(NSData*) archiveURIRepresentation{
    
    NSURL *uri = self.objectID.URIRepresentation;
    return [NSKeyedArchiver archivedDataWithRootObject:uri];
}




#pragma mark - utils

-(NSString *) tagsDescription{
    
    NSString *aux=@"";
    NSArray *array = [self.tag allObjects];
    if ([self.tag count]== 1) {
        return [NSString stringWithFormat:@"%@", [[array objectAtIndex:0] name]];
    }else{
        for (int i=0; i<[array count] ; i++) {
            if (i == 0) {
                aux = [NSString stringWithFormat:@"%@", [[array objectAtIndex:i] name]];
            }else{
                aux = [NSString stringWithFormat:@"%@,%@", [[array objectAtIndex:i] name], aux];
            }
        }
        return aux;
    }
    
}




-(NSString *)authorDescription{
    NSArray *array = [self.authors allObjects];
    NSString *aux=@"";
    if ([array count]== 1) {
        return [NSString stringWithFormat:@"%@", [[array objectAtIndex:0] name]];
    }else{
        for (int i=0; i<[array count] ; i++) {
            if (i == 0) {
                aux = [NSString stringWithFormat:@"%@", [[array objectAtIndex:i] name]];
            }else{
                aux = [NSString stringWithFormat:@"%@,%@", [[array objectAtIndex:i] name] , aux];
            }
        }
        return aux;
    }
    
}

@end

