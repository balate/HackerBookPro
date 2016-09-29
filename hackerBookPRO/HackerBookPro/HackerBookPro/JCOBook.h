#import "_JCOBook.h"

@interface JCOBook : _JCOBook
// Custom logic goes here.

+(instancetype) bookWithTitle:(NSString *) title
                       pdfURL:(NSString *) pdfURL
                     imageURL:(NSString *) imageURL
                   isFavorite:(BOOL) isFavorite
                         tags:(NSSet *)tags
                      authors:(NSSet *)author
                      context:(NSManagedObjectContext *) context;


+(instancetype) bookWithDictionary: (NSDictionary *) dict
                           context:(NSManagedObjectContext *) context;

+(instancetype) objectWithArchivedURIRepresentation:(NSData*)archivedURI
                                            context:(NSManagedObjectContext *) context;

-(void) setWithDictionary:(NSDictionary *) dict;

-(void) updateImage;

-(NSData*) archiveURIRepresentation;

-(NSString *) tagsDescription;

-(NSString *) authorDescription;


@end
