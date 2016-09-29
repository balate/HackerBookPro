// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOImage.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class JCOBook;

@interface JCOImageID : NSManagedObjectID {}
@end

@interface _JCOImage : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCOImageID *objectID;

@property (nonatomic, strong, nullable) NSData* imgData;

@property (nonatomic, strong, nullable) JCOBook *book;

@end

@interface _JCOImage (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImgData;
- (void)setPrimitiveImgData:(NSData*)value;

- (JCOBook*)primitiveBook;
- (void)setPrimitiveBook:(JCOBook*)value;

@end

@interface JCOImageAttributes: NSObject 
+ (NSString *)imgData;
@end

@interface JCOImageRelationships: NSObject
+ (NSString *)book;
@end

NS_ASSUME_NONNULL_END
