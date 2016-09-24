// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOImage.m instead.

#import "_JCOImage.h"

@implementation JCOImageID
@end

@implementation _JCOImage

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Image";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Image" inManagedObjectContext:moc_];
}

- (JCOImageID*)objectID {
	return (JCOImageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic imgData;

@dynamic book;

@end

@implementation JCOImageAttributes 
+ (NSString *)imgData {
	return @"imgData";
}
@end

@implementation JCOImageRelationships 
+ (NSString *)book {
	return @"book";
}
@end

