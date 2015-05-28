

#import "DrawLine.h"

#define prevention_CellWidth_1 100
#define prevention_CellHeight_1 50
#define prevention_CW_2 175
#define prevention_CH_2 125
@implementation DrawLine

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    
    // CGContextSetLineWidth: The default line width is 1 unit. When stroked, the line straddles the path, with half of the total width on either side.
    // Therefor/Users/RaviMacMini/Downloads/Digitram 15.05.2015/Causerie/CauzQSSE_ViewController.me, a 1 pixel vertical line will not draw crisply unless it is offest by 0.5. This problem does not seem to affect horizontal lines.
    CGContextSetLineWidth(context, 1.0);
    
    NSLog(@"DRAW RECT") ;
    if ([self.text isEqualToString:@"Qsse"])
    {
        NSLog(@"Gets called") ;
        if (self.int_currentTable == 1)
        {
            NSLog(@"QSSEEEEEEE") ;
            CGContextMoveToPoint(context, 345+0.5, 0);
            CGContextAddLineToPoint(context, 345+0.5, rect.size.height);

            CGContextMoveToPoint(context, 480+0.5, 0);
            CGContextAddLineToPoint(context, 480+0.5, rect.size.height);

            CGContextMoveToPoint(context, 600+0.5, 0);
            CGContextAddLineToPoint(context, 600+0.5, rect.size.height);
            // Add Bottom Line
            CGContextMoveToPoint(context, 0, 45-0.5);
            CGContextAddLineToPoint(context, rect.size.width, 45-0.5);

        }
    }
    if ([ self.text isEqualToString:@"prevention"])
    {
        NSLog(@"Prevention") ;
        // Drawing code
        
        // Add the vertical lines
        if (self.int_currentTable == 1)
        {
            // CGContextMoveToPoint(context, 0.5, 0);
            //CGContextAddLineToPoint(context,0.5, rect.size.height);
            CGContextMoveToPoint(context, (prevention_CellWidth_1 - 30)+0.5, prevention_CellHeight_1);
            CGContextAddLineToPoint(context, (prevention_CellWidth_1 - 30)+0.5, rect.size.height);
            
            CGContextMoveToPoint(context, prevention_CellWidth_1 * 2+0.5, prevention_CellHeight_1);
            CGContextAddLineToPoint(context, prevention_CellWidth_1 * 2+0.5, rect.size.height);
            
            CGContextMoveToPoint(context, prevention_CellWidth_1 * 3+0.5+50, prevention_CellHeight_1);
            CGContextAddLineToPoint(context, prevention_CellWidth_1 * 3+0.5+50, rect.size.height);
            
            CGContextMoveToPoint(context, prevention_CellWidth_1 * 5+0.5 +40, prevention_CellHeight_1);
            CGContextAddLineToPoint(context, prevention_CellWidth_1 *5+0.5+40, rect.size.height);
            
            CGContextMoveToPoint(context, prevention_CellWidth_1 * 7+0.5 - 40 , prevention_CellHeight_1);
            CGContextAddLineToPoint(context, prevention_CellWidth_1 *7+0.5 - 40   , rect.size.height);
            
            // Add bottom line
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1 * 1.5-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*1.5-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1 * 2.4-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*2.4-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1 * 3.2-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*3.2-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1 * 4-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*4-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1 * 4.8-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*4.8-0.5);

            
        }
        else if (self.int_currentTable == 2)
        {
            NSLog(@"Two") ;
            // Add Vertical Line
            CGContextMoveToPoint(context, (prevention_CW_2)+0.5, prevention_CH_2);
            CGContextAddLineToPoint(context, (prevention_CW_2)+0.5, rect.size.height);
            
            CGContextMoveToPoint(context, prevention_CW_2*2+30 +0.5, prevention_CH_2);
            CGContextAddLineToPoint(context, prevention_CW_2*2+30 +0.5, rect.size.height);
            
            CGContextMoveToPoint(context, prevention_CW_2*3 +30 +0.5,prevention_CH_2);
            CGContextAddLineToPoint(context, prevention_CW_2*3 +30 +0.5, rect.size.height);
            
            
            // Add bottom line
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1-10-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1-10-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*2.5-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*2.5-0.5);
            
        }
        else if (self.int_currentTable == 3)
        {
            // Add Vertical Line
            CGContextMoveToPoint(context, (prevention_CW_2)+10+0.5,  prevention_CellHeight_1-10);
            CGContextAddLineToPoint(context, (prevention_CW_2)+10+0.5, rect.size.height);
            
            // Add bottom line
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1-10-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1-10-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*2.1-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*2.1-0.5);
            
        }
        else if (self.int_currentTable == 4)
        {
            // Add Vertical Line
            CGContextMoveToPoint(context, rect.size.width/2+0.5, prevention_CellHeight_1-10-0.5);
            CGContextAddLineToPoint(context, rect.size.width/2+0.5, rect.size.height-97);
            
            // Add bottom line
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1-10-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1-10-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*2.3-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*2.3-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*3.5-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*3.5-0.5);
            
        }
        else if (self.int_currentTable == 5)
        {
            // Add bottom line
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1-10-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1-10-0.5);
            
        }
        else if (self.int_currentTable == 6)
        {
            // Add Vertical Line
            CGContextMoveToPoint(context, (prevention_CW_2-25)+0.5,  prevention_CellHeight_1-10);
            CGContextAddLineToPoint(context, (prevention_CW_2-25)+0.5, rect.size.height);
            
            CGContextMoveToPoint(context, (prevention_CW_2*2-40)+0.5,  prevention_CellHeight_1-10);
            CGContextAddLineToPoint(context, (prevention_CW_2*2-40)+0.5, rect.size.height);
            
            CGContextMoveToPoint(context, (prevention_CW_2*3-60)+0.5,  prevention_CellHeight_1-10);
            CGContextAddLineToPoint(context, (prevention_CW_2*3-60)+0.5, rect.size.height);
            
            CGContextMoveToPoint(context, (prevention_CW_2*4-80)+0.5,  prevention_CellHeight_1-10);
            CGContextAddLineToPoint(context, (prevention_CW_2*4-80)+0.5, rect.size.height);
            
            // Add bottom line
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1-10-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1-10-0.5);
            
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*2.4-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*2.4-0.5);
            
        }
        
    }
    else if ([self.text isEqualToString:@"Hazardous"])
    {
        NSLog(@"Hazardous") ;
        if (self.int_currentTable == 1)
        {
            // Add Vertical Line
            CGContextMoveToPoint(context, (prevention_CW_2-25)+0.5,  prevention_CellHeight_1-10);
            //CGContextAddLineToPoint(context, (prevention_CW_2-25)+0.5, rect.size.height);
            
            CGContextMoveToPoint(context, (prevention_CW_2*2-40)+0.5, 0);
            CGContextAddLineToPoint(context, (prevention_CW_2*2-40)+0.5, rect.size.height);
            
            CGContextMoveToPoint(context, (prevention_CW_2*3-60)+0.5,  0);
            CGContextAddLineToPoint(context, (prevention_CW_2*3-60)+0.5, rect.size.height);
            
            CGContextMoveToPoint(context, (prevention_CW_2*4-90)+0.5,  0);
            CGContextAddLineToPoint(context, (prevention_CW_2*4-90)+0.5, rect.size.height);
            // Add bottom line
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1+30);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1+30);
        }
        else if (self.int_currentTable == 2)
        {
//            // Add Vertical Line
            CGContextMoveToPoint(context, (prevention_CellHeight_1+60+0.5),  0);
            CGContextAddLineToPoint(context, (prevention_CellHeight_1+60+0.5), rect.size.height);
        
           CGContextMoveToPoint(context, (prevention_CellHeight_1+350+0.5),  0);
            CGContextAddLineToPoint(context, (prevention_CellHeight_1+350+0.5), rect.size.height);
//            
            CGContextMoveToPoint(context, (prevention_CellHeight_1+475+0.5), 0);
            CGContextAddLineToPoint(context, (prevention_CellHeight_1+475+0.5), rect.size.height);
//            
            CGContextMoveToPoint(context,  (prevention_CellHeight_1+590+0.5),  0);
            CGContextAddLineToPoint(context,  (prevention_CellHeight_1+590+0.5), rect.size.height);
//            
            CGContextMoveToPoint(context, (prevention_CW_2*4-90)+0.5,  0);
            //CGContextAddLineToPoint(context, (prevention_CW_2*4-90)+0.5, rect.size.height);
//            // Add bottom line
            CGContextMoveToPoint(context, 0, prevention_CellHeight_1-0.5);
            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1-0.5);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1+50);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*2+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*2+50);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*3+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*3+50);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*4+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*4+50);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*5+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*5+50);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*6+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*6+50);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*7+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*7+50);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*8+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*8+50);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*9+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*9+50);
