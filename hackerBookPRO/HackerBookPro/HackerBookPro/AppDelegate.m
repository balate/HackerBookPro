//
//  AppDelegate.m
//  HackerBookPro
//
//  Created by Javier Contreras on 19/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTSimpleCoreDataStack.h"
#import "AGTSimpleCoreDataStack+Download.h"
#import "helper.h"
#import "JCOBook.h"
#import "JCOTag.h"
#import "JCODonwloadJSON.h"
#import "JCOBooksViewController.h"



@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Create instance model of Core Data.
    self.model = [AGTSimpleCoreDataStack coreDataStackWithModelName:@"Model"];
    
    [self trastearConDatos];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyWindow];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma marks -Utils
-(void)trastearConDatos{

    /*
   //NSManagedObject for authentic men or Chuck Norris Style
    //Create book
    NSManagedObject *book= [NSEntityDescription insertNewObjectForEntityForName:@"Book"
                                                         inManagedObjectContext:self.model.context];
     
    //Add properties values by KVC
    [book setValue:@"AngularJS" forKey:@"title"];
    [book setValue:@"http://fastandfluid.com/publicdownloads/AngularJSIn60MinutesIsh_DanWahlin_May2013.pdf"         forKey:@"pdfURL"];

    // Get value property and console show
    NSLog(@"The title book is %@", [book valueForKey:@"title"]);

     */
}


-(void)configureFirstAppear{
    
    //checkout file JSON is save
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (![ud objectForKey:FINISH_DOWNLOAD]) {
        
        
        //Async donwload
        [JCODonwloadJSON downloadBookListWithBlock:^(NSArray *list) {
            [self.model addDownloadedData:list];
        }];
        

    }
}

-(void) configureForPhone{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JCOTag entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JCOTagAttributes.nameTag
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)]];
    req.fetchBatchSize = 20;
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                         managedObjectContext:self.model.context
                                                                           sectionNameKeyPath:JCOTagAttributes.nameTag
                                                                                    cacheName:nil];
    
    JCOBooksViewController *bkVC = [[JCOBooksViewController alloc] initWithFetchedResultsController:fc
                                                                                              style:UITableViewStylePlain];
    bkVC.delegate = bkVC;
    
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:bkVC];
    
    self.window.rootViewController = navVC;
    
    
}


@end
