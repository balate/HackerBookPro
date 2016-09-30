//
//  JCOBooksViewController.h
//  HackerBookPro
//
//  Created by Javier Contreras on 30/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"


@class JCOBooksViewController;
@class JCOBook;

@protocol JCOBooksViewControllerDelegate <NSObject>

@optional
-(void) booksViewController:(JCOBooksViewController *) libVC
            didSelectedBook:(JCOBook *) aBook;

@end

@interface JCOBooksViewController : AGTCoreDataTableViewController

@property (strong, nonatomic) UISearchController *searchController;

@property (weak, nonatomic) id<JCOBooksViewControllerDelegate> delegate;

@end

