

#import <QuartzCore/QuartzCore.h>
#import "ScrollViewToPDF.h"


@implementation ScrollViewToPDF
{
    
}

// based http://coderchrismills.wordpress.com/2011/06/25/making-a-pdf-from-a-uiwebview/
//#define kDefaultPageHeight 4500
//#define kDefaultPageWidth  850
//#define kMargin 50

//+ (NSData *)pdfDataOfScrollView:(UIScrollView *)scrollView
//{
//    CGRect origFrame = scrollView.frame;
//    BOOL horizontalScrollIndicator = [scrollView showsHorizontalScrollIndicator];
//    BOOL verticalScrollIndicator = [scrollView showsVerticalScrollIndicator];
//    //NSMutableData *pdfFile = [[NSMutableData alloc] init];
//    //CGDataConsumerRef pdfConsumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef) pdfFile);
//    //CGRect mediaBox = CGRectZero;CGFloat maxHeight = kDefaultPageHeight - 2 * kMargin;
//    CGFloat maxHeight = kDefaultPageHeight;
//    //CGFloat maxWidth = kDefaultPageWidth - 2 * kMargin ;
//    // Set up we the pdf we're going to be generating is
//    
//    [scrollView setFrame:CGRectMake(0.f, 0.f, scrollView.contentSize.width, maxHeight)];
//    CGFloat height = scrollView.contentSize.height;
//    NSInteger pages = (NSInteger) ceil(height / maxHeight);
//    NSMutableData *pdfData = [NSMutableData data];
//    [self prepareForCapture:scrollView];
//    CGRect scrollSize = CGRectMake(0,0,0,0);
//    UIGraphicsBeginPDFContextToData(pdfData, scrollSize, nil);
//    for (int i = 0 ;i < pages ;i++)
//    {
//        if (maxHeight * (i + 1) > height)
//        {
//            // Check to see if page draws more than the height of the UIWebView
//            CGRect scrollViewFrame = [scrollView frame];
//            scrollViewFrame.size.height -= (((i + 1) * maxHeight) - height);
//            [scrollView setFrame:scrollViewFrame];
//        }
//        // Specify the size of the pdf page
//        
//        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 868, scrollView.contentSize.height), nil);
//        CGContextRef currentContext = UIGraphicsGetCurrentContext();
//        
//        //        [self drawPageNumber:(i + 1)];
//        // Move the context for the margins
//        //        CGContextTranslateCTM(currentContext, kMargin, -(maxHeight * i) + kMargin);
//        
//        CGContextTranslateCTM(currentContext, kMargin, -(maxHeight * i) + kMargin);
//        [scrollView setContentOffset:CGPointMake(0, maxHeight * i) animated:NO];
//        // draw the layer to the pdf, ignore the "renderInContext not found" warning.
//        [scrollView.layer renderInContext:currentContext];
//    }
//    // all done with making the pdf
//    UIGraphicsEndPDFContext();
//    [scrollView setFrame:origFrame];
//    [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
//    [scrollView setShowsHorizontalScrollIndicator:horizontalScrollIndicator];
//    [scrollView setShowsVerticalScrollIndicator:verticalScrollIndicator];
//    return pdfData;
//}

#define kDefaultPageHeight 1080
#define kDefaultPageWidth  850
#define kMargin 50
+ (NSData *)pdfDataOfScrollView:(UIScrollView *)scrollView

{
    CGRect origFrame = scrollView.frame;
    BOOL horizontalScrollIndicator = [scrollView showsHorizontalScrollIndicator];
    BOOL verticalScrollIndicator = [scrollView showsVerticalScrollIndicator];
    NSMutableData *pdfFile = [[NSMutableData alloc] init];
    CGDataConsumerRef pdfConsumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef) pdfFile);
    CGRect mediaBox = CGRectZero;
    CGFloat maxHeight = kDefaultPageHeight - 2 * kMargin;
    CGFloat maxWidth = kDefaultPageWidth - 2 * kMargin ;
    
    
    // Set up we the pdf we're going to be generating is
    [scrollView setFrame:CGRectMake(0.f, 0.f, scrollView.contentSize.width+100, maxHeight)];
    
    CGFloat height = scrollView.contentSize.height;
    NSInteger pages = (NSInteger) ceil(height / maxHeight);
    
    NSMutableData *pdfData = [NSMutableData data];
    [self prepareForCapture:scrollView];
    
    
    CGRect scrollSize = CGRectMake(0,0,0,0);
    
    
    UIGraphicsBeginPDFContextToData(pdfData, scrollSize, nil);
    for (int i = 0 ;i < pages ;i++){
        if (maxHeight * (i + 1) > height){
            // Check to see if page draws more than the height of the UIWebView
            CGRect scrollViewFrame = [scrollView frame];
            scrollViewFrame.size.height -= (((i + 1) * maxHeight) - height);
            [scrollView setFrame:scrollViewFrame];
        }
        // Specify the size of the pdf page
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, scrollView.contentSize.width+100, kDefaultPageHeight+50), nil);
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        
        //        [self drawPageNumber:(i + 1)];
        // Move the context for the margins
        //        CGContextTranslateCTM(currentContext, kMargin, -(maxHeight * i) + kMargin);
        
        CGContextTranslateCTM(currentContext, kMargin, -(maxHeight * i) + kMargin);
        
        [scrollView setContentOffset:CGPointMake(0, maxHeight * i) animated:NO];
        
        // draw the layer to the pdf, ignore the "renderInContext not found" warning.
        [scrollView.layer renderInContext:currentContext];
    }
    // all done with making the pdf
    UIGraphicsEndPDFContext();
    [scrollView setFrame:origFrame];
    [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    [scrollView setShowsHorizontalScrollIndicator:horizontalScrollIndicator];
    [scrollView setShowsVerticalScrollIndicator:verticalScrollIndicator];
    return pdfData;
}



