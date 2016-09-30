#import "JCOImage.h"

@interface JCOImage ()

// Private interface goes here.

@end

@implementation JCOImage

// Custom logic goes here.

-(void) setImage:(UIImage *)image{
    
    self.imgData = UIImageJPEGRepresentation(image, 0.9);
    
}

-(UIImage *) image{
    
    return [UIImage imageWithData:self.imgData];
    
}

@end
