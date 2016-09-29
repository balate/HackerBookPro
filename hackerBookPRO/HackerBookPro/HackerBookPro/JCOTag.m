#import "JCOTag.h"
#import "JCOBook.h"



@interface JCOTag ()

// Private interface goes here.

@end

@implementation JCOTag

// Custom logic goes here.

+(instancetype) tagWithName:(NSString *)name
                    context:(NSManagedObjectContext *)context{
    
    JCOTag *tag = [self insertInManagedObjectContext:context];
    tag.nameTag = name;
    return tag;
    
}


@end

