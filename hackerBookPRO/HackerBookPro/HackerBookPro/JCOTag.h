#import "_JCOTag.h"

@interface JCOTag : _JCOTag
// Custom logic goes here.

+(instancetype) tagWithName:(NSString *)name
context:(NSManagedObjectContext *)context;

@end

