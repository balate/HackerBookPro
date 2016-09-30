//
//  JCOBooksViewController.m
//  HackerBookPro
//
//  Created by Javier Contreras on 30/9/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOBooksViewController.h"
#import "JCOBook.h"
#import "JCOTag.h"
#import "helper.h"
#import "JCOImage.h"
#import "JCOBookViewController.h"

@interface JCOBooksViewController ()

@end

@implementation JCOBooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"HACKERBOOKS PRO";
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[[self.fetchedResultsController.fetchedObjects objectAtIndex:section] book] count];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JCOTag *t = [self.fetchedResultsController.fetchedObjects objectAtIndex:[indexPath section]];
    JCOBook *b = [[t.book allObjects] objectAtIndex: [indexPath row]];
    
    //create cell
    static NSString *cellID= @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:cellID];
    }
    
    //syncronize cell and book
    cell.textLabel.text = b.title;
    cell.detailTextLabel.text = [b tagsDescription];
    cell.imageView.image = b.img.image;
    
    
    //cell
    return cell;
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JCOTag *t = [self.fetchedResultsController.fetchedObjects objectAtIndex:[indexPath section]];
    JCOBook *aBook = [[t.book allObjects] objectAtIndex: [indexPath row]];
    
    
    if ([self.delegate respondsToSelector:@selector(booksViewController:didSelectedBook:) ]) {
        [self.delegate booksViewController:self
                           didSelectedBook:aBook];
    }
    
    //last selected book
    NSData *dataURL = [aBook archiveURIRepresentation];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:dataURL
            forKey:LAST_BOOK];
    [def synchronize];
    
}

-(void)booksViewController:(JCOBooksViewController *)libVC didSelectedBook:(JCOBook *)aBook{
    
    JCOBookViewController *bookVC = [[JCOBookViewController alloc] initWithModel:aBook];
    [self.navigationController pushViewController:bookVC
                                         animated:YES];
    
    
}



@end
