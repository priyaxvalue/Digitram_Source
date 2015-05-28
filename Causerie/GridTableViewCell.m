

#import "GridTableViewCell.h"

#define cell1Width 300
#define cell2Width 150
#define cell3Width 130
#define cell4Width 150
#define R2_cellHeight_Heading 44
#define R2_cellHeight_Body 100

#define R1_cellWidth 365
#define R1_cellHeight 71

@implementation GridTableViewCell

@synthesize lineColor, topCell, cell1, cell2, cell3,cell4,cell5, cell6, cell7, cell8, cell1_Participant, cell2_Participant, cell_Name, cell_Signature;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"Total number of times called") ;
        topCell = NO;
//        if (self.isParticipant == false)
//        {

		// Add labels for the three cells
            cell1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell1Width, R2_cellHeight_Heading)];
            cell1.textAlignment = NSTextAlignmentCenter;
            cell1.font=[UIFont systemFontOfSize:14];
            cell1.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell1];
            
            cell2 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width, 0, cell2Width, R2_cellHeight_Heading)];
            cell2.textAlignment = NSTextAlignmentCenter;
            cell2.font=[UIFont systemFontOfSize:14];
            //cell2.delegate=self;
            
            cell2.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell2];
            
            cell3 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+cell2Width, 0, cell3Width, R2_cellHeight_Heading)]; // Note - hardcoded 320 is not ideal; this can be done better
            cell3.textAlignment = NSTextAlignmentCenter;
            cell3.font=[UIFont systemFontOfSize:14];
            
            cell3.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell3];
            
            cell4 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+cell2Width+cell3Width, 0, cell4Width, R2_cellHeight_Heading)]; // Note - hardcoded 320 is not ideal; this can be done better
            //cell4.delegate=self;
            cell4.textAlignment = NSTextAlignmentCenter;
            cell4.font=[UIFont systemFontOfSize:14];
            
            cell4.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell4];
            
            cell5 = [[UITextView alloc] initWithFrame:CGRectMake(0,0,cell1Width, R2_cellHeight_Body)]; // Note - hardcoded 320 is not ideal; this can be done better
            cell5.textAlignment = NSTextAlignmentLeft;
            cell5.font=[UIFont systemFontOfSize:14];
            
            cell5.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell5];
            
            cell6 = [[UITextView alloc] initWithFrame:CGRectMake(cell1Width, 0, cell2Width, R2_cellHeight_Body)];
            cell6.textAlignment = NSTextAlignmentLeft;
            cell6.font=[UIFont systemFontOfSize:14];
            //cell2.delegate=self;
            
            cell6.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell6];
            
            cell7 = [[UITextView alloc] initWithFrame:CGRectMake(cell1Width+cell2Width, 0, cell3Width, R2_cellHeight_Body)]; // Note - hardcoded 320 is not ideal; this can be done better
            cell7.textAlignment = NSTextAlignmentLeft;
            cell7.font=[UIFont systemFontOfSize:14];
            
            cell7.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell7];
            
            cell8 = [[UITextView alloc] initWithFrame:CGRectMake(cell1Width+cell2Width+cell3Width, 0, cell4Width, R2_cellHeight_Body)]; // Note - hardcoded 320 is not ideal; this can be done better
            //cell4.delegate=self;
            cell8.textAlignment = NSTextAlignmentLeft;
            cell8.font=[UIFont systemFontOfSize:14];
            
            cell8.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell8];
//        }
//        else
//        {
            NSLog(@"CELL CREATED") ;
            cell1_Participant = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, R1_cellWidth, R1_cellHeight)];
            cell1_Participant.textAlignment = NSTextAlignmentCenter;
            cell1_Participant.font=[UIFont systemFontOfSize:14];
            cell1_Participant.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell1_Participant];
        
            cell2_Participant = [[UILabel alloc] initWithFrame:CGRectMake(R1_cellWidth, 0, R1_cellWidth, R1_cellHeight)];
            cell2_Participant.textAlignment = NSTextAlignmentCenter;
            cell2_Participant.font=[UIFont systemFontOfSize:14];
            //cell2.delegate=self;
        
            cell2_Participant.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell2_Participant];
        
        for (int i = 0; i < 4; i++)
        {
            cell_Name = [[UITextView alloc] initWithFrame:CGRectMake(0, i*R1_cellHeight, R1_cellWidth, R1_cellHeight)];
            cell_Name.textAlignment = NSTextAlignmentLeft;
            cell_Name.font=[UIFont systemFontOfSize:14];
            cell_Name.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            cell_Name.tag = i+1 ;
            [self addSubview:cell_Name];
            
            cell_Signature = [[ UIImageView alloc] initWithFrame:CGRectMake(R1_cellWidth, i*R1_cellHeight, R1_cellWidth, R1_cellHeight)];
            [ self addSubview:cell_Signature] ;

        }
       // }
        [ self setNeedsDisplay] ;
    }
    return self;
}


/*- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField==cell2) {
        [textField becomeFirstResponder];
    }
    if (textField==cell4) {
        [textField becomeFirstResponder];
    }
        return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    [textField endEditing:YES];
    return YES;
}*/
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetStrokeColorWithColor(context, lineColor.CGColor);       
	 
	// CGContextSetLineWidth: The default line width is 1 unit. When stroked, the line straddles the path, with half of the total width on either side.
	// Therefore, a 1 pixel vertical line will not draw crisply unless it is offest by 0.5. This problem does not seem to affect horizontal lines.
	CGContextSetLineWidth(context, 1.0);
    if (self.isParticipant == false)
    {
        // Add the vertical lines
        CGContextMoveToPoint(context, 0.5, 0);
        CGContextAddLineToPoint(context,0.5, rect.size.height);
        
        CGContextMoveToPoint(context, cell1Width+0.5, 0);
        CGContextAddLineToPoint(context, cell1Width+0.5, rect.size.height);
        
        CGContextMoveToPoint(context, cell1Width+cell2Width+0.5, 0);
        CGContextAddLineToPoint(context, cell1Width+cell2Width+0.5, rect.size.height);
        
        CGContextMoveToPoint(context, cell1Width+cell2Width+cell3Width+0.5, 0);
        CGContextAddLineToPoint(context, cell1Width+cell2Width+cell3Width+0.5, rect.size.height);
        
        CGContextMoveToPoint(context, cell1Width+cell2Width+cell3Width+cell4Width, 0);
        CGContextAddLineToPoint(context,cell1Width+cell2Width+cell3Width+cell4Width, rect.size.height);


    }
    else
    {
        // Add the vertical lines

	CGContextMoveToPoint(context, 0.5, 0);
	CGContextAddLineToPoint(context,0.5, rect.size.height);

	CGContextMoveToPoint(context, R1_cellWidth+0.5, 0);
	CGContextAddLineToPoint(context, R1_cellWidth+0.5, rect.size.height);

    }
    // Add bottom line
    CGContextMoveToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height-0.5);

	// If this is the topmost cell in the table, draw the line on top
	if (topCell)
	{
		CGContextMoveToPoint(context, 0, 0);
		CGContextAddLineToPoint(context, rect.size.width, 0);
	}

	// Draw the lines
	CGContextStrokePath(context);
}

- (void)setTopCell:(BOOL)newTopCell
{
	topCell = newTopCell;
	[self setNeedsDisplay];
}

@end
