
#import "ViewController.h"
#import "CauzQSSE_ViewController.h"
#import "AdequacyVC.h"
#import "ConsignmentVC.h"
#import "BeginFormVC.h"
#import "HSEQViewController.h"
#import "IncidentVC.h"
#import "AccidentsVC.h"
#import "PreventionPlanVC.h"
#import "HazardViewController.h"
#import "RiskAnalysisViewController.h"
#import "SecurityViewController.h"
#import "ArchivesViewController.h"
#import "Intervention.h"
#import "ReceptionViewController.h"
#import "ReceptionViewController1.h"


@interface ViewController ()
{
    BOOL bool_OnListSelection ;
}
@property ( nonatomic, strong) NSArray * array_List ;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [ self fun_SetProperty] ;
    [ self fun_LoadList] ;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Arial" size:24],
      NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    
    self.navigationItem.title=@"Digitalization";
    [scrollView setContentSize:(CGSizeMake(768, 1300))];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (bool_OnListSelection == true)
    {
        bool_OnListSelection=false;
        [self.btn_DropDown setImage:[ UIImage imageNamed:@"DownArrow"] forState:UIControlStateNormal];
        [ self fun_AnimateList : bool_OnListSelection == true ? 300 : 0] ;
        
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

- ( void) fun_SetProperty
{
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    [btnItem setTintColor:[ UIColor whiteColor]] ;
    self.navigationItem.backBarButtonItem = btnItem ;
    //    self.navigationItem.title=@"Digitalization";
    //    NSDictionary *textAttributes;
    //    textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
    //                      [UIFont fontWithName:@"LilitaOne" size:25.0f],NSFontAttributeName,
    //                      [UIColor whiteColor],NSForegroundColorAttributeName,
    //                      [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
    //
    //    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    
    
    self.array_List = @[@"QE7100TR DAR Analyse des  Risques",
                        @"QE7110TR PDP Plan de Prévention",
                        @"QE7130TR ATC Attestation de consignation",
                        @"QE7150TR CRV Causerie QSSE",
                        @"QE7160TR FSD Fiche de Situation Dangereuse ou incident",
                        @"QE7200TR DAR Examen d'adéquation et de conservation",
                        @"QE7230TR Compte-rendu d'accident à chaud",
                        @"QE7170TR VAS Visite d'Amélioration Sécurité",
                        @"QE7220TR PPS Emargement accueil chantier",
                        @"QU 434_4 Proces Verbal De Reception"] ;
    
    
    //@"QE7210TR Inventaire et suivi des équipements de sécurité"
    
    //self.btn_DropDown.backgroundColor = [ UIColor whiteColor] ;
    self.btn_DropDown.layer.borderWidth = 1.f ;
    self.btn_DropDown.layer.cornerRadius = 5 ;
    self.btn_DropDown.layer.borderColor = [[ UIColor blackColor] CGColor];
    [self.btn_DropDown setImage:[UIImage imageNamed:@"DownArrow"] forState:UIControlStateNormal];
    self.btn_DropDown.imageEdgeInsets = UIEdgeInsetsMake(0.0f,self.btn_DropDown.frame.size.width - 50, 0.0f,0.0f ) ;
    [self.btn_DropDown setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self.btn_DropDown.layer setMasksToBounds:YES]  ;
    
    //self.btn_Archives.backgroundColor = [ UIColor whiteColor] ;
    self.btn_Archives.layer.borderWidth = 1.f ;
    self.btn_Archives.layer.cornerRadius = 5 ;
    self.btn_Archives.layer.borderColor = [[ UIColor blackColor] CGColor];
    [self.btn_Archives.layer setMasksToBounds:YES]  ;
    
    [self.btn_Archives addTarget: self action:@selector(fun_NFDropDown:) forControlEvents:UIControlEventTouchUpInside] ;
    
    self.view.backgroundColor = [ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1] ;
}

- ( void) fun_ShowArchives
{
    NSLog(@"Archives") ;
    ArchivesViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"archives"];
    [self.navigationController pushViewController:controller animated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fun_NFDropDown:(id)sender
{
    if (sender == self.btn_DropDown)
    {
        bool_OnListSelection = !bool_OnListSelection ;
        (bool_OnListSelection == true) ? [self.btn_DropDown setImage:[ UIImage imageNamed:@"UpArrow"] forState:UIControlStateNormal] : [self.btn_DropDown setImage:[ UIImage imageNamed:@"DownArrow"] forState:UIControlStateNormal] ;
        [ self fun_AnimateList : bool_OnListSelection == true ? 300 : 0] ;

    }
    else if (sender == self.btn_Archives)
    {
        ArchivesViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"archives"];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- ( void) fun_LoadList
{
    //tbl_List = [[ UITableView alloc] initWithFrame: style:UITableViewStylePlain] ;
    //self.tbl_FormList.frame = CGRectMake(self.btn_DropDown.frame.origin.x , self.btn_DropDown.frame.origin.y + self.btn_DropDown.frame.size.height, self.btn_DropDown.frame.size.width, 0) ;
    self.tbl_FormList.delegate = self ;
    self.tbl_FormList.dataSource = self ;
    //    self.tbl_FormList.scrollEnabled = NO ;
    self.tbl_FormList.layer.cornerRadius = 5.0f ;
    self.tbl_FormList.layer.masksToBounds = YES ;
    self.tbl_FormList.hidden = YES ;
    [self.view bringSubviewToFront:self.tbl_FormList];
    //[ self.view addSubview:tbl_List] ;
}

- ( void) fun_AnimateList : ( int) heightToAnimate
{
    NSLog(@"Height to animate : %d", heightToAnimate) ;
    self.tbl_FormList.hidden = !self.tbl_FormList.hidden;
    self.btn_Archives.hidden=!self.tbl_FormList.hidden;
    NSLog(@"%f,%f", self.tbl_FormList.frame.size.width , self.tbl_FormList.frame.size.height) ;
    [UIView animateWithDuration:0.5f
                          delay:0.0
                        options: UIViewAnimationOptionTransitionNone
                     animations:^{
                         NSLog(@"Aniate") ;
                         CGRect frame = self.tbl_FormList.frame;
                         frame.size.height = heightToAnimate;
                         self.tbl_FormList.frame = CGRectMake(self.tbl_FormList.frame.origin.x, self.tbl_FormList.frame.origin.y, self.tbl_FormList.frame.size.width, frame.size.height);
                         NSLog(@"Frame = %@", NSStringFromCGRect(self.tbl_FormList.frame)) ;
                     }
                     completion:^(BOOL finished){
                     }];
}

//=====================================================================================================================================
#pragma mark >> TableView Delegate & datasource <<
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Called View controller ") ;
    return [self.array_List count] ;
}
//=====================================================================================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0) ;
    NSString *cellIdentifier = [NSString stringWithFormat:@"Cell%ld",(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.array_List[indexPath.row] ;
    //  UIView *backView1 = [[UIView alloc] initWithFrame:CGRectZero] ;
    //  backView1.backgroundColor = UIColorFromRGB(0xb7d9ef);
    ///  cell.selectedBackgroundView = backView1;
    return cell;
}
//=====================================================================================================================================
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:14];
}
//=====================================================================================================================================
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.btn_DropDown setImage:[ UIImage imageNamed:@"DownArrow"] forState:UIControlStateNormal];
    bool_OnListSelection = false ;
    [ self fun_AnimateList : bool_OnListSelection == true ? 300 : 0] ;
    NSLog(@"Did select row at index path") ;
    if (indexPath.row==0)
    {
        RiskAnalysisViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"riskanalysis"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if (indexPath.row == 1)
    {
        PreventionPlanVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"prevention"];
        [self.navigationController pushViewController:controller animated:YES] ;
    }
    else if (indexPath.row == 2)
    {
        ConsignmentVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"consignment"];
        [self.navigationController pushViewController:controller animated:YES] ;
    }
    else if (indexPath.row == 3)
    {
        CauzQSSE_ViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"qsseform"];
        [self.navigationController pushViewController:controller animated:YES] ;
    }
    else if (indexPath.row == 4)
    {
        HazardViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"hazardous"];
        [self.navigationController pushViewController:controller animated:YES] ;
    }
    else if ( indexPath.row == 5)
    {
        AdequacyVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"adequacy"];
        [self.navigationController pushViewController:controller animated:YES] ;
    }
    else if ( indexPath.row == 6)
    {
        AccidentsVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"accident"];
        [self.navigationController pushViewController:controller animated:YES] ;
    }
    else if (indexPath.row == 7)
    {
        SecurityViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"security"];
        [self.navigationController pushViewController:controller animated:YES] ;
    }
    else if ( indexPath.row == 8)
    {
        BeginFormVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"beginform"];
        [self.navigationController pushViewController:controller animated:YES] ;
    }
    else if ( indexPath.row == 9)
    {
        ReceptionViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"reception"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES] ;
}
//=====================================================================================================================================
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30 ;
}


@end
