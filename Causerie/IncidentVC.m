
#import "IncidentVC.h"

@interface IncidentVC ()

@end

@implementation IncidentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1,924
    [scrollView setContentSize:(CGSizeMake(768, 1924))];
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
