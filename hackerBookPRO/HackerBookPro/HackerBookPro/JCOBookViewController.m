//
//  JCOBookViewController.m
//  HackerBookPro
//
//  Created by Javier Contreras on 30/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOBookViewController.h"
#import "JCOBooksViewController.h"
#import "JCOBook.h"
#import "JCOTag.h"
#import "JCOImage.h"
#import "JCOPdf.h"
#import "JCOPDFViewController.h"

@interface JCOBookViewController ()

@end

@implementation JCOBookViewController

#pragma mark - inits
-(id) initWithModel: (JCOBook *)model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    
    return self;
    
}


#pragma mark -life cycles
- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - actions
- (IBAction)readBook:(id)sender {
    
    if (self.model.pdf.pdfData == nil) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            
            NSURL *jsonURL = [NSURL URLWithString:self.model.pdfURL];
            NSData *data = [NSData dataWithContentsOfURL:jsonURL];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.model.pdf.pdfData = data;
            });
            
        });
    }
    
    [self.navigationController pushViewController:[[JCOPDFViewController alloc] initWithModel:self.model.pdf]
                                         animated:YES];
    
    
}

- (IBAction)changeStateFavorite:(id)sender {
    
    if (self.model.isFavouriteValue) {
        [self.model setIsFavouriteValue:NO];
    }else{
        [self.model setIsFavouriteValue:YES];
    }
    NSString *name = @"Favorite";
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[JCOTag entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:JCOTagAttributes.nameTag
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)]];
    req.fetchBatchSize = 20;
    req.predicate= [NSPredicate predicateWithFormat:@"nameTag == %@",name];
    NSError *error;
    NSArray *result = [self.model.managedObjectContext executeFetchRequest:req
                                                                     error:&error];
    if (self.model.isFavouriteValue) {
        if ([result count] != 0) {
            [self.model addTagObject:[result lastObject]];
        }else{
            [self.model addTagObject:[JCOTag tagWithName:name
                                                  context:self.model.managedObjectContext]];
        }
        
    }else{
        [self.model.managedObjectContext deleteObject:[result lastObject]];
    }
    
}


#pragma mark - delegates
-(void) booksViewController:(JCOBooksViewController *)libVC didSelectedBook:(JCOBook *)aBook{
    
    self.model=aBook;
    [self updateView];
    
}


#pragma mark - utils
-(void)updateView{
    
    self.title = self.model.title;
    self.titleLabelView.text = self.model.title;
    self.authorLabelView.text = [self.model authorDescription];
    self.tagLabelView.text = [self.model tagsDescription];
    self.imgView.image = [[self.model img] image];
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
}



@end
