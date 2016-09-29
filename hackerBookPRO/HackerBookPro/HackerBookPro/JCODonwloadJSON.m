//
//  JCODonwloadJSON.m
//  HackerBookPro
//
//  Created by Javier Contreras on 25/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCODonwloadJSON.h"
#import "JCOBook.h"
#import "JCOTag.h"
#import "helper.h"


@implementation JCODonwloadJSON

+(void)downloadBookList : (NSData *)library withBlock: (void (^)(NSArray * list) )completionBlock {
    

    // Parse JSON
    NSError *error;
    id JSONObject = [NSJSONSerialization JSONObjectWithData:library
                                                    options:kNilOptions
                                                      error:&error];
    
    if (JSONObject == nil || error) {
        NSLog(@"JSON Parse failed with error: %@", error.userInfo);
        
        completionBlock(nil);
    }
    
    // Create bookList (Array of dictionaries)
    NSArray *bookList;
    if ([JSONObject isKindOfClass:[NSArray class]]) {  // Array of dictionaries
        bookList = (NSArray *)JSONObject;
    } else if ([JSONObject isKindOfClass:[NSDictionary class]]) {   // A dictionary
        bookList = @[(NSDictionary *)JSONObject];
    }
    
    completionBlock(bookList);
}


-(void) addDownloadedData: (NSData *)data{
    
    NSError *error;
    //Creo un array con los objetos JSON
    NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                           options:kNilOptions
                                                             error:&error];
    
    //vuelvo a comporbar el vajor de JSONObjects para ver si hay error
    if (JSONObjects != nil) {
        for (NSDictionary *dic in JSONObjects) {
            JCOBook *bk = [JCOBook bookWithDictionary:dic context:self.context];
            
            
            [bk setWithDictionary:dic];
            [bk updateImage];
        }
        //[JCOTag tagWithName:@"Favorite" context:self.context];
        [self saveWithErrorBlock:^(NSError *error) {
            NSLog(@"Error al guardar %@", error.localizedDescription);
        }];
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:@YES
               forKey:FINISH_DOWNLOAD];
        [ud synchronize];
        
    }else{
        NSLog(@"error al pasear JSON: %@", error.localizedDescription);
    }
    
}


#pragma mark - Helpers

+(void)downloadJSONFromURL:(NSURL *)jsonURL {
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        NSURL *jsonURL = [NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"];
        NSData *data = [NSData dataWithContentsOfURL:jsonURL];
        //cuando la tengo, me voy a primer plano
        dispatch_async(dispatch_get_main_queue(), ^{
            //introduzco en core data lo que me descargo
            [self downloadBookList:data];
        });
        
    });
    
}


@end
