//
//  PreventionPlanVC.m
//  Causerie
//
//  Created by Balladonia iTechnologies on 18/02/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import "PreventionPlanVC.h"
#import "ScrollViewToPDF.h"
#import "DBSqlite.h"
#import "SignaVC.h"
#import "PreventionPlanViewController.h"

@interface PreventionPlanVC ()<MFMailComposeViewControllerDelegate, SignaVCDelegate>

@end

@implementation PreventionPlanVC
@synthesize txt_EU_Enterprise,txt_numero,txt_EE1_Enterprise,txt_EE2_Enterprise,txt_EE3_Enterprise,txt_EE4_Enterprise,txt_EU_Representee,txt_EE1_Representee,txt_EE2_Representee,txt_EE3_Representee,txt_EE4_Representee,txt_EU_Nature,txt_EE1_Nature,txt_EE2_Nature,txt_EE3_Nature,txt_EE4_Nature,txt_EU_Effect,txt_EE1_Effect,txt_EE2_Effect,txt_EE3_Effect,txt_EE4_Effect,txt_Desc_Operation,txt_Date_debut,txt_Date_previsible,txt_Adresse,txt_Listes,txt_Accident,txt_Autre,txt_Infirmerie,txt_Consignes,txt_N1,txt_N2,txt_N3,txt_N4,txt_N5,txt_N6,txt_N7,txt_N8,txt_N9,txt_N10;
- (void)viewDidLoad
{
    [super viewDidLoad];
    str_DocumentName = @"QE7110TR Plan de prévention pour travaux" ;
    self.title = str_DocumentName ;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.txt_numero.text = @"" ;
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;
    [scrollview setContentSize:(CGSizeMake(768, 2000))];
    saved_Into_DB=NO;
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    
    savebut = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(redirect)] ;
    
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(saveToDataBase:)] ;
    self.navigationItem.rightBarButtonItem = pdfButton ;
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,savebut, nil];
    self.navigationItem.rightBarButtonItems = arry ;
    
    [self.btn_Edit1 addTarget:self action:@selector(fun_OnEditClicked:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit1.tag = 1;
    self.btn_Edit2.tag = 2 ;
    self.btn_Edit3.tag = 3 ;
    self.btn_Edit4.tag = 4 ;
    self.btn_Edit5.tag = 5 ;
    [self.btn_Edit2 addTarget:self action:@selector(fun_OnEditClicked:) forControlEvents:UIControlEventTouchUpInside] ;
    [self.btn_Edit3 addTarget:self action:@selector(fun_OnEditClicked:) forControlEvents:UIControlEventTouchUpInside] ;
    [self.btn_Edit4 addTarget:self action:@selector(fun_OnEditClicked:) forControlEvents:UIControlEventTouchUpInside] ;
    [self.btn_Edit5 addTarget:self action:@selector(fun_OnEditClicked:) forControlEvents:UIControlEventTouchUpInside] ;
    NSLog(@"The retried array is %@", self.retrievedarray);
    if (self.IsForUpdating==YES)
    {
        txt_numero.text=(self.retrievedarray)[0] [@"numero_daffaire"];
        txt_EU_Enterprise.text=(self.retrievedarray)[0] [@"enterprise_eu"];
        txt_EE1_Enterprise.text=(self.retrievedarray)[0] [@"enterprise_ee1"];
        txt_EE2_Enterprise.text=(self.retrievedarray)[0] [@"enterprise_ee2"];
        txt_EE3_Enterprise.text=(self.retrievedarray)[0] [@"enterprise_ee3"];
        txt_EE4_Enterprise.text=(self.retrievedarray)[0] [@"enterprise_ee4"];
        
        txt_EU_Representee.text=(self.retrievedarray)[0] [@"representee_eu"];
        txt_EE1_Representee.text=(self.retrievedarray)[0] [@"representee_ee1"];
        txt_EE2_Representee.text=(self.retrievedarray)[0] [@"representee_ee2"];
        txt_EE3_Representee.text=(self.retrievedarray)[0] [@"representee_ee3"];
        txt_EE4_Representee.text=(self.retrievedarray)[0] [@"representee_ee4"];
        
        txt_EU_Nature.text=(self.retrievedarray)[0] [@"nature_des_eu"];
        txt_EE1_Nature.text=(self.retrievedarray)[0] [@"nature_des_ee1"];
        txt_EE2_Nature.text=(self.retrievedarray)[0] [@"nature_des_ee2"];
        txt_EE3_Nature.text=(self.retrievedarray)[0] [@"nature_des_ee3"];
        txt_EE4_Nature.text=(self.retrievedarray)[0] [@"nature_des_ee4"];
        
        txt_EU_Effect.text=(self.retrievedarray)[0] [@"effectif_eu"];
        txt_EE1_Effect.text=(self.retrievedarray)[0] [@"effectif_ee1"];
        txt_EE2_Effect.text=(self.retrievedarray)[0] [@"effectif_ee2"];
        txt_EE3_Effect.text=(self.retrievedarray)[0] [@"effectif_ee3"];
        txt_EE4_Effect.text=(self.retrievedarray)[0] [@"effectif_ee4"];
        
        NSString *datas=(self.retrievedarray)[0][@"signature_eu"];
        NSData *data=[[NSData alloc]initWithBase64EncodedData:datas options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image=[[UIImage alloc]init];
        image=[UIImage imageWithData:data];
        [self.img_Signature1 setImage:image];
        
        NSString *datas1=(self.retrievedarray)[0][@"signature_ee1"];
        NSData *data1=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image1=[[UIImage alloc]init];
        image1=[UIImage imageWithData:data1];
        [self.img_Signature2 setImage:image1];
        
        NSString *datas2=(self.retrievedarray)[0][@"signature_ee2"];
        NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image2=[[UIImage alloc]init];
        image2=[UIImage imageWithData:data2];
        [self.img_Signature3 setImage:image2];
        
        NSString *datas3=(self.retrievedarray)[0][@"signature_ee3"];
        NSData *data3=[[NSData alloc]initWithBase64EncodedData:datas3 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image3=[[UIImage alloc]init];
        image3=[UIImage imageWithData:data3];
        [self.img_Signature4 setImage:image3];
        
        NSString *datas4=(self.retrievedarray)[0][@"signature_ee4"];
        NSData *data4=[[NSData alloc]initWithBase64EncodedData:datas4 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image4=[[UIImage alloc]init];
        image4=[UIImage imageWithData:data4];
        [self.img_Signature5 setImage:image4];
        
        txt_Desc_Operation.text=(self.retrievedarray)[0][@"description"];
        txt_Date_debut.text=(self.retrievedarray)[0][@"date_debut"];
        txt_Date_previsible.text=(self.retrievedarray)[0][@"date_previsible"];
        txt_Adresse.text=(self.retrievedarray)[0][@"address"];
        txt_Listes.text=(self.retrievedarray)[0][@"listes"];
        txt_Accident.text=(self.retrievedarray)[0][@"accident"];
        
        txt_Infirmerie.text=(self.retrievedarray)[0][@"infirmerie"];
        txt_Autre.text=(self.retrievedarray)[0][@"autre"];
        txt_Consignes.text=(self.retrievedarray)[0][@"consigne_specifiques"];
        
        txt_N1.text=(self.retrievedarray)[0][@"no_1"];
        
        txt_N2.text=(self.retrievedarray)[0][@"no_2"];
        txt_N3.text=(self.retrievedarray)[0][@"no_3"];
        txt_N4.text=(self.retrievedarray)[0][@"no_4"];
        txt_N5.text=(self.retrievedarray)[0][@"no_5"];
        txt_N6.text=(self.retrievedarray)[0][@"no_6"];
        txt_N7.text=(self.retrievedarray)[0][@"no_7"];
        txt_N8.text=(self.retrievedarray)[0][@"no_8"];
        txt_N9.text=(self.retrievedarray)[0][@"no_9"];
        txt_N10.text=(self.retrievedarray)[0][@"no_10"];
    }
    
    txt_EU_Enterprise.delegate=self;
    txt_EE1_Enterprise.delegate=self;
    txt_EE2_Enterprise.delegate=self;
    txt_EE3_Enterprise.delegate=self;
    txt_EE4_Enterprise.delegate=self;
    txt_EU_Representee.delegate=self;
    txt_EE1_Representee.delegate=self;
    txt_EE2_Representee.delegate=self;
    txt_EE3_Representee.delegate=self;
    txt_EE4_Representee.delegate=self;
    txt_EU_Nature.delegate=self;
    txt_EE1_Nature.delegate=self;
    txt_EE2_Nature.delegate=self;
    txt_EE3_Nature.delegate=self;
    txt_EE4_Nature.delegate=self;
    txt_EU_Effect.delegate=self;
    txt_EE1_Effect.delegate=self;
    txt_EE2_Effect.delegate=self;
    txt_EE3_Effect.delegate=self;
    txt_EE4_Effect.delegate=self;
    txt_Date_debut.delegate=self;
    txt_Date_previsible.delegate=self;
    txt_N1.delegate=self;
    txt_N2.delegate=self;
    txt_N3.delegate=self;
    txt_N4.delegate=self;
    txt_N5.delegate=self;
    txt_N6.delegate=self;
    txt_N7.delegate=self;
    txt_N8.delegate=self;
    txt_N9.delegate=self;
    txt_N10.delegate=self;
    
    txt_Desc_Operation.delegate=self;
    txt_Adresse.delegate=self;
    txt_Listes.delegate=self;
    txt_Consignes.delegate=self;
    txt_Accident.delegate=self;
    txt_Infirmerie.delegate=self;
    txt_Autre.delegate=self;
}

-(void)redirect
{
    
    NSMutableArray *arraydata=[[NSMutableArray alloc]initWithObjects: self.txt_numero.text, self.txt_EU_Enterprise.text,self.txt_EE1_Enterprise.text,self.txt_EE2_Enterprise.text,self.txt_EE3_Enterprise.text,self.txt_EE4_Enterprise.text,self.txt_EU_Representee.text,self.txt_EE1_Representee.text,self.txt_EE2_Representee.text,self.txt_EE3_Representee.text,self.txt_EE4_Representee.text,self.txt_EU_Nature.text,self.txt_EE1_Nature.text,self.txt_EE2_Nature.text,self.txt_EE3_Nature.text,self.txt_EE4_Nature.text,self.txt_EU_Effect.text,self.txt_EE1_Effect.text,self.txt_EE2_Effect.text,self.txt_EE3_Effect.text,self.txt_EE4_Effect.text,array_SignatureData[0],array_SignatureData[1],array_SignatureData[2],array_SignatureData[3],array_SignatureData[4],self.txt_Desc_Operation.text,self.txt_Date_debut.text,self.txt_Date_previsible.text,self.txt_Adresse.text,self.txt_Listes.text,self.txt_Accident.text,self.txt_Infirmerie.text,self.txt_Autre.text,self.txt_Consignes.text,self.txt_N1.text,self.txt_N2.text,self.txt_N3.text,self.txt_N4.text,self.txt_N5.text,self.txt_N6.text,self.txt_N7.text,self.txt_N8.text,self.txt_N9.text,self.txt_N10.text,nil];
    
    
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PreventionPlanViewController *ppvc=[sb instantiateViewControllerWithIdentifier:@"preventionnew"];
    ppvc.dataarray=arraydata;
    ppvc.confirmpdf=YES;
    
    [self.navigationController pushViewController:ppvc animated:YES];
}




- ( void) fun_OnEditClicked : ( UIButton *) sender
{
    switch (sender.tag)
    {
        case 1:
            currentImageView = self.img_Signature1 ;
            break;
        case 2:
            currentImageView = self.img_Signature2 ;
            break;
        case 3:
            currentImageView = self.img_Signature3 ;
            break;
        case 4:
            currentImageView = self.img_Signature4 ;
            break;
        case 5:
            currentImageView = self.img_Signature5 ;
            break;
            
        default:
            break;
    }
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
    svc.delegate=self;
    [self.navigationController pushViewController:svc animated:NO];
}
#pragma mark TextfieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField == txt_Date_debut)
    {
        [self.view endEditing:YES];
        [self showDatePicker1];
        return NO;
    }
    else if(textField == self.txt_Date_previsible)
    {
        [self.view endEditing:YES];
        [self showDatePicker2];
        return NO;
    }

    if (textField==txt_EU_Enterprise || textField==txt_EE1_Enterprise || textField==txt_EE2_Enterprise || textField==txt_EE3_Enterprise || textField==txt_EE4_Enterprise  || textField==txt_EU_Representee || textField==txt_EE1_Representee || textField==txt_EE2_Representee || textField==txt_EE3_Representee || textField==txt_EE4_Representee    || textField==txt_EU_Nature || textField==txt_EE1_Nature || textField==txt_EE2_Nature || textField==txt_EE3_Nature || textField==txt_EE4_Nature || textField==txt_EU_Effect || textField==txt_EE1_Effect || textField==txt_EE2_Effect || textField==txt_EE3_Effect || textField==txt_EE4_Effect)
    {
        
    }
    if (textField==txt_N1 || textField==txt_N2 || textField==txt_N3 || textField==txt_N4 || textField==txt_N5  || textField==txt_N6 || textField==txt_N7 || textField==txt_N8 || textField==txt_N9 || textField==txt_N10)
    {
        
                CGRect scrollViewFrame=scrollview.frame;
                CGPoint bottomOffset = CGPointMake(0, scrollview.contentSize.height - scrollview.bounds.size.height);
                scrollViewFrame.origin.y=bottomOffset.y;
                [scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    return YES;
}

-(void)showDatePicker1
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [datePicker addTarget:self action:@selector(dateTextField1:) forControlEvents:UIControlEventValueChanged];
    [self.txt_Date_debut setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 200) animated:NO];
    [popoverController presentPopoverFromRect:CGRectMake(150, 540, 100, 100)
                                       inView:scrollview
                     permittedArrowDirections:UIPopoverArrowDirectionDown
                                     animated:YES];
}

-(void) dateTextField1:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.txt_Date_debut.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/YYYY HH:mm"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.txt_Date_debut.text = [NSString stringWithFormat:@"%@",dateString];
}

-(void)showDatePicker2
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [datePicker addTarget:self action:@selector(dateTextField2:) forControlEvents:UIControlEventValueChanged];
    [self.txt_Date_previsible setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 200) animated:NO];
    [popoverController presentPopoverFromRect:CGRectMake(540, 540, 100, 100)
                                       inView:scrollview
                     permittedArrowDirections:UIPopoverArrowDirectionDown
                                     animated:YES];
}

