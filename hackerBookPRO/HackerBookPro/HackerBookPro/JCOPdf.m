#import "JCOPdf.h"

@interface JCOPdf ()

// Private interface goes here.

@end

@implementation JCOPdf

// Custom logic goes here.

+(instancetype) pdfWithData:(NSData *) pdfData
                       book:(JCOBook *)book
                    context:(NSManagedObjectContext *)context{
    
    JCOPdf *pdf =[self insertInManagedObjectContext:context];
    pdf.pdfData = pdfData;
    pdf.book = book;
    
    return pdf;
    
}

@end
