//
//  JCOPDFViewController.h
//  HackerBookPro
//
//  Created by Javier Contreras on 2/10/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

#import "ViewController.h"


@class JCOPdf;

@interface JCOPDFViewController : UIViewController<UIWebViewDelegate>



@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) JCOPdf *model;





-(id) initWithModel: (JCOPdf *) model;



@end