+ (NSData *)pdfDataOfScrollView1:(UIScrollView *)scrollView
{
    CGRect origFrame = scrollView.frame;
    BOOL horizontalScrollIndicator = [scrollView showsHorizontalScrollIndicator];
    BOOL verticalScrollIndicator = [scrollView showsVerticalScrollIndicator];
    //NSMutableData *pdfFile = [[NSMutableData alloc] init];
    //CGDataConsumerRef pdfConsumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef) pdfFile);
    //CGRect mediaBox = CGRectZero;CGFloat maxHeight = kDefaultPageHeight - 2 * kMargin;
    CGFloat maxHeight = kDefaultPageHeight;
    //CGFloat maxWidth = kDefaultPageWidth - 2 * kMargin ;
    // Set up we the pdf we're going to be generating is
    
    [scrollView setFrame:CGRectMake(0.f, 0.f, scrollView.contentSize.width, maxHeight)];
    CGFloat height = scrollView.contentSize.height;
    NSInteger pages = (NSInteger) ceil(height / maxHeight);
    NSMutableData *pdfData = [NSMutableData data];
    [self prepareForCapture:scrollView];
    CGRect scrollSize = CGRectMake(0,0,0,0);
    UIGraphicsBeginPDFContextToData(pdfData, scrollSize, nil);
    for (int i = 0 ;i < pages ;i++)
    {
        if (maxHeight * (i + 1) > height)
        {
            // Check to see if page draws more than the height of the UIWebView
            CGRect scrollViewFrame = [scrollView frame];
            scrollViewFrame.size.height -= (((i + 1) * maxHeight) - height);
            [scrollView setFrame:scrollViewFrame];
        }
        // Specify the size of the pdf page
        
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 868, scrollView.contentSize.height), nil);
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        
        //        [self drawPageNumber:(i + 1)];
        // Move the context for the margins
        //        CGContextTranslateCTM(currentContext, kMargin, -(maxHeight * i) + kMargin);
        
        CGContextTranslateCTM(currentContext, kMargin, -(maxHeight * i) + kMargin);
        [scrollView setContentOffset:CGPointMake(0, maxHeight * i) animated:NO];
        // draw the layer to the pdf, ignore the "renderInContext not found" warning.
        [scrollView.layer renderInContext:currentContext];
    }
    // all done with making the pdf
    UIGraphicsEndPDFContext();
    [scrollView setFrame:origFrame];
    [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    [scrollView setShowsHorizontalScrollIndicator:horizontalScrollIndicator];
    [scrollView setShowsVerticalScrollIndicator:verticalScrollIndicator];
    return pdfData;
}



+ (NSData *)pdfDataOfView:(UIView *)view
{
    CGRect origFrame = view.frame;
    //CGFloat maxHeight = kDefaultPageHeight;
    [view setFrame:CGRectMake(0.f, 0.f, 768, 265)];
    NSMutableData *pdfData = [NSMutableData data];
    //[self prepareForCapture:view];
    CGRect scrollSize = CGRectMake(0,0,0,0);
    UIGraphicsBeginPDFContextToData(pdfData, scrollSize, nil);

            // Specify the size of the pdf page
        
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 768, view.frame.size.height), nil);
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        
        [view.layer renderInContext:currentContext];
       // all done with making the pdf
    UIGraphicsEndPDFContext();
    [view setFrame:origFrame];
    return pdfData;
}


+ (void)prepareForCapture:(UIScrollView *)scrollView
{
    [scrollView setContentOffset:CGPointZero animated:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
}
@end