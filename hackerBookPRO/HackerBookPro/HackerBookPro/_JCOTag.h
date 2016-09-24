// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOTag.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class JCOBook;

@interface JCOTagID : NSManagedObjectID {}
@end

@interface _JCOTag : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCOTagID *objectID;

@property (nonatomic, strong) NSString* nameTag;

@property (nonatomic, strong, nullable) JCOBook *book;

@end

@interface _JCOTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveNameTag;
- (void)setPrimitiveNameTag:(NSString*)value;

- (JCOBook*)primitiveBook;
- (void)setPrimitiveBook:(JCOBook*)value;

@end

@interface JCOTagAttributes: NSObject 
+ (NSString *)nameTag;
@end

@interface JCOTagRelationships: NSObject
+ (NSString *)book;
@end

NS_ASSUME_NONNULL_END
