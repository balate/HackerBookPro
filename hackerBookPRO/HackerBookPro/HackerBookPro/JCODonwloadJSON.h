//
//  JCODonwloadJSON.h
//  HackerBookPro
//
//  Created by Javier Contreras on 25/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCODonwloadJSON : NSObject

// Download books the server
+(void)downloadBookList : (NSData *)library withBlock: (void (^)(NSArray * list) )completionBlock;
-(void) addDownloadedData: (NSData *)data;
+(void)downloadJSONFromURL:(NSURL *)jsonURL;

@end
