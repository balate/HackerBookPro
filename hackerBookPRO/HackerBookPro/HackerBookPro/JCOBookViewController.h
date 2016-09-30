//
//  JCOBookViewController.h
//  HackerBookPro
//
//  Created by Javier Contreras on 30/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//


#import "JCOBooksViewController.h"
@class JCOBook;
@import UIKit;


@interface JCOBookViewController : UIViewController <JCOBooksViewControllerDelegate>

@property (strong, nonatomic) JCOBook *model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabelView;
@property (weak, nonatomic) IBOutlet UILabel *tagLabelView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

-(id) initWithModel: (JCOBook *)model;

- (IBAction)readBook:(id)sender;

- (IBAction)changeStateFavorite:(id)sender;
- (IBAction)displayNotes:(id)sender;

@end


