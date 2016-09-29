#import "_JCOAuthor.h"

@interface JCOAuthor : _JCOAuthor
// Custom logic goes here.

+(instancetype) authorWithName:(NSString *) name
                       context:(NSManagedObjectContext *) context;

@end
