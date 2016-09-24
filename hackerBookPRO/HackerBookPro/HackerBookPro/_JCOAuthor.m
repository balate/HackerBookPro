// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOAuthor.m instead.

#import "_JCOAuthor.h"

@implementation JCOAuthorID
@end

@implementation _JCOAuthor

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Author";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Author" inManagedObjectContext:moc_];
}

- (JCOAuthorID*)objectID {
	return (JCOAuthorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic book;

@end

@implementation JCOAuthorAttributes 
+ (NSString *)name {
	return @"name";
}
@end

@implementation JCOAuthorRelationships 
+ (NSString *)book {
	return @"book";
}
@end

