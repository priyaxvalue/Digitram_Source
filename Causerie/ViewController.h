
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController < UITableViewDataSource ,  UITableViewDelegate >
{
    IBOutlet UIScrollView *scrollView;
    
}
@property (strong, nonatomic) IBOutlet UIButton *btn_DropDown;
- (IBAction)fun_NFDropDown:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tbl_FormList;
@property (strong, nonatomic) IBOutlet UIButton *btn_Archives;


@end