//            
//            CGContextMoveToPoint(context, 0, prevention_CellHeight_1*10+50);
//            CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1*10+50);
//            
//            
//            
        }
        
    }
    else if ([self.text isEqualToString:@"security"])
    {
        // Add bottom line
        CGContextMoveToPoint(context, 0, prevention_CellHeight_1-0.5);
        CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1-0.5);
        
        CGContextMoveToPoint(context, 170, prevention_CellHeight_1+40-0.5);
        CGContextAddLineToPoint(context, rect.size.width, prevention_CellHeight_1+40-0.5);
    }
    else
    {
        if (self.int_currentTable != 1)
        {
            // Drawing code
            CGContextRef context = UIGraphicsGetCurrentContext();
            
            CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
            
            // CGContextSetLineWidth: The default line width is 1 unit. When stroked, the line straddles the path, with half of the total width on either side.
            // Therefore, a 1 pixel vertical line will not draw crisply unless it is offest by 0.5. This problem does not seem to affect horizontal lines.
            CGContextSetLineWidth(context, 1.0);
            
            // Add the vertical lines
            
            CGContextMoveToPoint(context, 0.5, 0);
            CGContextAddLineToPoint(context,0.5, rect.size.height);
            
            CGContextMoveToPoint(context, rect.size.width/2+0.5, 0);
            CGContextAddLineToPoint(context, rect.size.width/2+0.5, rect.size.height);
            
            // Add bottom line
            CGContextMoveToPoint(context, 0, rect.size.height);
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height-0.5);
            
            // Draw the lines
            CGContextStrokePath(context);

        }
    }
    // Draw the lines
    CGContextStrokePath(context);
    
    
}
- (void)setText:(NSString *)text
{
    NSLog(@"SET TEXT : =================== : %@", text) ;
    _text = [text copy];
    [self setNeedsDisplay];
}

- ( void) setCurrentTable: ( int) int_currentTable
{
    NSLog(@"current table : =================== : %d", int_currentTable) ;
    _int_currentTable = int_currentTable;
    [self setNeedsDisplay];
    
}
@end
