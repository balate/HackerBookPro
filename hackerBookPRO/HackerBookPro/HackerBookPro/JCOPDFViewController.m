//
//  JCOPDFViewController.m
//  HackerBookPro
//
//  Created by Javier Contreras on 2/10/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "JCOPDFViewController.h"
#import "JCOPdf.h"
#import "JCOBook.h"
#import "helper.h"





@interface JCOPDFViewController ()

@property (nonatomic)BOOL load;

@end

@implementation JCOPDFViewController



+(NSArray *) observableKeys{
    
    return @[@"model.pdfData"];
}



-(id) initWithModel: (JCOPdf *) model{
    
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        
        _model = model;
        
        self.title = self.model.book.title;
        
        _load = YES;
        
    }

    
    return self;
}



-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupKVO];
    
}

-(void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    self.webView.delegate = self;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void) viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self tearDownKVO];
    
}




#pragma mark - Delegate UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    self.load = NO;
    
}



-(BOOL) webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType{
    
    return self.load;
    
}



#pragma mark - Utils
-(void) syncWithModel{
    
    self.load = YES;
    
    [self.webView loadData:self.model.pdfData
                 MIMEType:@"application/pdf"
         textEncodingName:@"UTF-8"
                  baseURL:[NSURL URLWithString:@"https://"]];
    
}




#pragma mark - KVO
-(void) setupKVO{
    
    //Observable
    for (NSString *key in [[self class] observableKeys]) {
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                  context:NULL];
    }
    
}


-(void) tearDownKVO{
    
    //unsubscribe notification
    for (NSString *key in [[self class] observableKeys]) {
        [self removeObserver:self
                  forKeyPath:key];
        
    }
    
}


-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    [self syncWithModel];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
