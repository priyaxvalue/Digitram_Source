
#import <UIKit/UIKit.h>


@interface GridTableViewCell : UITableViewCell<UITextFieldDelegate> {
	
	UIColor *lineColor;
	BOOL topCell;
	
	UILabel *cell1;
	UILabel *cell2;
	UILabel *cell3;
	UILabel *cell4;
    
    UITextView *cell5;
    UITextView* cell6;
    UITextView* cell7;
    UITextView* cell8;
    
    UILabel * cell1_Participant ;
    UILabel * cell2_Participant ;
}

@property (nonatomic, retain) UIColor* lineColor;
@property (nonatomic) BOOL topCell;
@property ( nonatomic) BOOL isParticipant ;
@property (readonly) UILabel* cell1;
@property (readonly) UILabel* cell2;
@property (readonly) UILabel* cell3;
@property (readonly) UILabel* cell4;
@property (nonatomic, strong) UITextView* cell5;
@property (nonatomic, strong) UITextView* cell6;
@property (nonatomic, strong) UITextView* cell7;
@property (nonatomic, strong) UITextView* cell8 ;
@property ( nonatomic, strong) UITextView * cell_Name ;
@property ( nonatomic, strong) UIImageView * cell_Signature ;
@property ( readonly) UILabel * cell1_Participant ;
@property ( readonly) UILabel * cell2_Participant ;



@end
