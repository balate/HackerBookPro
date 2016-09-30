// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOTag.m instead.

#import "_JCOTag.h"

@implementation JCOTagID
@end

@implementation _JCOTag

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:moc_];
}

- (JCOTagID*)objectID {
	return (JCOTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic nameTag;

@dynamic book;

- (NSMutableSet<JCOBook*>*)bookSet {
	[self willAccessValueForKey:@"book"];

	NSMutableSet<JCOBook*> *result = (NSMutableSet<JCOBook*>*)[self mutableSetValueForKey:@"book"];

	[self didAccessValueForKey:@"book"];
	return result;
}

@end

@implementation JCOTagAttributes 
+ (NSString *)nameTag {
	return @"nameTag";
}
@end

@implementation JCOTagRelationships 
+ (NSString *)book {
	return @"book";
}
@end

