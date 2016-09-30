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
#import "AGTSimpleCoreDataStack+Download.h"


@implementation JCODonwloadJSON

+(void)downloadBookListWithBlock: (void (^)(NSArray * list) )completionBlock {
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        NSURL *jsonURL = [NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"];
        NSData *data = [NSData dataWithContentsOfURL:jsonURL];
        //return ton main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            //add core data data downloader
            // Parse JSON
            NSError *error;
            id JSONObject = [NSJSONSerialization JSONObjectWithData:data
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
        });
        
    });
    
    }





@end
