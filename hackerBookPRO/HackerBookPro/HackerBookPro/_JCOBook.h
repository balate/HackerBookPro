// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOBook.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class JCOAuthor;
@class JCOImage;
@class JCOPdf;
@class JCOTag;

@interface JCOBookID : NSManagedObjectID {}
@end

@interface _JCOBook : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCOBookID *objectID;

@property (nonatomic, strong) NSString* image;

@property (nonatomic, strong, nullable) NSNumber* isFavourite;

@property (atomic) BOOL isFavouriteValue;
- (BOOL)isFavouriteValue;
- (void)setIsFavouriteValue:(BOOL)value_;

@property (nonatomic, strong) NSString* pdfURL;

@property (nonatomic, strong) NSString* title;

@property (nonatomic, strong, nullable) JCOAuthor *author;

@property (nonatomic, strong, nullable) JCOImage *img;

@property (nonatomic, strong, nullable) JCOPdf *pdf;

@property (nonatomic, strong, nullable) JCOTag *tag;

@end

@interface _JCOBook (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveImage;
- (void)setPrimitiveImage:(NSString*)value;

- (NSNumber*)primitiveIsFavourite;
- (void)setPrimitiveIsFavourite:(NSNumber*)value;

- (BOOL)primitiveIsFavouriteValue;
- (void)setPrimitiveIsFavouriteValue:(BOOL)value_;

- (NSString*)primitivePdfURL;
- (void)setPrimitivePdfURL:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (JCOAuthor*)primitiveAuthor;
- (void)setPrimitiveAuthor:(JCOAuthor*)value;

- (JCOImage*)primitiveImg;
- (void)setPrimitiveImg:(JCOImage*)value;

- (JCOPdf*)primitivePdf;
- (void)setPrimitivePdf:(JCOPdf*)value;

- (JCOTag*)primitiveTag;
- (void)setPrimitiveTag:(JCOTag*)value;

@end

@interface JCOBookAttributes: NSObject 
+ (NSString *)image;
+ (NSString *)isFavourite;
+ (NSString *)pdfURL;
+ (NSString *)title;
@end

@interface JCOBookRelationships: NSObject
+ (NSString *)author;
+ (NSString *)img;
+ (NSString *)pdf;
+ (NSString *)tag;
@end

NS_ASSUME_NONNULL_END