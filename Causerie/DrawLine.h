

#import <UIKit/UIKit.h>

@interface DrawLine : UIView
{
    UIColor *lineColor;
}
@property (nonatomic, copy) NSString *text;
@property ( nonatomic) int int_currentTable ;

- (void)setText:(NSString *)text ;
- ( void) setCurrentTable: ( int) int_currentTable ;
@end
