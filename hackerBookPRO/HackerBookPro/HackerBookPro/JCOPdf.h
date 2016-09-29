#import "_JCOPdf.h"

@interface JCOPdf : _JCOPdf
// Custom logic goes here.

+(instancetype) pdfWithData:(NSData *) pdfData
                       book:(JCOBook *)book
                    context:(NSManagedObjectContext *)context;

@end
