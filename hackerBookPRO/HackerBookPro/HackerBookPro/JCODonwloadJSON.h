//
//  JCODonwloadJSON.h
//  HackerBookPro
//
//  Created by Javier Contreras on 25/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTSimpleCoreDataStack.h"

@interface JCODonwloadJSON : NSObject 

// Download books the server
+(void)downloadBookListWithBlock: (void (^)(NSArray * list) )completionBlock;



@end
