

#import "CustomScrollView.h"

@implementation CustomScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.scrollEnabled = NO ;
    // If not dragging, send event to next responder
    NSLog(@"Touches began") ;
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"%@", [touch.view class]) ;
    if ([[touch.view class] isSubclassOfClass:[UIImageView class]])
    {
        self.scrollEnabled = NO ;
        NSLog(@"Image view");
        NSLog(@"Touch.voew : %@", touch.view) ;
        UIImageView * img = ( UIImageView *) touch.view ;
        mouseSwiped = NO;
        UITouch *touch = [touches anyObject];
        lastPoint = [touch locationInView:img];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"moved") ;
    // If not dragging, send event to next responder
    mouseSwiped = YES;
    UITouch *touch = [[event allTouches] anyObject];
    if ([[touch.view class] isSubclassOfClass:[UIImageView class]])
    {
        UIImageView * img = ( UIImageView *) touch.view ;
        CGPoint currentPoint = [touch locationInView:img];
        UIGraphicsBeginImageContext(img.frame.size);
        [img.image drawInRect:CGRectMake(0, 0, img.frame.size.width, img.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 2.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
        CGContextBeginPath(UIGraphicsGetCurrentContext());
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        img.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        lastPoint = currentPoint;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // If not dragging, send event to next responder
    NSLog(@"ended") ;
    UITouch *touch = [[event allTouches] anyObject];
    if ([[touch.view class] isSubclassOfClass:[UIImageView class]])
    {
        UIImageView * img = ( UIImageView *) touch.view ;
        if(!mouseSwiped)
        {
            UIGraphicsBeginImageContext(img.frame.size);
            [img.image drawInRect:CGRectMake(0, 0, img.frame.size.width, img.frame.size.height)];
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 2.0);
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 0.0);
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            CGContextStrokePath(UIGraphicsGetCurrentContext());
            CGContextFlush(UIGraphicsGetCurrentContext());
            img.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
    }
    self.scrollEnabled = YES ;
}

@end
