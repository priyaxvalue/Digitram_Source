//
//  CauzQSSE_ViewController.m
//  hero
//
//
//

#import "CauzQSSE_ViewController.h"
#import "ScrollViewToPDF.h"
#import "SignaVC.h"
#import <QuartzCore/QuartzCore.h>
#import "CauserieQSSEViewController.h"

@interface CauzQSSE_ViewController () <MFMailComposeViewControllerDelegate, SignaVCDelegate,UITextFieldDelegate>

@end

@implementation CauzQSSE_ViewController

@synthesize txt_poleqsse,txt_Reference,txt_animateur,txt_date,txt_Themes,txt_nom_prenom1,txt_nom_prenom2,txt_nom_prenom3,txt_nom_prenom4,txt_nom_prenom5,txt_nom_prenom6,txt_nom_prenom7,txt_nom_prenom8,txt_nom_prenom9,txt_nom_prenom10,txt_Commentaires,txt_Remarques,txt_Proposition,txt_Pilote,txt_Delai,txt_Realise,txt_Nom;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fun_SetProperties] ;
    saved_Into_DB=NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    NSLog(@"The retried array is %@", self.retrievedarray);
    
    if (self.IsForUpdating==YES)
    {
        
        txt_poleqsse.text=(self.retrievedarray)[0] [@"pole_qsse"];
        txt_Reference.text=(self.retrievedarray)[0] [@"reference"];
        txt_animateur.text=(self.retrievedarray)[0] [@"animateur"];
        txt_date.text=(self.retrievedarray)[0] [@"date"];
        txt_Themes.text=(self.retrievedarray)[0] [@"theme"];
        
        txt_nom_prenom1.text=(self.retrievedarray)[0] [@"nom_prenom_1"];
        txt_nom_prenom2.text=(self.retrievedarray)[0] [@"nom_prenom_2"];
        txt_nom_prenom3.text=(self.retrievedarray)[0] [@"nom_prenom_3"];
        txt_nom_prenom4.text=(self.retrievedarray)[0] [@"nom_prenom_4"];
        txt_nom_prenom5.text=(self.retrievedarray)[0] [@"nom_prenom_5"];
        txt_nom_prenom6.text=(self.retrievedarray)[0] [@"nom_prenom_6"];
        txt_nom_prenom7.text=(self.retrievedarray)[0] [@"nom_prenom_7"];
        txt_nom_prenom8.text=(self.retrievedarray)[0] [@"nom_prenom_8"];
        txt_nom_prenom9.text=(self.retrievedarray)[0] [@"nom_prenom_9"];
        txt_nom_prenom10.text=(self.retrievedarray)[0] [@"nom_prenom_10"];
        
        
        NSString *datas1=(self.retrievedarray)[0][@"sign_1"];
        NSData *data1=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image1=[[UIImage alloc]init];
        image1=[UIImage imageWithData:data1];
        [self.img_Sign1 setImage:image1];
        
        NSString *datas2=(self.retrievedarray)[0][@"sign_2"];
        NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image2=[[UIImage alloc]init];
        image2=[UIImage imageWithData:data2];
        [self.img_Sign2 setImage:image2];
        
        NSString *datas3=(self.retrievedarray)[0][@"sign_3"];
        NSData *data3=[[NSData alloc]initWithBase64EncodedData:datas3 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image3=[[UIImage alloc]init];
        image3=[UIImage imageWithData:data3];
        [self.img_Sign3 setImage:image3];
        
        NSString *datas4=(self.retrievedarray)[0][@"sign_4"];
        NSData *data4=[[NSData alloc]initWithBase64EncodedData:datas4 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image4=[[UIImage alloc]init];
        image4=[UIImage imageWithData:data4];
        [self.img_Sign4 setImage:image4];
        
        NSString *datas5=(self.retrievedarray)[0][@"sign_5"];
        NSData *data5=[[NSData alloc]initWithBase64EncodedData:datas5 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image5=[[UIImage alloc]init];
        image5=[UIImage imageWithData:data5];
        [self.img_Sign5 setImage:image5];
        
        NSString *datas6=(self.retrievedarray)[0][@"sign_6"];
        NSData *data6=[[NSData alloc]initWithBase64EncodedData:datas6 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image6=[[UIImage alloc]init];
        image6=[UIImage imageWithData:data6];
        [self.img_Sign6 setImage:image6];
        
        NSString *datas7=(self.retrievedarray)[0][@"sign_7"];
        NSData *data7=[[NSData alloc]initWithBase64EncodedData:datas7 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image7=[[UIImage alloc]init];
        image7=[UIImage imageWithData:data7];
        [self.img_Sign7 setImage:image7];
        
        
        NSString *datas8=(self.retrievedarray)[0][@"sign_8"];
        NSData *data8=[[NSData alloc]initWithBase64EncodedData:datas8 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image8=[[UIImage alloc]init];
        image8=[UIImage imageWithData:data8];
        [self.img_Sign8 setImage:image8];
        
        NSString *datas9=(self.retrievedarray)[0][@"sign_9"];
        NSData *data9=[[NSData alloc]initWithBase64EncodedData:datas9 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image9=[[UIImage alloc]init];
        image9=[UIImage imageWithData:data9];
        [self.img_Sign9 setImage:image9];
        
        NSString *datas10=(self.retrievedarray)[0][@"sign_10"];
        NSData *data10=[[NSData alloc]initWithBase64EncodedData:datas10 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image10=[[UIImage alloc]init];
        image10=[UIImage imageWithData:data10];
        [self.img_Sign10 setImage:image10];
        
        txt_Commentaires.text=(self.retrievedarray)[0] [@"commentaires"];
        txt_Remarques.text=(self.retrievedarray)[0] [@"remarques"];
        txt_Proposition.text=(self.retrievedarray)[0] [@"propositions"];
        
        txt_Pilote.text=(self.retrievedarray)[0] [@"pilote"];
        txt_Delai.text=(self.retrievedarray)[0] [@"delai"];
        txt_Realise.text=(self.retrievedarray)[0] [@"realise"];
        
        txt_Nom.text=(self.retrievedarray)[0] [@"fin_nom"];
        
        NSString *datas11=(self.retrievedarray)[0][@"fin_sign_11"];
        NSData *data11=[[NSData alloc]initWithBase64EncodedData:datas11 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image11=[[UIImage alloc]init];
        image11=[UIImage imageWithData:data11];
        [self.img_Signature_Nom setImage:image11];
        
    }
    txt_nom_prenom1.delegate=self;
    txt_nom_prenom2.delegate=self;
    txt_nom_prenom3.delegate=self;
    txt_nom_prenom4.delegate=self;
    txt_nom_prenom5.delegate=self;
    txt_nom_prenom6.delegate=self;
    txt_nom_prenom7.delegate=self;
    txt_nom_prenom8.delegate=self;
    txt_nom_prenom9.delegate=self;
    txt_nom_prenom10.delegate=self;
    txt_Commentaires.delegate=self;
    txt_Remarques.delegate=self;
    
    txt_Proposition.delegate=self;
    txt_Pilote.delegate=self;
    txt_Delai.delegate=self;
    txt_Realise.delegate=self;
}

- ( void) fun_SetProperties
{
    str_DocumentName = @"QE7150TR CRV Causerie QSSE" ;
    self.title = str_DocumentName ;
    self.txt_Nom.delegate = self ;
    // Created and modified date as of now
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;
    
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    
    [self.scrl_View setContentSize:(CGSizeMake(768, 2750))];
    
    self.lbl_CauserieQsse.layer.borderColor = [[ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1]CGColor] ;
    self.lbl_CauserieQsse.layer.cornerRadius = 2.5f ;
    
    savebut = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(redirect)];
    
    //saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(saveToDataBase:)] ;
    
    self.navigationItem.rightBarButtonItem = pdfButton ;
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,savebut, nil];
    self.navigationItem.rightBarButtonItems = arry ;
    
    self.lbl_Heading.layer.borderWidth = 3 ;
    self.lbl_Heading.layer.cornerRadius = 5.0f ;
    self.lbl_Heading.layer.borderColor = [[ UIColor colorWithRed:0/255.0f green:149/255.0f blue:148/255.0f alpha:1] CGColor] ;
    self.lbl_Heading.layer.masksToBounds = YES ;
    
    self.txt_Commentaires.layer.borderColor = [[ UIColor blackColor] CGColor] ;
    self.txt_Commentaires.layer.borderWidth = 1;
    self.txt_Commentaires.layer.cornerRadius = 5.0f ;
    
    self.txt_Remarques.layer.borderColor = [[ UIColor blackColor] CGColor] ;
    self.txt_Remarques.layer.borderWidth = 1;
    self.txt_Remarques.layer.cornerRadius = 5.0f ;
    
    self.txt_nom_prenom1.text = @"" ;
    self.txt_nom_prenom2.text = @"" ;
    self.txt_nom_prenom3.text = @"" ;
    self.txt_nom_prenom4.text = @"" ;
    self.txt_nom_prenom5.text = @"" ;
    self.txt_nom_prenom6.text = @"" ;
    self.txt_nom_prenom7.text = @"" ;
    self.txt_nom_prenom8.text = @"" ;
    self.txt_nom_prenom9.text = @"" ;
    self.txt_nom_prenom10.text = @"" ;
    
    self.img_Signature_Nom.layer.borderWidth=1.0;
    self.img_Signature_Nom.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.txt_Nom.layer.borderWidth=1.0;
    self.txt_Nom.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    [self.btn_Edit1 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit1.tag = 1 ;
    [self.btn_Edit2 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit2.tag = 2 ;
    
    [self.btn_Edit3 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit3.tag = 3 ;
    
    [self.btn_Edit4 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit4.tag = 4 ;
    
    [self.btn_Edit5 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit5.tag = 5 ;
    
    [self.btn_Edit6 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit6.tag = 6 ;
    
    [self.btn_Edit7 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit7.tag = 7 ;
    
    [self.btn_Edit8 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit8.tag = 8 ;
    
    [self.btn_Edit9 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit9.tag = 9 ;
    
    [self.btn_Edit10 addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit10.tag = 10 ;
    
    [self.btn_Edit addTarget:self action:@selector(fun_OnEditSignature:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit.tag = 11 ;
    [ self showDatePicker] ;
    self.lastview.layer.borderWidth=1.0;
    self.sigview.layer.borderWidth=1.0;
}

-(void)redirect
{
    NSString * str_Sign1 = [ self encodeToBase64String:self.img_Sign1.image] ;
    NSString * str_Sign2 = [ self encodeToBase64String:self.img_Sign2.image] ;
    NSString * str_Sign3 = [ self encodeToBase64String:self.img_Sign3.image] ;
    NSString * str_Sign4 = [ self encodeToBase64String:self.img_Sign4.image] ;
    NSString * str_Sign5 = [ self encodeToBase64String:self.img_Sign5.image] ;
    NSString * str_Sign6 = [ self encodeToBase64String:self.img_Sign6.image] ;
    NSString * str_Sign7 = [ self encodeToBase64String:self.img_Sign7.image] ;
    NSString * str_Sign8 = [ self encodeToBase64String:self.img_Sign8.image] ;
    NSString * str_Sign9 = [ self encodeToBase64String:self.img_Sign9.image] ;
    NSString * str_Sign10 = [ self encodeToBase64String:self.img_Sign10.image] ;
    NSString * str_Sign11 = [ self encodeToBase64String:self.img_Signature_Nom.image];
    
    NSMutableArray *arraydata=[[NSMutableArray alloc]initWithObjects: self.txt_poleqsse.text, self.txt_Reference.text, self.txt_animateur.text,self.txt_date.text,self.txt_Themes.text,self.txt_nom_prenom1.text,self.txt_nom_prenom2.text,self.txt_nom_prenom3.text,self.txt_nom_prenom4.text,self.txt_nom_prenom5.text,self.txt_nom_prenom6.text,self.txt_nom_prenom7.text,self.txt_nom_prenom8.text,self.txt_nom_prenom9.text,self.txt_nom_prenom10.text,self.txt_Commentaires.text,self.txt_Remarques.text,self.txt_Proposition.text,self.txt_Pilote.text,self.txt_Delai.text,self.txt_Realise.text,self.txt_Nom.text,nil];
    
    NSMutableArray *arrayimage1=[[NSMutableArray alloc]initWithObjects:str_Sign1, nil];
    NSMutableArray *arrayimage2=[[NSMutableArray alloc]initWithObjects:str_Sign2, nil];
    NSMutableArray *arrayimage3=[[NSMutableArray alloc]initWithObjects:str_Sign3, nil];
    NSMutableArray *arrayimage4=[[NSMutableArray alloc]initWithObjects:str_Sign4, nil];
    NSMutableArray *arrayimage5=[[NSMutableArray alloc]initWithObjects:str_Sign5, nil];
    NSMutableArray *arrayimage6=[[NSMutableArray alloc]initWithObjects:str_Sign6, nil];
    NSMutableArray *arrayimage7=[[NSMutableArray alloc]initWithObjects:str_Sign7, nil];
    NSMutableArray *arrayimage8=[[NSMutableArray alloc]initWithObjects:str_Sign8, nil];
    NSMutableArray *arrayimage9=[[NSMutableArray alloc]initWithObjects:str_Sign9, nil];
    NSMutableArray *arrayimage10=[[NSMutableArray alloc]initWithObjects:str_Sign10, nil];
    NSMutableArray *arrayimage11=[[NSMutableArray alloc]initWithObjects:str_Sign11, nil];
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CauserieQSSEViewController *cqvc=[sb instantiateViewControllerWithIdentifier:@"qsseformnew"];
    cqvc.dataarray=arraydata;
    cqvc.imagearray1=arrayimage1;
    cqvc.imagearray2=arrayimage2;
    cqvc.imagearray3=arrayimage3;
    cqvc.imagearray4=arrayimage4;
    cqvc.imagearray5=arrayimage5;
    cqvc.imagearray6=arrayimage6;
    cqvc.imagearray7=arrayimage7;
    cqvc.imagearray8=arrayimage8;
    cqvc.imagearray9=arrayimage9;
    cqvc.imagearray10=arrayimage10;
    cqvc.imagearray11=arrayimage11;
    
    if (self.IsForUpdating==YES)
    {
        cqvc.IsForUpdating=YES;
    }
    cqvc.confirmpdf=YES;
    [self.navigationController pushViewController:cqvc animated:YES];
}

-(void)showDatePicker
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.txt_date setInputView:datePicker];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField==self.txt_Nom)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.view.transform =  CGAffineTransformMakeTranslation(0, -125);
        }];
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0,0) ;
    }] ;
    [textField resignFirstResponder];
    return YES;
}

-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.txt_date.inputView;
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.txt_date.text = [NSString stringWithFormat:@"%@",dateString];
}
-(UIImage *) imageWithView:(UIImageView *)view
{
    NSLog(@"Image With View") ;
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
- ( void) fun_OnEditSignature : ( UIButton * ) sender
{
    [self.view endEditing:YES];
    switch (sender.tag)
    {
        case 1:
            currentImageView = self.img_Sign1 ;
            break;
        case 2:
            currentImageView = self.img_Sign2 ;
            break;
        case 3:
            currentImageView = self.img_Sign3 ;
            break;
        case 4:
            currentImageView = self.img_Sign4 ;
            break;
        case 5:
            currentImageView = self.img_Sign5 ;
            break;
        case 6:
            currentImageView = self.img_Sign6 ;
            break;
        case 7:
            currentImageView = self.img_Sign7 ;
            break;
        case 8:
            currentImageView = self.img_Sign8 ;
            break;
        case 9:
            currentImageView = self.img_Sign9 ;
            break;
        case 10:
            currentImageView = self.img_Sign10 ;
            break;
        case 11:
            currentImageView = self.img_Signature_Nom ;
            break;
        default:
            break;
    }
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
    svc.delegate=self;
    [self.navigationController pushViewController:svc animated:NO];
}

#pragma mark Signature delegate

-(void)sendImgData:(UIImage *)image;
{
    UIImageView *imageView;
    imageView = currentImageView ;
    imageView.image=image;
    if (sig1clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:801];
        sig1clicked=NO;
    }
    else
    {
        
    }
    
    imageView.image=image;
}


-(void)confirm :(UIBarButtonItem *)currentBarButton
{
    self.bbbbb=currentBarButton;
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Confirmer"
                                                        message:@"Voulez-vous sauver?" delegate:self
                                              cancelButtonTitle:@"OUI" otherButtonTitles:@"NON", nil];
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex==0)
    {
        [self saveToDataBase:self.bbbbb];
    }
    else if(buttonIndex==1)
    {
        [alertView removeFromSuperview];
    }
    
}

- ( void) fun_RemoveFromManager :  ( NSString *) currentDocumentName
{
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    NSString *fullPath = [docpath stringByAppendingPathComponent:currentDocumentName];
    NSError *error = nil;
    NSFileManager *fl = [NSFileManager defaultManager];
    if([fl fileExistsAtPath:docpath])
    {
        BOOL removeSuccess = [fl removeItemAtPath:fullPath error:&error];
        if(removeSuccess){
            NSLog(@"File removed") ;
        }
        else {
            NSLog(@"File not removed") ;
        }
    }
}


-(void)saveToDataBase : ( UIBarButtonItem *) currentBarButton
{
    int  nnn;
    NSDateFormatter *forma=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [forma setDateFormat:@"dd-MM-YYYY"] ;
    NSString *datestring12 = [forma stringFromDate:now];
    
    NSString * str_Sign1 = [ self encodeToBase64String:self.img_Sign1.image] ;
    NSString * str_Sign2 = [ self encodeToBase64String:self.img_Sign2.image] ;
    NSString * str_Sign3 = [ self encodeToBase64String:self.img_Sign3.image] ;
    NSString * str_Sign4 = [ self encodeToBase64String:self.img_Sign4.image] ;
    NSString * str_Sign5 = [ self encodeToBase64String:self.img_Sign5.image] ;
    NSString * str_Sign6 = [ self encodeToBase64String:self.img_Sign6.image] ;
    NSString * str_Sign7 = [ self encodeToBase64String:self.img_Sign7.image] ;
    NSString * str_Sign8 = [ self encodeToBase64String:self.img_Sign8.image] ;
    NSString * str_Sign9 = [ self encodeToBase64String:self.img_Sign9.image] ;
    NSString * str_Sign10 = [ self encodeToBase64String:self.img_Sign10.image] ;
    NSString * str_Sign11 = [ self encodeToBase64String:self.img_Signature_Nom.image];
    
    if (self.IsForUpdating==YES)
    {
        if (self.retrievedarray!=nil)
        {
        NSLog(@"retrive:%@",self.retrievedarray);
        NSLog(@"retrive:%@",(self.retrievedarray)[0][@"qsse_id"]);
            NSString *str=(self.retrievedarray)[0][@"qsse_id"];
            nnn=[str intValue];
        }
        else
        {
            NSString * str_GetCount = @"SELECT qsse_id FROM qsse" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            nnn =  CurrentCount;
        }
        
        [self fun_RemoveFromManager:str_DocumentName];
        [self openPerPagePDF] ;
        NSString *updateSQL = [NSString stringWithFormat:
                               @"update qsse set doc_name='%@',doc_modified_date='%@',pole_qsse='%@',reference='%@',animateur='%@',date='%@',theme='%@',nom_prenom_1='%@',nom_prenom_2='%@',nom_prenom_3='%@',nom_prenom_4='%@',nom_prenom_5='%@',nom_prenom_6='%@',nom_prenom_7='%@',nom_prenom_8='%@',nom_prenom_9='%@',nom_prenom_10='%@',sign_1='%@',sign_2='%@',sign_3='%@',sign_4='%@',sign_5='%@',sign_6='%@',sign_7='%@',sign_8='%@',sign_9='%@',sign_10='%@',commentaires='%@',remarques='%@',propositions='%@',pilote='%@',delai='%@',realise='%@',fin_nom='%@',fin_sign_11='%@' where qsse_id='%ld'", str_DocumentName,datestring12,txt_poleqsse.text,self.txt_Reference.text,self.txt_animateur.text,self.txt_date.text,self.txt_Themes.text,self.txt_nom_prenom1.text,self.txt_nom_prenom2.text,self.txt_nom_prenom3.text,self.txt_nom_prenom4.text,self.txt_nom_prenom5.text,self.txt_nom_prenom6.text,self.txt_nom_prenom7.text,self.txt_nom_prenom8.text,self.txt_nom_prenom9.text,self.txt_nom_prenom10.text,str_Sign1,str_Sign2,str_Sign3,str_Sign4,str_Sign5,str_Sign6,str_Sign7,str_Sign8,str_Sign9,str_Sign10,self.txt_Commentaires.text,self.txt_Remarques.text,self.txt_Proposition.text,self.txt_Pilote.text,self.txt_Delai.text,self.txt_Realise.text,self.txt_Nom.text,str_Sign11,(long)nnn];
        [[ DBSqlite dbManager] updateStatement:updateSQL];
    }
    else
    {
        if(saved_Into_DB==NO)
        {
            [self openPerPagePDF] ;
            NSString * str_GetCount = @"SELECT qsse_id FROM qsse" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSString *strQuery = [NSString stringWithFormat:@"insert into qsse(doc_name,doc_created_date,doc_modified_date,qsse_id,pole_qsse,reference,animateur,date,theme,nom_prenom_1,nom_prenom_2,nom_prenom_3,nom_prenom_4,nom_prenom_5,nom_prenom_6,nom_prenom_7,nom_prenom_8,nom_prenom_9,nom_prenom_10,sign_1,sign_2,sign_3,sign_4,sign_5,sign_6,sign_7,sign_8,sign_9,sign_10,commentaires,remarques,propositions,pilote,delai,realise,fin_nom,fin_sign_11) values (\"%@\",\"%@\",\"%@\",\"%d\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\",\"%@\",\"%@\")",str_DocumentName,str_CreatedDate,str_CreatedDate,++CurrentCount,self.txt_poleqsse.text, self.txt_Reference.text, self.txt_animateur.text,self.txt_date.text,self.txt_Themes.text,self.txt_nom_prenom1.text,self.txt_nom_prenom2.text,self.txt_nom_prenom3.text,self.txt_nom_prenom4.text,self.txt_nom_prenom5.text,self.txt_nom_prenom6.text,self.txt_nom_prenom7.text,self.txt_nom_prenom8.text,self.txt_nom_prenom9.text,self.txt_nom_prenom10.text,str_Sign1,str_Sign2,str_Sign3,str_Sign4,str_Sign5,str_Sign6,str_Sign7,str_Sign8,str_Sign9,str_Sign10,self.txt_Commentaires.text,self.txt_Remarques.text,self.txt_Proposition.text,self.txt_Pilote.text,self.txt_Delai.text,self.txt_Realise.text,self.txt_Nom.text,str_Sign11];
            [[DBSqlite dbManager]insertStatement:strQuery];
            self.IsForUpdating=YES;
            saved_Into_DB=YES;
        }
        
        else if(saved_Into_DB==YES)
        {
            NSString * str_GetCount = @"SELECT qsse_id FROM qsse" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount];
            NSString *updateSQL = [NSString stringWithFormat:
                                   @"update qsse set doc_name='%@',doc_modified_date='%@',pole_qsse='%@',reference='%@',animateur='%@',date='%@',theme='%@',nom_prenom_1='%@',nom_prenom_2='%@',nom_prenom_3='%@',nom_prenom_4='%@',nom_prenom_5='%@',nom_prenom_6='%@',nom_prenom_7='%@',nom_prenom_8='%@',nom_prenom_9='%@',nom_prenom_10='%@',sign_1='%@',sign_2='%@',sign_3='%@',sign_4='%@',sign_5='%@',sign_6='%@',sign_7='%@',sign_8='%@',sign_9='%@',sign_10='%@',commentaires='%@',remarques='%@',propositions='%@',pilote='%@',delai='%@',realise='%@',fin_nom='%@',fin_sign_11='%@' where qsse_id='%d'", str_DocumentName,datestring12,txt_poleqsse.text,self.txt_Reference.text,self.txt_animateur.text,self.txt_date.text,self.txt_Themes.text,self.txt_nom_prenom1.text,self.txt_nom_prenom2.text,self.txt_nom_prenom3.text,self.txt_nom_prenom4.text,self.txt_nom_prenom5.text,self.txt_nom_prenom6.text,self.txt_nom_prenom7.text,self.txt_nom_prenom8.text,self.txt_nom_prenom9.text,self.txt_nom_prenom10.text,str_Sign1,str_Sign2,str_Sign3,str_Sign4,str_Sign5,str_Sign6,str_Sign7,str_Sign8,str_Sign9,str_Sign10,self.txt_Commentaires.text,self.txt_Remarques.text,self.txt_Proposition.text,self.txt_Pilote.text,self.txt_Delai.text,self.txt_Realise.text,self.txt_Nom.text,str_Sign11,CurrentCount];
            [[ DBSqlite dbManager] updateStatement:updateSQL];
        }
    }
    if (currentBarButton == pdfButton)
    {
        [ self showEmail] ;
    }
}

-(void)showEmail
{
    Class mailClass  =  (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass !=  nil)
    {
        if ([mailClass canSendMail])
        {
            [self displayComposerSheet];
        }
        else
        {
            [self launchMailAppOnDevice];
        }
    }
    else
    {
        [self launchMailAppOnDevice];
    }
}

-(void)displayComposerSheet
{
    NSString *mailId;
    NSString *emailTitle  =  @"Digitram mail";
    NSString *messageBody  =  @"<h3>Digitram Document</h3>";
    mailId = [[NSUserDefaults standardUserDefaults]valueForKey:@"mailIdEntered"];
    MFMailComposeViewController *mc  =  [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate  =  self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    NSArray *strArray = [ path componentsSeparatedByString:@"/"];
    NSLog(@"Str_Array : %@", strArray) ;
    NSString *fileName = [strArray lastObject];
    NSLog(@"Current File name : %@", fileName) ;
    NSArray *filepart  =  [path componentsSeparatedByString:@"."];
    NSString *extension  =  [filepart objectAtIndex:1];
    NSLog(@"Current path that is taken into account : %@", path) ;
    NSData *fileData =  [NSData dataWithContentsOfFile:path];
    NSString *mimeType;
    if ([extension isEqualToString:@"jpg"])
    {
        mimeType  =  @"image/jpeg";
        
    }
    else if ([extension isEqualToString:@"png"])
    {
        mimeType  =  @"image/png";
    }
    else if ([extension isEqualToString:@"doc"])
    {
        mimeType  =  @"application/msword";
    }
    else if ([extension isEqualToString:@"ppt"])
    {
        mimeType  =  @"application/vnd.ms-powerpoint";
    }
    else if ([extension isEqualToString:@"html"])
    {
        mimeType  =  @"text/html";
    }
    else if ([extension isEqualToString:@"pdf"])
    {
        NSLog(@"Oppa") ;
        mimeType  =  @"application/pdf";
    }
    [mc addAttachmentData:fileData mimeType:mimeType fileName:fileName];
    NSString * body = @"";
    [mc setMessageBody:body isHTML:NO];
    [self presentViewController:mc animated:YES completion:NULL];
}

-(void)launchMailAppOnDevice
{
    NSString *recipients  =  @"mailto:example@gmail.com?cc = &subject = Causerie Email\n\n";
    NSString *body  = [NSString stringWithFormat:@"&body = %@",@"type ur text"];
    NSString *email  =  [NSString stringWithFormat:@"%@%@", recipients, body];
    email  =  [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSLog(@"MailCompose Controller :::") ;
    switch (result)
    {
        case MFMailComposeResultCancelled:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Canceled"
                                                                message:@"Mail Canceled!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            break;
        }
        case MFMailComposeResultSaved:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Saved"
                                                                message:@"Mail Saved!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            break;
        }
        case MFMailComposeResultSent:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Sent"
                                                                message:@"Mail Sent!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            break;
        }
        case MFMailComposeResultFailed:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                message:@"Mail Failed!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            break;
        }
        default:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Not Sent"
                                                                message:@"Mail Not sent!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            break;
        }
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (NSString *)encodeToBase64String:(UIImage *)image
{
    return [UIImageJPEGRepresentation(image, 1) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

#pragma mark - PDF Creation

- (void)openPerPagePDF
{
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:self.scrl_View];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    NSLog(@"Now : %@", now) ;
    [format setDateFormat:@"dd-MM-YYYY_hhmmss"] ;
    NSString * datestring = [format stringFromDate:now];
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    str_DocumentName = [NSString stringWithFormat:@"CRV Causerie QSSE_%@.pdf", datestring]  ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
    [pdfData writeToFile:path atomically:NO];
    NSLog(@"tmpDirectory: %@",path);
}

-(IBAction)editbutclicked:(id)sender
{
    UIButton *but=(UIButton *)sender;
    
    if (but.tag==501)
    {
        sig1clicked=YES;
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
    }
}

#pragma mark >> TextView Delegates <<

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView==txt_nom_prenom1)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1150;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_nom_prenom2)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1100;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_nom_prenom3)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1100;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_nom_prenom4)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1100;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_nom_prenom5)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1100;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_nom_prenom6)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1000;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_nom_prenom7)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1000;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_nom_prenom8)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-900;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_nom_prenom9)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-800;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_nom_prenom10)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-800;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==txt_Commentaires)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-550;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==txt_Remarques)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-300;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==txt_Proposition)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==txt_Pilote)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==txt_Delai)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==txt_Realise)
    {
        CGRect scrollViewFrame=_scrl_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scrl_View.contentSize.height - _scrl_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y;
        [_scrl_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
