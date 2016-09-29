//
//  AppDelegate.h
//  HackerBookPro
//
//  Created by Javier Contreras on 19/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTSimpleCoreDataStack.h"

//@class AGTSimpleCoreDataStack;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) AGTSimpleCoreDataStack *model;

@end

