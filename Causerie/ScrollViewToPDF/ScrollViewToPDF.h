

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ScrollViewToPDF : NSObject

+ (NSData *)pdfDataOfScrollView:(UIScrollView *)scrollView ;
+ (NSData *)pdfDataOfView:(UIView *)view;

+ (NSData *)pdfDataOfScrollView1:(UIScrollView *)scrollView;


@end