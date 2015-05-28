

#import <UIKit/UIKit.h>

@interface CustomScrollView : UIScrollView
{
    CGPoint lastPoint;
    BOOL mouseSwiped;
    int mouseMoved;
    
}

@end
