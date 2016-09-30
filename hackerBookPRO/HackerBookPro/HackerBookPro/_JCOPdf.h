// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOPdf.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class JCOBook;

@interface JCOPdfID : NSManagedObjectID {}
@end

@interface _JCOPdf : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCOPdfID *objectID;

@property (nonatomic, strong, nullable) NSData* pdfData;

@property (nonatomic, strong, nullable) JCOBook *book;

@end

@interface _JCOPdf (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (JCOBook*)primitiveBook;
- (void)setPrimitiveBook:(JCOBook*)value;

@end

@interface JCOPdfAttributes: NSObject 
+ (NSString *)pdfData;
@end

@interface JCOPdfRelationships: NSObject
+ (NSString *)book;
@end

NS_ASSUME_NONNULL_END