-(void) dateTextField2:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.txt_Date_previsible.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY HH:mm"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.txt_Date_previsible.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
}
#pragma mark TextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView==txt_Desc_Operation)
    {
        CGRect scrollViewFrame=scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollview.contentSize.height - scrollview.bounds.size.height);
        scrollViewFrame.origin.y=400; //bottomOffset.y;
        [scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_Adresse)
    {
        CGRect scrollViewFrame=scrollview.frame;
        scrollViewFrame.origin.y=500;
        [scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_Listes)
    {
        CGRect scrollViewFrame=scrollview.frame;
        scrollViewFrame.origin.y=500;
        [scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_Consignes)
    {
        CGRect scrollViewFrame=scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollview.contentSize.height - scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y;
        [scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_Accident)
    {
        CGRect scrollViewFrame=scrollview.frame;
        scrollViewFrame.origin.y=600;
        [scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_Infirmerie)
    {
        CGRect scrollViewFrame=scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollview.contentSize.height - scrollview.bounds.size.height);
        scrollViewFrame.origin.y=600;
        [scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==txt_Autre)
    {
        CGRect scrollViewFrame=scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollview.contentSize.height - scrollview.bounds.size.height);
        scrollViewFrame.origin.y=700;
        [scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
}
#pragma mark Signature delegate

-(void)sendImgData:(UIImage *)image;
{
    UIImageView *imageView;
    NSLog(@"Image : %@", image) ;
    imageView = currentImageView ;
    imageView.image=image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PDF Creation

- (void)openPerPagePDF
{
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:scrollview];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    NSLog(@"Now : %@", now) ;
    //[format setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    [ format setDateFormat:@"dd-MM-YYYY_hhmmss"] ;
    NSString * datestring = [format stringFromDate:now];
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    //   Formname_DDMMYYYYhhmmss
    str_DocumentName = [NSString stringWithFormat:@"Plan de prévention pour travaux_%@.pdf", datestring]  ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
    [pdfData writeToFile:path atomically:NO];
    NSLog(@"tmpDirectory: %@",path);
    //bool_SavedTofile = true;
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

-(void)saveToDataBase : ( UIBarButtonItem *) currentBarButton
{
    int  nnn;
    NSDateFormatter *forma=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [forma setDateFormat:@"dd-MM-YYYY"] ;
    NSString *datestring12 = [forma stringFromDate:now];
    NSArray * array = [[ NSArray alloc] initWithObjects:self.img_Signature1,self.img_Signature2,self.img_Signature3,self.img_Signature4,self.img_Signature5, nil] ;
    array_SignatureData = [ NSMutableArray array] ;
    NSLog(@"Array : %@", array) ;
    for (UIImageView *item in array)
    {
        if (item.image != nil)
        {
            UIImage * image = item.image ;
            NSString * str_Sign1 = [ self encodeToBase64String:image] ;
            [array_SignatureData addObject:str_Sign1] ;
        }
        else
        {
            [ array_SignatureData addObject:@"No"] ;
        }
    }
    NSLog(@"Img Data : %@", array_SignatureData) ;

    if (self.IsForUpdating==YES)
    {
        if (self.retrievedarray!=nil)
        {
            NSLog(@"retrive:%@",self.retrievedarray);
            NSLog(@"retrive:%@",(self.retrievedarray)[0][@"prevention_id"]);
            NSString *str=(self.retrievedarray)[0][@"prevention_id"];
            nnn=[str intValue];
        }
        else
        {
            NSString * str_GetCount = @"SELECT prevention_id FROM prevention" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            nnn =  CurrentCount;
        }
        
        
        [self openPerPagePDF] ;
        NSString *updateSQL = [NSString stringWithFormat:
                               @"update prevention set doc_name='%@',doc_modified_date='%@',numero_daffaire='%@',enterprise_eu='%@',enterprise_ee1='%@',enterprise_ee2='%@',enterprise_ee3='%@',enterprise_ee4='%@',representee_eu='%@',representee_ee1='%@',representee_ee2='%@',representee_ee3='%@',representee_ee4='%@',nature_des_eu='%@',nature_des_ee1='%@',nature_des_ee2='%@',nature_des_ee3='%@',nature_des_ee4='%@',effectif_eu='%@',effectif_ee1='%@',effectif_ee2='%@',effectif_ee3='%@',effectif_ee4='%@',signature_eu='%@',signature_ee1='%@',signature_ee2='%@',signature_ee3='%@',signature_ee4='%@',description='%@',date_debut='%@',date_previsible='%@',address='%@',listes='%@',accident='%@',infirmerie='%@',autre='%@',consigne_specifiques='%@',no_1='%@',no_2='%@',no_3='%@',no_4='%@',no_5='%@',no_6='%@',no_7='%@',no_8='%@',no_9='%@',no_10='%@' where prevention_id ='%ld'", str_DocumentName,datestring12,self.txt_numero.text, self.txt_EU_Enterprise.text,self.txt_EE1_Enterprise.text,self.txt_EE2_Enterprise.text,self.txt_EE3_Enterprise.text,self.txt_EE4_Enterprise.text,self.txt_EU_Representee.text,self.txt_EE1_Representee.text,self.txt_EE2_Representee.text,self.txt_EE3_Representee.text,self.txt_EE4_Representee.text,self.txt_EU_Nature.text,self.txt_EE1_Nature.text,self.txt_EE2_Nature.text,self.txt_EE3_Nature.text,self.txt_EE4_Nature.text,self.txt_EU_Effect.text,self.txt_EE1_Effect.text,self.txt_EE2_Effect.text,self.txt_EE3_Effect.text,self.txt_EE4_Effect.text,array_SignatureData[0],array_SignatureData[1],array_SignatureData[2],array_SignatureData[3],array_SignatureData[4],self.txt_Desc_Operation.text,self.txt_Date_debut.text,self.txt_Date_previsible.text,self.txt_Adresse.text,self.txt_Listes.text,self.txt_Accident.text,self.txt_Infirmerie.text,self.txt_Autre.text,self.txt_Consignes.text,self.txt_N1.text,self.txt_N2.text,self.txt_N3.text,self.txt_N4.text,self.txt_N5.text,self.txt_N6.text,self.txt_N7.text,self.txt_N8.text,self.txt_N9.text,self.txt_N10.text,(long)nnn];
        [[ DBSqlite dbManager] updateStatement:updateSQL];
    }
    else
    {
        if(saved_Into_DB==NO)
        {
            [self openPerPagePDF] ;
            NSArray * array = [[ NSArray alloc] initWithObjects:self.img_Signature1,self.img_Signature2,self.img_Signature3,self.img_Signature4,self.img_Signature5, nil] ;
            array_SignatureData = [ NSMutableArray array] ;
            NSLog(@"Array : %@", array) ;
            for (UIImageView *item in array)
            {
                if (item.image != nil)
                {
                    UIImage * image = item.image ;
                    NSString * str_Sign1 = [ self encodeToBase64String:image] ;
                    [array_SignatureData addObject:str_Sign1] ;
                }
                else
                {
                    [ array_SignatureData addObject:@"No"] ;
                }
            }
            NSLog(@"Img Data : %@", array_SignatureData) ;
            NSString * str_GetCount = @"SELECT prevention_id FROM prevention" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSString *strQuery = [NSString stringWithFormat:@"insert into prevention(doc_name,doc_created_date,doc_modified_date,prevention_id,numero_daffaire,enterprise_eu,enterprise_ee1,enterprise_ee2,enterprise_ee3,enterprise_ee4,representee_eu,representee_ee1,representee_ee2,representee_ee3,representee_ee4,nature_des_eu,nature_des_ee1,nature_des_ee2,nature_des_ee3,nature_des_ee4,effectif_eu,effectif_ee1,effectif_ee2,effectif_ee3,effectif_ee4,signature_eu,signature_ee1,signature_ee2,signature_ee3,signature_ee4,description,date_debut,date_previsible,address,listes,accident,infirmerie,autre,consigne_specifiques,no_1,no_2,no_3,no_4,no_5,no_6,no_7,no_8,no_9,no_10) values (\"%@\",\"%@\",\"%@\",\"%d\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",str_DocumentName,str_CreatedDate,str_CreatedDate,++CurrentCount,self.txt_numero.text, self.txt_EU_Enterprise.text,self.txt_EE1_Enterprise.text,self.txt_EE2_Enterprise.text,self.txt_EE3_Enterprise.text,self.txt_EE4_Enterprise.text,self.txt_EU_Representee.text,self.txt_EE1_Representee.text,self.txt_EE2_Representee.text,self.txt_EE3_Representee.text,self.txt_EE4_Representee.text,self.txt_EU_Nature.text,self.txt_EE1_Nature.text,self.txt_EE2_Nature.text,self.txt_EE3_Nature.text,self.txt_EE4_Nature.text,self.txt_EU_Effect.text,self.txt_EE1_Effect.text,self.txt_EE2_Effect.text,self.txt_EE3_Effect.text,self.txt_EE4_Effect.text,array_SignatureData[0],array_SignatureData[1],array_SignatureData[2],array_SignatureData[3],array_SignatureData[4],self.txt_Desc_Operation.text,self.txt_Date_debut.text,self.txt_Date_previsible.text,self.txt_Adresse.text,self.txt_Listes.text,self.txt_Accident.text,self.txt_Infirmerie.text,self.txt_Autre.text,self.txt_Consignes.text,self.txt_N1.text,self.txt_N2.text,self.txt_N3.text,self.txt_N4.text,self.txt_N5.text,self.txt_N6.text,self.txt_N7.text,self.txt_N8.text,self.txt_N9.text,self.txt_N10.text];
            NSLog(@"Query for Prevention : %@", strQuery) ;
            [[DBSqlite dbManager]insertStatement:strQuery];
            self.IsForUpdating=YES;
            saved_Into_DB=YES;
        }
        else if(saved_Into_DB==YES)
        {
            NSString * str_GetCount = @"SELECT prevention_id FROM prevention" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSString *updateSQL = [NSString stringWithFormat:
                                   @"update prevention set doc_name='%@',doc_modified_date='%@',numero_daffaire='%@',enterprise_eu='%@',enterprise_ee1='%@',enterprise_ee2='%@',enterprise_ee3='%@',enterprise_ee4='%@',representee_eu='%@',representee_ee1='%@',representee_ee2='%@',representee_ee3='%@',representee_ee4='%@',nature_des_eu='%@',nature_des_ee1='%@',nature_des_ee2='%@',nature_des_ee3='%@',nature_des_ee4='%@',effectif_eu='%@',effectif_ee1='%@',effectif_ee2='%@',effectif_ee3='%@',effectif_ee4='%@',signature_eu='%@',signature_ee1='%@',signature_ee2='%@',signature_ee3='%@',signature_ee4='%@',description='%@',date_debut='%@',date_previsible='%@',address='%@',listes='%@',accident='%@',infirmerie='%@',autre='%@',consigne_specifiques='%@',no_1='%@',no_2='%@',no_3='%@',no_4='%@',no_5='%@',no_6='%@',no_7='%@',no_8='%@',no_9='%@',no_10='%@' where prevention_id ='%d'", str_DocumentName,datestring12,self.txt_numero.text, self.txt_EU_Enterprise.text,self.txt_EE1_Enterprise.text,self.txt_EE2_Enterprise.text,self.txt_EE3_Enterprise.text,self.txt_EE4_Enterprise.text,self.txt_EU_Representee.text,self.txt_EE1_Representee.text,self.txt_EE2_Representee.text,self.txt_EE3_Representee.text,self.txt_EE4_Representee.text,self.txt_EU_Nature.text,self.txt_EE1_Nature.text,self.txt_EE2_Nature.text,self.txt_EE3_Nature.text,self.txt_EE4_Nature.text,self.txt_EU_Effect.text,self.txt_EE1_Effect.text,self.txt_EE2_Effect.text,self.txt_EE3_Effect.text,self.txt_EE4_Effect.text,array_SignatureData[0],array_SignatureData[1],array_SignatureData[2],array_SignatureData[3],array_SignatureData[4],self.txt_Desc_Operation.text,self.txt_Date_debut.text,self.txt_Date_previsible.text,self.txt_Adresse.text,self.txt_Listes.text,self.txt_Accident.text,self.txt_Infirmerie.text,self.txt_Autre.text,self.txt_Consignes.text,self.txt_N1.text,self.txt_N2.text,self.txt_N3.text,self.txt_N4.text,self.txt_N5.text,self.txt_N6.text,self.txt_N7.text,self.txt_N8.text,self.txt_N9.text,self.txt_N10.text,CurrentCount];
            [[ DBSqlite dbManager] updateStatement:updateSQL];
        }
    }
    if (currentBarButton == pdfButton)
    {
        [ self showEmail] ;
    }
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
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
