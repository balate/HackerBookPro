// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to JCOAuthor.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class JCOBook;

@interface JCOAuthorID : NSManagedObjectID {}
@end

@interface _JCOAuthor : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) JCOAuthorID *objectID;

@property (nonatomic, strong) NSString* name;

@property (nonatomic, strong, nullable) JCOBook *book;

@end

@interface _JCOAuthor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (JCOBook*)primitiveBook;
- (void)setPrimitiveBook:(JCOBook*)value;

@end

@interface JCOAuthorAttributes: NSObject 
+ (NSString *)name;
@end

@interface JCOAuthorRelationships: NSObject
+ (NSString *)book;
@end

NS_ASSUME_NONNULL_END
