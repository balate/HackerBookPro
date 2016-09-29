// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOBook.m instead.

#import "_JCOBook.h"

@implementation JCOBookID
@end

@implementation _JCOBook

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (JCOBookID*)objectID {
	return (JCOBookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"isFavouriteValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isFavourite"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic imageURL;

@dynamic isFavourite;

- (BOOL)isFavouriteValue {
	NSNumber *result = [self isFavourite];
	return [result boolValue];
}

- (void)setIsFavouriteValue:(BOOL)value_ {
	[self setIsFavourite:@(value_)];
}

- (BOOL)primitiveIsFavouriteValue {
	NSNumber *result = [self primitiveIsFavourite];
	return [result boolValue];
}

- (void)setPrimitiveIsFavouriteValue:(BOOL)value_ {
	[self setPrimitiveIsFavourite:@(value_)];
}

@dynamic pdfURL;

@dynamic title;

@dynamic authors;

- (NSMutableSet<JCOAuthor*>*)authorsSet {
	[self willAccessValueForKey:@"authors"];

	NSMutableSet<JCOAuthor*> *result = (NSMutableSet<JCOAuthor*>*)[self mutableSetValueForKey:@"authors"];

	[self didAccessValueForKey:@"authors"];
	return result;
}

@dynamic img;

@dynamic pdf;

@dynamic tag;

@end

@implementation JCOBookAttributes 
+ (NSString *)imageURL {
	return @"imageURL";
}
+ (NSString *)isFavourite {
	return @"isFavourite";
}
+ (NSString *)pdfURL {
	return @"pdfURL";
}
+ (NSString *)title {
	return @"title";
}
@end

@implementation JCOBookRelationships 
+ (NSString *)authors {
	return @"authors";
}
+ (NSString *)img {
	return @"img";
}
+ (NSString *)pdf {
	return @"pdf";
}
+ (NSString *)tag {
	return @"tag";
}
@end

