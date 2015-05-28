

#import "HSEQViewController.h"
#import "DBSqlite.h"
#import "ScrollViewToPDF.h"

@interface HSEQViewController ()

@end

@implementation HSEQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1,524
    [scrollView setContentSize:(CGSizeMake(768, 1584))];
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    
    UIBarButtonItem * saveButton = [[ UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveToDataBase)] ;
    UIBarButtonItem * pdfButton = [[ UIBarButtonItem alloc] initWithTitle:@"PDF" style:UIBarButtonItemStyleDone target:self action:@selector(openPerPagePDF)] ;
    self.navigationItem.rightBarButtonItem = pdfButton ;
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,saveButton, nil];
    self.navigationItem.rightBarButtonItems = arry ;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)saveToDataBase
{
    
    //    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"CongestionID"] isEqual:[NSNull null]]) {
    //        i=0;
    //    }
    //    else{
    //        i = [[[NSUserDefaults standardUserDefaults]valueForKey:@"CongestionID"]intValue];
    //        i++;
    //    }
    //    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",i] forKey:@"CongestionID"];
    
    // NSString *strQuery = [NSString stringWithFormat:@"insert into qsse(qsse_id,pole_qsse,reference,animateur,date,theme,nom_prenom_1,nom_prenom_2,nom_prenom_3,nom_prenom_4,nom_prenom_5,nom_prenom_6,nom_prenom_7,nom_prenom_8,nom_prenom_9,nom_prenom_10,sign_1,sign_2,sign_3,sign_4,sign_5,sign_6,sign_7,sign_8,sign_9,sign_10,commentaires,remarques,propositions,pilote,delai,realise) values (\"%d\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\")",i,self.txt_poleqsse, self.txt_Reference, self.txt_animateur,self.txt_date,self.txt_Theme,self.txt_nom_prenom1,self.txt_nom_prenom2,self.txt_nom_prenom3,self.txt_nom_prenom4,self.txt_nom_prenom5,self.txt_nom_prenom6,self.txt_nom_prenom7,self.txt_nom_prenom8,self.txt_nom_prenom9,self.txt_nom_prenom10,self.img_Sign1,self.img_Sign2,self.img_Sign3,self.img_Sign4,self.img_Sign5,self.img_Sign6,self.img_Sign7,self.img_Sign8,self.img_Sign9,self.img_Sign10,self.txt_Commentaires,self.txt_Remarques];
    
    // [[DBSqlite dbManager]insertStatement:strQuery];
}

#pragma mark - PDF Creation

- (IBAction)openPerPagePDF:(id)sender {
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:scrollView];
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSString *path = [tmpDirectory stringByAppendingPathComponent:@"image.pdf"];
    [pdfData writeToFile:path atomically:NO];
    NSLog(@"tmpDirectory: %@",path);
    
    [self openPath:path];
}

- (void)openPath:(NSString *)pathString {
    
    NSURL *path = [NSURL fileURLWithPath:pathString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:path];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    webView.scalesPageToFit = YES;
    [webView loadRequest:urlRequest];
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view = webView;
    [self.navigationController pushViewController:viewController animated:YES];
    
    //system([[NSString stringWithFormat:@"open '%@'", self.pdfPath] cStringUsingEncoding:NSUTF8StringEncoding]);
    
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
