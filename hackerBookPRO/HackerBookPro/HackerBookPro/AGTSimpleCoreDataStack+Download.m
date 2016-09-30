//
//  AGTSimpleCoreDataStack+Download.m
//  HackerBookPro
//
//  Created by Javier Contreras on 30/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "AGTSimpleCoreDataStack+Download.h"
#import "JCOBook.h"
#import "JCOTag.h"
#import "helper.h"

@implementation AGTSimpleCoreDataStack (AGTSimpleCoreDataStack_Download)

-(void) addDownloadedData: (NSArray *)data{
    
    //Creo un array con los objetos JSON
    NSArray *JSONObjects = data;
    
    //vuelvo a comporbar el vajor de JSONObjects para ver si hay error
    if (JSONObjects != nil) {
        for (NSDictionary *dic in JSONObjects) {
            JCOBook *aBook = [JCOBook bookWithDictionary:dic
                                                 context:self.context];
            
            [aBook setWithDictionary:dic]; //update tags and Author
            [aBook updateImage]; //download Image
        }
        
        [JCOTag tagWithName:@"Favourite" context:self.context];
        
        [self saveWithErrorBlock:^(NSError *error) {
        
            NSLog(@"Error al guardar %@", error.localizedDescription);
        
        }];
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        [ud setObject:@YES
        
               forKey:FINISH_DOWNLOAD];
        
        [ud synchronize];
        
    }else{
        NSLog(@"error al pasear JSON");
    }
    
}




@end
