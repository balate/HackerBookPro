#import "JCOAuthor.h"

@interface JCOAuthor ()

// Private interface goes here.

@end

@implementation JCOAuthor

// Custom logic goes here.
+(instancetype) authorWithName:(NSString *) name
                       context:(NSManagedObjectContext *) context{
    
    JCOAuthor *author=[self insertInManagedObjectContext:context];
    
    author.name = name;
    
    return author;
    
}

@end

