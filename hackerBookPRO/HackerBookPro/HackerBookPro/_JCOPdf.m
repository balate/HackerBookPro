// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOPdf.m instead.

#import "_JCOPdf.h"

@implementation JCOPdfID
@end

@implementation _JCOPdf

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Pdf" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Pdf";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Pdf" inManagedObjectContext:moc_];
}

- (JCOPdfID*)objectID {
	return (JCOPdfID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic pdf;

@dynamic book;

@end

@implementation JCOPdfAttributes 
+ (NSString *)pdf {
	return @"pdf";
}
@end

@implementation JCOPdfRelationships 
+ (NSString *)book {
	return @"book";
}
@end

