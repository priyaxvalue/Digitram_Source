//
//  RiskAnalysisViewController.m
//  Causerie
//
//
//

#import "RiskAnalysisViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomScrollView.h"
#import "ScrollViewToPDF.h"

@interface RiskAnalysisViewController ()<UIScrollViewDelegate>
{
    
}

@end

@implementation RiskAnalysisViewController
@synthesize titleview,firstrowfirst,firsrtowthird,firstrowsecd,secondrowview,thirdrowview,fourthrowview,fourthrowview2,fourthrowview3,titleview2,descriptionview,listview,listview1,checkbox1,image2,image1,listview2,checkbox2,listview3,checkbox3,listview4,checkbox4,listview5,checkbox5,listview6,checkbox6,listview7,checkbox7,listview8,checkbox8,listview9,checkbox9,listview10,checkbox10,listview11,checkbox11,listview12,checkbox12,listview13,checkbox13,listview14,scrollview,checkbox14,listview15,checkbox15,listview16,checkbox16,listview17,checkbox17,listview18,checkbox18,checkboxes17,listviews1,listviews20,listviews2,checkboxes18,listviews3,checkboxes19,listviews4,checkboxes20,listviews5,checkboxes21,border1,view1checkbox1,view1checkbox2,view1checkbox3,view1checkbox4,view1checkbox5,view1checkbox6,view1checkbox7,view1checkbox8,view2checkbox1,view2checkbox2,view2checkbox3,view2checkbox4,view2checkbox5,border2,border3,border3checkbox1,border3checkbox2,border3checkbox11,border3checkbox12,border3checkbox13,border3checkbox14,border3checkbox15,border3checkbox16,border3checkbox17,border3checkbox18,border3checkbox21,border3checkbox22,border3checkbox23,border3checkbox24,border3checkbox25,border3checkbox26,border3checkbox27,border3checkbox28,border3checkbox31,border3checkbox32,border3checkbox33,border3checkbox34,border3checkbox35,border3checkbox321,border3checkbox322,border3checkbox323,border3checkbox324,border3checkbox325,border4,border5,bigbox,smallview1,smallview2,smallview3,smallview4, view2tv1, view1tv1, textv2, textv, textv1;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    saved_Into_DB=NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    UIButton * btn_EditSignaturefirst = [ UIButton buttonWithType:UIButtonTypeSystem] ;
    [btn_EditSignaturefirst setTitle:@"Edit" forState:UIControlStateNormal] ;
    [btn_EditSignaturefirst setFrame:CGRectMake(670,3305,40,20)] ;
    btn_EditSignaturefirst.tag = 9997 ;
    [ btn_EditSignaturefirst addTarget:self action:@selector(editbutclicked:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.scrollview addSubview:btn_EditSignaturefirst] ;
    self.scrollview.delegate=self;
    
    str_DocumentName = @"QE7100TR DAR Analyse des  Risques" ;
    self.title = str_DocumentName ;

    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;
    [scrollview setContentSize:(CGSizeMake(768, 4000))];
    self.sig1view.layer.borderWidth=1.0;
    self.sig1view.layer.borderColor=[[UIColor lightGrayColor]CGColor];
  if (self.IsForUpdating==NO )
  {
    b1=@"NO";
    b2=@"NO";
    b3=@"NO";
    b4=@"NO";
    b5=@"NO";
    b6=@"NO";
    b7=@"NO";
    b8=@"NO";
    b9=@"NO";
    b10=@"NO";
    b11=@"NO";
    b12=@"NO";
    b13=@"NO";
    b14=@"NO";
    b15=@"NO";
    b16=@"NO";
    b17=@"NO";
    b18=@"NO";
    b19=@"NO";
    b20=@"NO";
    b21=@"NO";
    b22=@"NO";
    b23=@"NO";
    b24=@"NO";
    b25=@"NO";
    b26=@"NO";
    b27=@"NO";
    b28=@"NO";
    b29=@"NO";
    b30=@"NO";
    b31=@"NO";
    b32=@"NO";
    b33=@"NO";
    b34=@"NO";
    b35=@"NO";
    b36=@"NO";
    b37=@"NO";
    b38=@"NO";
    b39=@"NO";
    b40=@"NO";
    b41=@"NO";
    b42=@"NO";
    
    tpb1=@"NO";
    tpb2=@"NO";
    tpb3=@"NO";
    tpb4=@"NO";
    tpb5=@"NO";
    tpb6=@"NO";
    tpb7=@"NO";
    tpb8=@"NO";
    tpb9=@"NO";
    tpb10=@"NO";
    tpb11=@"NO";
    tpb12=@"NO";
    tpb13=@"NO";
    tpb14=@"NO";
    tpb15=@"NO";
    tpb16=@"NO";
    tpb17=@"NO";
    tpb18=@"NO";
    tpb19=@"NO";
    tpb20=@"NO";
    tpb21=@"NO";
    
  }
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(saveToDataBase:)] ;
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,saveButton, nil];
    self.navigationItem.rightBarButtonItems = arry ;
    
    titleview.layer.borderColor = [UIColor blackColor].CGColor;
    titleview.layer.borderWidth = 1.0f;
    firstrowfirst.layer.borderColor = [UIColor blackColor].CGColor;
    firstrowfirst.layer.borderWidth = 1.0f;
    firstrowsecd.layer.borderColor = [UIColor blackColor].CGColor;
    firstrowsecd.layer.borderWidth = 1.0f;
    firsrtowthird.layer.borderColor = [UIColor blackColor].CGColor;
    firsrtowthird.layer.borderWidth = 1.0f;
    secondrowview.layer.borderColor = [UIColor blackColor].CGColor;
    secondrowview.layer.borderWidth = 1.0f;
    thirdrowview.layer.borderColor = [UIColor blackColor].CGColor;
    thirdrowview.layer.borderWidth = 1.0f;
    fourthrowview.layer.borderColor = [UIColor blackColor].CGColor;
    fourthrowview.layer.borderWidth = 1.0f;
    fourthrowview2.layer.borderColor = [UIColor blackColor].CGColor;
    fourthrowview2.layer.borderWidth = 1.0f;
    fourthrowview3.layer.borderColor = [UIColor blackColor].CGColor;
    fourthrowview3.layer.borderWidth = 1.0f;
    titleview2.layer.borderColor = [UIColor blackColor].CGColor;
    titleview2.layer.borderWidth = 1.0f;
    descriptionview.layer.borderColor = [UIColor blackColor].CGColor;
    descriptionview.layer.borderWidth = 1.0f;
    listview.layer.borderColor = [UIColor blackColor].CGColor;
    listview.layer.borderWidth = 1.0f;
    listview1.layer.borderColor = [UIColor blackColor].CGColor;
    listview1.layer.borderWidth = 1.0f;
    listview2.layer.borderColor = [UIColor blackColor].CGColor;
    listview2.layer.borderWidth = 1.0f;
    
    self.vw_si_les.layer.borderWidth=1.0;
    self.vw_rappel.layer.borderWidth=1.0;
    
    listview2.layer.borderColor = [UIColor blackColor].CGColor;
    listview2.layer.borderWidth = 1.0f;
    listview3.layer.borderColor = [UIColor blackColor].CGColor;
    listview3.layer.borderWidth = 1.0f;
    listview4.layer.borderColor = [UIColor blackColor].CGColor;
    listview4.layer.borderWidth = 1.0f;
    listview5.layer.borderColor = [UIColor blackColor].CGColor;
    listview5.layer.borderWidth = 1.0f;
    listview6.layer.borderColor = [UIColor blackColor].CGColor;
    listview6.layer.borderWidth = 1.0f;
    listview7.layer.borderColor = [UIColor blackColor].CGColor;
    listview7.layer.borderWidth = 1.0f;
    listview8.layer.borderColor = [UIColor blackColor].CGColor;
    listview8.layer.borderWidth = 1.0f;
    listview9.layer.borderColor = [UIColor blackColor].CGColor;
    listview9.layer.borderWidth = 1.0f;
    listview10.layer.borderColor = [UIColor blackColor].CGColor;
    listview10.layer.borderWidth = 1.0f;
    listview11.layer.borderColor = [UIColor blackColor].CGColor;
    listview11.layer.borderWidth = 1.0f;
    listview12.layer.borderColor = [UIColor blackColor].CGColor;
    listview12.layer.borderWidth = 1.0f;
    listview13.layer.borderColor = [UIColor blackColor].CGColor;
    listview13.layer.borderWidth = 1.0f;
    listview14.layer.borderColor = [UIColor blackColor].CGColor;
    listview14.layer.borderWidth = 1.0f;
    listview15.layer.borderColor = [UIColor blackColor].CGColor;
    listview15.layer.borderWidth = 1.0f;
    listview16.layer.borderColor = [UIColor blackColor].CGColor;
    listview16.layer.borderWidth = 1.0f;
    
    listview17.layer.borderColor = [UIColor blackColor].CGColor;
    listview17.layer.borderWidth = 1.0f;
    
    listviews20.layer.borderColor = [UIColor blackColor].CGColor;
    listviews20.layer.borderWidth = 1.0f;
    
    listviews1=[[UIView alloc ]initWithFrame:CGRectMake(35, 1092, 698, 37)];
    listviews1.layer.borderColor = [UIColor blackColor].CGColor;
    listviews1.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:listviews1];
    
    listviews2=[[UIView alloc ]initWithFrame:CGRectMake(35, 1128, 698, 37)];
    listviews2.layer.borderColor = [UIColor blackColor].CGColor;
    listviews2.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:listviews2];
    
    listviews3=[[UIView alloc ]initWithFrame:CGRectMake(35, 1164, 698, 37)];
    listviews3.layer.borderColor = [UIColor blackColor].CGColor;
    listviews3.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:listviews3];
    
    listviews4=[[UIView alloc ]initWithFrame:CGRectMake(35, 1200, 698, 44)];
    listviews4.layer.borderColor = [UIColor blackColor].CGColor;
    listviews4.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:listviews4];
    
    listviews5=[[UIView alloc ]initWithFrame:CGRectMake(35, 1243, 698, 65)];
    listviews5.layer.borderColor = [UIColor blackColor].CGColor;
    listviews5.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:listviews5];
    
    border1=[[UIView alloc ]initWithFrame:CGRectMake(35, 1335, 698, 600)];
    border1.layer.borderColor = [UIColor blackColor].CGColor;
    border1.backgroundColor=[UIColor groupTableViewBackgroundColor];
    border1.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:border1];
    
    border2=[[UIView alloc ]initWithFrame:CGRectMake(35, 1950, 698, 600)];
    border2.layer.borderColor = [UIColor blackColor].CGColor;
    border2.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:border2];
    
    border3=[[UIView alloc ]initWithFrame:CGRectMake(35, 2530, 698, 550)];
    border3.layer.borderColor = [UIColor blackColor].CGColor;
    border3.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:border3];
    
    
    // Sixth box
    
    // ****************************************************************************************************************************
    
    border4=[[UIView alloc ]initWithFrame:CGRectMake(35, 3100, 698, 260)];
    border4.layer.borderColor = [UIColor blackColor].CGColor;
    border4.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:border4];
    
    UILabel *titlelabel3=[[UILabel alloc]initWithFrame:CGRectMake(36, 3101, 696, 35)];
    [titlelabel3 setFont:[UIFont fontWithName:@"Systembold" size:13]];
    titlelabel3.text=@"Autorisation de travail";
    titlelabel3.textAlignment=NSTextAlignmentCenter;
    titlelabel3.backgroundColor=[UIColor groupTableViewBackgroundColor];
    titlelabel3.textColor=[UIColor blueColor];
    [scrollview addSubview:titlelabel3];
    
    UIView *line1=[[UIView alloc]initWithFrame:CGRectMake(36, 3136,  696, 0.5)];
    line1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    line1.layer.borderWidth = 0.5f;
    [self.scrollview addSubview:line1];
    
    UITextView *border3titlelabels222=[[UITextView alloc]initWithFrame:CGRectMake(37, 3140, 340, 55)];
    [border3titlelabels222 setFont:[UIFont fontWithName:@"Arial" size:14]];
    border3titlelabels222.text=@"Mon analyse m’autorise à travailler ou à donner l’autorisation de travailler à mon équipe pour les travaux stipulés dans cette analyse de risques";
    border3titlelabels222.textColor=[UIColor redColor];
    [scrollview addSubview:border3titlelabels222];
    
    UITextView *label=[[UITextView alloc]initWithFrame:CGRectMake(395, 3160, 40,41)];
    [label setFont:[UIFont fontWithName:@"Arial" size:14]];
    label.textColor=[UIColor redColor];
    label.text=@" Oui 	";
    [scrollview addSubview:label];
    
    bigbox=[UIButton buttonWithType:UIButtonTypeCustom];
    bigbox.frame=CGRectMake(430, 3150, 55, 70);
    bigbox.layer.borderColor = [UIColor blackColor].CGColor;
    bigbox.layer.borderWidth = 1.0f;
    [bigbox addTarget:self action:@selector(bigboxAction) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:bigbox];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(495, 3150, 40,41)];
    [label1 setFont:[UIFont fontWithName:@"Arial" size:10]];
    label1.text=@"Nom:";
    [scrollview addSubview:label1];
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(495, 3180, 50,41)];
    [label2 setFont:[UIFont fontWithName:@"Arial" size:10]];
    label2.text=@"Signature:";
    [scrollview addSubview:label2];
    
    self.autorisation_de_travail_nom=[[UITextField alloc]initWithFrame:CGRectMake(535, 3150, 180, 37)];
    self.autorisation_de_travail_nom.layer.borderWidth=1.0;
    self.autorisation_de_travail_nom.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [scrollview addSubview:self.autorisation_de_travail_nom];
    
    self.signature1 =[[UIImageView alloc ]initWithFrame:CGRectMake(495, 3220, 220, 80)];
    self.signature1.backgroundColor=[UIColor clearColor];
    self.signature1.layer.borderWidth=1.0;
    self.signature1.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    self.signature1.userInteractionEnabled=NO;
    
    UIButton * btn_EditSignature = [ UIButton buttonWithType:UIButtonTypeSystem] ;
    [btn_EditSignature setTitle:@"Edit" forState:UIControlStateNormal] ;
    [btn_EditSignature setFrame:CGRectMake(670,3305,40,20)] ;
    btn_EditSignature.tag = 9997 ;
    [ btn_EditSignature addTarget:self action:@selector(editbutclicked:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.scrollview addSubview:btn_EditSignature] ;
    [self.scrollview addSubview:self.signature1];
    
    UITextView *border3titlelabels223=[[UITextView alloc]initWithFrame:CGRectMake(36, 3320, 696, 45)];
    border3titlelabels223.backgroundColor=[UIColor clearColor];
    [border3titlelabels223 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels223.text=@"Les lignes 1 à 15 doivent obligatoirement être renseignées pour donner l’autorisation de travail. Je m’assure que pendant la durée des travaux, il n’y a pas de modification de la configuration de l’environnement de travail, sinon j’avertis mes collègues et je modifie en conséquence cette analyse de risques.	";
    [scrollview addSubview:border3titlelabels223];
    
    // Seventh Box bottom box
    
    // ************************************************************************
    
    border5=[[UIView alloc ]initWithFrame:CGRectMake(35, 3380, 698, 200)];
    border5.layer.borderColor = [UIColor blackColor].CGColor;
    border5.backgroundColor=[UIColor groupTableViewBackgroundColor];
    border5.layer.borderWidth = 1.0f;
    [self.scrollview addSubview:border5];
    
    UILabel *titlelabel4=[[UILabel alloc]initWithFrame:CGRectMake(250, 3380, 450, 35)];
    [titlelabel4 setFont:[UIFont fontWithName:@"Systembold" size:13]];
    titlelabel4.text=@"Validation des différents intervenants";
    titlelabel4.textColor=[UIColor blueColor];
    [scrollview addSubview:titlelabel4];
    
    smallview1 =[[UIView alloc ]initWithFrame:CGRectMake(36, 3420, 170, 150)];
    smallview1.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:smallview1];
    
    smallview2 =[[UIView alloc ]initWithFrame:CGRectMake(208, 3420, 160, 150)];
    smallview2.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:smallview2];
    
    smallview3 =[[UIView alloc ]initWithFrame:CGRectMake(397, 3420, 160, 150)];
    smallview3.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:smallview3];
    
    smallview4 =[[UIView alloc ]initWithFrame:CGRectMake(560, 3420, 170, 150)];
    smallview4.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:smallview4];
    
    UILabel *label111=[[UILabel alloc]initWithFrame:CGRectMake(110, 3415, 40, 30)];
    [label111 setFont:[UIFont fontWithName:@"Arial" size:11]];
    //label1.textColor=[UIColor redColor];
    label111.text=@"Nom";
    [scrollview addSubview:label111];
    
    UILabel *label211=[[UILabel alloc]initWithFrame:CGRectMake(465, 3415, 40, 30)];
    [label211 setFont:[UIFont fontWithName:@"Arial" size:11]];
    //label1.textColor=[UIColor redColor];
    label211.text=@"Nom";
    [scrollview addSubview:label211];
    
    UILabel *label112=[[UILabel alloc]initWithFrame:CGRectMake(265, 3415, 50, 30)];
    [label112 setFont:[UIFont fontWithName:@"Arial" size:11]];
    // label1.textColor=[UIColor redColor];
    label112.text=@"Signature";
    [scrollview addSubview:label112];
    
    UILabel *label212=[[UILabel alloc]initWithFrame:CGRectMake(615, 3415, 50, 30)];
    [label212 setFont:[UIFont fontWithName:@"Arial" size:11]];
    // label1.textColor=[UIColor redColor];
    label212.text=@"Signature";
    [scrollview addSubview:label212];
    
    self.nom1_text=[[UITextField alloc]initWithFrame:CGRectMake(50,3465, 145, 40)];
    self.nom1_text.layer.borderWidth=1.0;
    self.nom1_text.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [self.scrollview addSubview:self.nom1_text];
    
    self.sig1 =[[UIImageView alloc ]initWithFrame:CGRectMake(208, 3450, 160, 100)];
    self.sig1.layer.borderWidth=1.0;
    self.sig1.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    self.sig1.backgroundColor=[UIColor clearColor];
    self.sig1.userInteractionEnabled=NO;
    
    UIButton * btn_EditSignature1 = [ UIButton buttonWithType:UIButtonTypeSystem] ;
    [btn_EditSignature1 setTitle:@"Edit" forState:UIControlStateNormal] ;
    [btn_EditSignature1 setFrame:CGRectMake(315,3553,45,21)] ;
    btn_EditSignature1.tag = 9998;
    [ btn_EditSignature1 addTarget:self action:@selector(editbutclicked:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.scrollview addSubview:btn_EditSignature1] ;
    
    
    [self.scrollview addSubview:self.sig1];
    
    self.nom2_text=[[UITextField alloc]initWithFrame:CGRectMake(408,3465, 145, 40)];
    self.nom2_text.layer.borderWidth=1.0;
    self.nom2_text.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [self.scrollview addSubview:self.nom2_text];
    
    self.sig2 =[[UIImageView alloc ]initWithFrame:CGRectMake(560, 3450, 168, 100)];
    self.sig2.layer.borderWidth=1.0;
    self.sig2.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    self.sig2.backgroundColor=[UIColor clearColor];
    self.sig2.userInteractionEnabled=NO;
    
    UIButton * btn_EditSignature2 = [ UIButton buttonWithType:UIButtonTypeSystem] ;
    [btn_EditSignature2 setTitle:@"Edit" forState:UIControlStateNormal] ;
    [btn_EditSignature2 setFrame:CGRectMake(680,3553,45,21)] ;
    btn_EditSignature2.tag = 9999 ;
    [ btn_EditSignature2 addTarget:self action:@selector(editbutclicked:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.scrollview addSubview:btn_EditSignature2] ;
    
    [self.scrollview addSubview:self.sig2];
    
    
    // *********************************************************************************
    
    
    
    self.border2backimage=[[UIImageView alloc ]initWithFrame:CGRectMake(35, 1951, 698, 540)];
    [self.border2backimage setImage:[UIImage imageNamed:@"grids.gif"]];
    self.border2backimage.layer.borderColor = [UIColor blackColor].CGColor;
    self.border2backimage.layer.borderWidth = 1.0f;
    self.border2backimage.tag=502;
    [self.scrollview addSubview:self.border2backimage];
    
    
    UIImageView *signatureimage=[[UIImageView alloc ]initWithFrame:CGRectMake(35, 1950, 698, 600)];
    signatureimage.backgroundColor=[UIColor clearColor];
    signatureimage.userInteractionEnabled=NO;
    [self.scrollview addSubview:signatureimage];
    
    UIImageView *titlebackgrond=[[UIImageView alloc]initWithFrame:CGRectMake(36, 1951, 696, 35)];
    titlebackgrond.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.scrollview addSubview:titlebackgrond];
    
    UIView *titlebackgrond1=[[UIView alloc]initWithFrame:CGRectMake(36, 2531, 696, 35)];
    titlebackgrond1.layer.borderColor = [UIColor lightGrayColor].CGColor;
    titlebackgrond1.layer.borderWidth = 0.5f;
    titlebackgrond1.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.scrollview addSubview:titlebackgrond1];
    
    
    UIView *subborder3=[[UIView alloc]initWithFrame:CGRectMake(36, 2566, 696, 65)];
    subborder3.layer.borderColor = [UIColor lightGrayColor].CGColor;
    subborder3.layer.borderWidth = 0.5f;
    [self.scrollview addSubview:subborder3];
    
    UIView *line=[[UIView alloc]initWithFrame:CGRectMake(390, 2630, 0.5, 470)];
    line.layer.borderColor = [UIColor lightGrayColor].CGColor;
    line.layer.borderWidth = 0.5f;
    [self.scrollview addSubview:line];
    
    UILabel *border3titlelabel=[[UILabel alloc]initWithFrame:CGRectMake(335, 2565, 375, 21)];
    [border3titlelabel setFont:[UIFont fontWithName:@"Arial" size:10]];
    border3titlelabel.text=@"Information des risques ";
    [scrollview addSubview:border3titlelabel];
    
    UILabel *border3titlelabel2=[[UILabel alloc]initWithFrame:CGRectMake(125, 2630, 375, 21)];
    [border3titlelabel2 setFont:[UIFont fontWithName:@"Arial" size:10]];
    border3titlelabel2.text=@"Moyen de protection si risques électriques :";
    [scrollview addSubview:border3titlelabel2];
    
    
    UILabel *border3titlelabels1=[[UILabel alloc]initWithFrame:CGRectMake(38, 2665, 380, 21)];
    [border3titlelabels1 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels1.text=@"3) Attestation de consignation faite :";
    [scrollview addSubview:border3titlelabels1];
    
    
    UILabel *border3titlelabels12=[[UILabel alloc]initWithFrame:CGRectMake(400, 2665, 380, 21)];
    [border3titlelabels12 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels12.text=@"11) Balisage zone de travail";
    [scrollview addSubview:border3titlelabels12];
    
    
    UITextView *border3titlelabels2=[[UITextView alloc]initWithFrame:CGRectMake(37, 2710, 240, 31)];
    [border3titlelabels2 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels2.text=@"4) Connaissance du schéma de l’installation     concernée :";
    [scrollview addSubview:border3titlelabels2];
    
    UITextView *border3titlelabels22=[[UITextView alloc]initWithFrame:CGRectMake(400, 2710, 220, 31)];
    [border3titlelabels22 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels22.text=@"12) Mise en place de moyen de protection        spécifique	";
    [scrollview addSubview:border3titlelabels22];
    
    UILabel *border3titlelabels13=[[UILabel alloc]initWithFrame:CGRectMake(38, 2760, 240, 31)];
    [border3titlelabels13 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels13.text=@"5) Pose de cadenas =S= sur HT";
    [scrollview addSubview:border3titlelabels13];
    
    UITextView *border3titlelabels23=[[UITextView alloc]initWithFrame:CGRectMake(400, 2760, 220, 31)];
    [border3titlelabels23 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels23.text=@"13) Port des EPI adaptés suivant le travail à    réaliser";
    [scrollview addSubview:border3titlelabels23];
    
    
    UILabel *border3titlelabels4=[[UILabel alloc]initWithFrame:CGRectMake(38, 2810, 240, 31)];
    [border3titlelabels4 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels4.text=@"6) Pose de cadenas =S= sur BT";
    [scrollview addSubview:border3titlelabels4];
    
    UILabel *border3titlelabels24=[[UILabel alloc]initWithFrame:CGRectMake(400, 2810, 240, 31)];
    [border3titlelabels24 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels24.text=@"14) Connaissance des issues de secours";
    [scrollview addSubview:border3titlelabels24];
    
    
    UILabel *border3titlelabels5=[[UILabel alloc]initWithFrame:CGRectMake(38, 2860, 240, 31)];
    [border3titlelabels5 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels5.text=@"7) VAT faite	";
    [scrollview addSubview:border3titlelabels5];
    
    
    UILabel *border3titlelabels25=[[UILabel alloc]initWithFrame:CGRectMake(400, 2860, 240, 31)];
    [border3titlelabels25 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels25.text=@"15) 	";
    [scrollview addSubview:border3titlelabels25];
    
    UILabel *border3titlelabels6=[[UILabel alloc]initWithFrame:CGRectMake(38, 2910, 240, 31)];
    [border3titlelabels6 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels6.text=@"8) MALT faite";
    [scrollview addSubview:border3titlelabels6];
    
    UILabel *border3titlelabels7=[[UILabel alloc]initWithFrame:CGRectMake(38, 2960, 240, 31)];
    [border3titlelabels7 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels7.text=@"9) Balisage des zones sous tension";
    [scrollview addSubview:border3titlelabels7];
    
    
    UILabel *border3titlelabels8=[[UILabel alloc]initWithFrame:CGRectMake(38, 3010, 240, 31)];
    [border3titlelabels8 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3titlelabels8.text=@"10) Protection des éléments sous tension	";
    [scrollview addSubview:border3titlelabels8];
    
    _amont_la_tension.backgroundColor=[UIColor greenColor];
    
    
    
    
    UILabel *border3titlelabel3=[[UILabel alloc]initWithFrame:CGRectMake(500, 2630, 375, 21)];
    [border3titlelabel3 setFont:[UIFont fontWithName:@"Arial" size:10]];
    border3titlelabel3.text=@"Moyen de protections autres";
    [scrollview addSubview:border3titlelabel3];
    
    UILabel *border3label=[[UILabel alloc]initWithFrame:CGRectMake(38, 2585, 375, 21)];
    [border3label setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3label.text=@"1) PdP ou PPSPS fait et diffusé aux intervenants:";
    [scrollview addSubview:border3label];
    
    UILabel *border3label1=[[UILabel alloc]initWithFrame:CGRectMake(340, 2585, 375, 21)];
    [border3label1 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3label1.text=@"2) Connaissance de l’analyse des risques par les différents intervenants:";
    [scrollview addSubview:border3label1];
    
    UITextView *border3title1=[[UITextView alloc]initWithFrame:CGRectMake(320, 2660, 40, 30)];
    [border3title1 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title1.text=@"Sans  Objet";
    [scrollview addSubview:border3title1];
    
    UITextView *border3title31=[[UITextView alloc]initWithFrame:CGRectMake(660, 2660, 40, 30)];
    [border3title31 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title31.text=@"Sans  Objet";
    [scrollview addSubview:border3title31];
    
    UITextView *border3title2=[[UITextView alloc]initWithFrame:CGRectMake(320, 2710, 40, 30)];
    [border3title2 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title2.text=@"Sans  Objet";
    [scrollview addSubview:border3title2];
    
    UITextView *border3title32=[[UITextView alloc]initWithFrame:CGRectMake(660, 2710, 40, 30)];
    [border3title32 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title32.text=@"Sans  Objet";
    [scrollview addSubview:border3title32];
    
    UITextView *border3title3=[[UITextView alloc]initWithFrame:CGRectMake(320, 2760, 40, 30)];
    [border3title3 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title3.text=@"Sans  Objet";
    [scrollview addSubview:border3title3];
    
    UITextView *border3title33=[[UITextView alloc]initWithFrame:CGRectMake(660, 2760, 40, 30)];
    [border3title33 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title33.text=@"Sans  Objet";
    [scrollview addSubview:border3title33];
    
    UITextView *border3title4=[[UITextView alloc]initWithFrame:CGRectMake(320, 2810, 40, 30)];
    [border3title4 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title4.text=@"Sans  Objet";
    [scrollview addSubview:border3title4];
    
    UITextView *border3title34=[[UITextView alloc]initWithFrame:CGRectMake(660, 2810, 40, 30)];
    [border3title34 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title34.text=@"Sans  Objet";
    [scrollview addSubview:border3title34];
    
    UITextView *border3title5=[[UITextView alloc]initWithFrame:CGRectMake(320, 2860, 40, 30)];
    [border3title5 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title5.text=@"Sans  Objet";
    [scrollview addSubview:border3title5];
    
    UITextView *border3title35=[[UITextView alloc]initWithFrame:CGRectMake(660, 2860, 40, 30)];
    [border3title35 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title35.text=@"Sans  Objet";
    [scrollview addSubview:border3title35];
    
    UITextView *border3title6=[[UITextView alloc]initWithFrame:CGRectMake(320, 2910, 40, 30)];
    [border3title6 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title6.text=@"Sans  Objet";
    [scrollview addSubview:border3title6];
    
    UITextView *border3title7=[[UITextView alloc]initWithFrame:CGRectMake(320, 2960, 40, 30)];
    [border3title7 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title7.text=@"Sans  Objet";
    [scrollview addSubview:border3title7];
    
    UITextView *border3title8=[[UITextView alloc]initWithFrame:CGRectMake(320, 3010, 40, 30)];
    [border3title8 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title8.text=@"Sans  Objet";
    [scrollview addSubview:border3title8];
    
    self.button14=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button14.frame=CGRectMake(260, 2580, 25, 32);
    self.button14.layer.borderColor = [UIColor blackColor].CGColor;
    self.button14.layer.borderWidth = 1.0f;
    self.button14.tag=14;
    [self.button14 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button14];
    
    self.button15=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button15.frame=CGRectMake(650, 2580, 25, 32);
    self.button15.layer.borderColor = [UIColor blackColor].CGColor;
    self.button15.layer.borderWidth = 1.0f;
    self.button15.tag=15;
    [self.button15 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button15];
    
    self.button16=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button16.frame=CGRectMake(290, 2665, 22, 32);
    self.button16.layer.borderColor = [UIColor blackColor].CGColor;
    self.button16.layer.borderWidth = 1.0f;
    self.button16.tag=16;
    [self.button16 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button16];
    
    self.button17=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button17.frame=CGRectMake(350, 2665, 22, 32);
    self.button17.layer.borderColor = [UIColor blackColor].CGColor;
    self.button17.layer.borderWidth = 1.0f;
    self.button17.tag=17;
    [self.button17 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button17];
    
    self.button18=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button18.frame=CGRectMake(290, 2715, 22, 32);
    self.button18.layer.borderColor = [UIColor blackColor].CGColor;
    self.button18.layer.borderWidth = 1.0f;
    self.button18.tag=18;
    [self.button18 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button18];
    
    self.button19=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button19.frame=CGRectMake(350, 2715, 22, 32);
    self.button19.layer.borderColor = [UIColor blackColor].CGColor;
    self.button19.layer.borderWidth = 1.0f;
    self.button19.tag=19;
    [self.button19 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button19];
    
    self.button20=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button20.frame=CGRectMake(290, 2765, 22, 32);
    self.button20.layer.borderColor = [UIColor blackColor].CGColor;
    self.button20.layer.borderWidth = 1.0f;
    self.button20.tag=20;
    [self.button20 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button20];
    
    self.button21=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button21.frame=CGRectMake(350, 2765, 22, 32);
    self.button21.layer.borderColor = [UIColor blackColor].CGColor;
    self.button21.layer.borderWidth = 1.0f;
    self.button21.tag=21;
    [self.button21 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button21];
    
    self.button22=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button22.frame=CGRectMake(290, 2815, 22, 32);
    self.button22.layer.borderColor = [UIColor blackColor].CGColor;
    self.button22.layer.borderWidth = 1.0f;
    self.button22.tag=22;
    [self.button22 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button22];
    
    self.button23=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button23.frame=CGRectMake(350, 2815, 22, 32);
    self.button23.layer.borderColor = [UIColor blackColor].CGColor;
    self.button23.layer.borderWidth = 1.0f;
    self.button23.tag=23;
    [self.button23 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button23];
    
    self.button24=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button24.frame=CGRectMake(290, 2865, 22, 32);
    self.button24.layer.borderColor = [UIColor blackColor].CGColor;
    self.button24.layer.borderWidth = 1.0f;
    self.button24.tag=24;
    [self.button24 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button24];
    
    self.button25=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button25.frame=CGRectMake(350, 2865, 22, 32);
    self.button25.layer.borderColor = [UIColor blackColor].CGColor;
    self.button25.layer.borderWidth = 1.0f;
    self.button25.tag=25;
    [self.button25 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button25];
    
    self.button26=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button26.frame=CGRectMake(290, 2915, 22, 32);
    self.button26.layer.borderColor = [UIColor blackColor].CGColor;
    self.button26.layer.borderWidth = 1.0f;
    self.button26.tag=26;
    [self.button26 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button26];
    
    self.button27=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button27.frame=CGRectMake(350, 2915, 22, 32);
    self.button27.layer.borderColor = [UIColor blackColor].CGColor;
    self.button27.layer.borderWidth = 1.0f;
    self.button27.tag=27;
    [self.button27 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button27];
    
    self.button28=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button28.frame=CGRectMake(290, 2965, 22, 32);
    self.button28.layer.borderColor = [UIColor blackColor].CGColor;
    self.button28.layer.borderWidth = 1.0f;
    self.button28.tag=28;
    [self.button28 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button28];
    
    self.button29=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button29.frame=CGRectMake(350, 2965, 22, 32);
    self.button29.layer.borderColor = [UIColor blackColor].CGColor;
    self.button29.layer.borderWidth = 1.0f;
    self.button29.tag=29;
    [self.button29 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button29];
    
    self.button30=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button30.frame=CGRectMake(290, 3015, 22, 32);
    self.button30.layer.borderColor = [UIColor blackColor].CGColor;
    self.button30.layer.borderWidth = 1.0f;
    self.button30.tag=30;
    [self.button30 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button30];
    
    self.button31=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button31.frame=CGRectMake(350, 3015, 22, 32);
    self.button31.layer.borderColor = [UIColor blackColor].CGColor;
    self.button31.layer.borderWidth = 1.0f;
    self.button31.tag=31;
    [self.button31 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button31];
    
    self.button32=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button32.frame=CGRectMake(630, 2665, 22, 32);
    self.button32.layer.borderColor = [UIColor blackColor].CGColor;
    self.button32.layer.borderWidth = 1.0f;
    self.button32.tag=32;
    [self.button32 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button32];
    
    self.button33=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button33.frame=CGRectMake(690, 2665, 22, 32);
    self.button33.layer.borderColor = [UIColor blackColor].CGColor;
    self.button33.layer.borderWidth = 1.0f;
    self.button33.tag=33;
    [self.button33 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button33];
    
    self.button34=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button34.frame=CGRectMake(630, 2715, 22, 32);
    self.button34.layer.borderColor = [UIColor blackColor].CGColor;
    self.button34.layer.borderWidth = 1.0f;
    self.button34.tag=34;
    [self.button34 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button34];
    
    self.button35=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button35.frame=CGRectMake(690, 2715, 22, 32);
    self.button35.layer.borderColor = [UIColor blackColor].CGColor;
    self.button35.layer.borderWidth = 1.0f;
    self.button35.tag=35;
    [self.button35 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button35];
    
    self.button36=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button36.frame=CGRectMake(630, 2765, 22, 32);
    self.button36.layer.borderColor = [UIColor blackColor].CGColor;
    self.button36.layer.borderWidth = 1.0f;
    self.button36.tag=36;
    [self.button36 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button36];
    
    self.button37=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button37.frame=CGRectMake(690, 2765, 22, 32);
    self.button37.layer.borderColor = [UIColor blackColor].CGColor;
    self.button37.layer.borderWidth = 1.0f;
    self.button37.tag=37;
    [self.button37 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button37];
    
    self.button38=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button38.frame=CGRectMake(630, 2815, 22, 32);
    self.button38.layer.borderColor = [UIColor blackColor].CGColor;
    self.button38.layer.borderWidth = 1.0f;
    self.button38.tag=38;
    [self.button38 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button38];
    
    self.button39=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button39.frame=CGRectMake(690, 2815, 22, 32);
    self.button39.layer.borderColor = [UIColor blackColor].CGColor;
    self.button39.layer.borderWidth = 1.0f;
    self.button39.tag=39;
    [self.button39 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button39];
    
    self.button40=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button40.frame=CGRectMake(630, 2865, 22, 32);
    self.button40.layer.borderColor = [UIColor blackColor].CGColor;
    self.button40.layer.borderWidth = 1.0f;
    self.button40.tag=40;
    [self.button40 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button40];
    
    self.button41=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button41.frame=CGRectMake(690, 2865, 22, 32);
    self.button41.layer.borderColor = [UIColor blackColor].CGColor;
    self.button41.layer.borderWidth = 1.0f;
    self.button41.tag=41;
    [self.button41 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button41];
    
    
    UILabel *border3title11=[[UILabel alloc]initWithFrame:CGRectMake(270, 2665, 100, 21)];
    [border3title11 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title11.text=@"Oui";
    [scrollview addSubview:border3title11];
    
    UILabel *border3title321=[[UILabel alloc]initWithFrame:CGRectMake(610, 2665, 100, 21)];
    [border3title321 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title321.text=@"Oui";
    [scrollview addSubview:border3title321];
    
    UILabel *border3title21=[[UILabel alloc]initWithFrame:CGRectMake(270, 2715, 100, 21)];
    [border3title21 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title21.text=@"Oui";
    [scrollview addSubview:border3title21];
    
    UILabel *border3title322=[[UILabel alloc]initWithFrame:CGRectMake(610, 2715, 100, 21)];
    [border3title322 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title322.text=@"Oui";
    [scrollview addSubview:border3title322];
    
    UILabel *border3title23=[[UILabel alloc]initWithFrame:CGRectMake(270, 2765, 100, 21)];
    [border3title23 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title23.text=@"Oui";
    [scrollview addSubview:border3title23];
    
    UILabel *border3title323=[[UILabel alloc]initWithFrame:CGRectMake(610, 2765, 100, 21)];
    [border3title323 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title323.text=@"Oui";
    [scrollview addSubview:border3title323];
    
    UILabel *border3title24=[[UILabel alloc]initWithFrame:CGRectMake(270, 2815, 100, 21)];
    [border3title24 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title24.text=@"Oui";
    [scrollview addSubview:border3title24];
    
    UILabel *border3title324=[[UILabel alloc]initWithFrame:CGRectMake(610, 2815, 100, 21)];
    [border3title324 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title324.text=@"Oui";
    [scrollview addSubview:border3title324];
    
    UILabel *border3title25=[[UILabel alloc]initWithFrame:CGRectMake(270, 2865, 100, 21)];
    [border3title25 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title25.text=@"Oui";
    [scrollview addSubview:border3title25];
    
    UILabel *border3title325=[[UILabel alloc]initWithFrame:CGRectMake(610, 2865, 100, 21)];
    [border3title325 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title325.text=@"Oui";
    [scrollview addSubview:border3title325];
    
    UILabel *border3title26=[[UILabel alloc]initWithFrame:CGRectMake(270, 2915, 100, 21)];
    [border3title26 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title26.text=@"Oui";
    [scrollview addSubview:border3title26];
    
    UILabel *border3title27=[[UILabel alloc]initWithFrame:CGRectMake(270, 2965, 100, 21)];
    [border3title27 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title27.text=@"Oui";
    [scrollview addSubview:border3title27];
    
    UILabel *border3title28=[[UILabel alloc]initWithFrame:CGRectMake(270, 3015, 100, 21)];
    [border3title28 setFont:[UIFont fontWithName:@"Arial" size:9]];
    border3title28.text=@"Oui";
    [scrollview addSubview:border3title28];
    
    UILabel *titlelabel=[[UILabel alloc]initWithFrame:CGRectMake(300, 1335, 375, 35)];
    [titlelabel setFont:[UIFont fontWithName:@"Systembold" size:13]];
    titlelabel.text=@"Environnement électrique";
    titlelabel.textColor=[UIColor blueColor];
    [scrollview addSubview:titlelabel];
    
    UILabel *titlelabel1=[[UILabel alloc]initWithFrame:CGRectMake(180, 1951, 450, 35)];
    [titlelabel1 setFont:[UIFont fontWithName:@"Systembold" size:13]];
    titlelabel1.text=@"Schéma du réseau électrique concerné par l’intervention";
    titlelabel1.textColor=[UIColor blueColor];
    [scrollview addSubview:titlelabel1];
    
    UIButton * btn_EditSignature3 = [ UIButton buttonWithType:UIButtonTypeSystem] ;
    [btn_EditSignature3 setTitle:@"Edit" forState:UIControlStateNormal] ;
    btn_EditSignature3.frame=CGRectMake(670, 1951, 60, 35);
    btn_EditSignature3.tag = 8888;
    [btn_EditSignature3 addTarget:self action:@selector(scheditbutclicked:) forControlEvents:UIControlEventTouchUpInside] ;
    [scrollview addSubview:btn_EditSignature3] ;
    
    
    UILabel *titlelabel2=[[UILabel alloc]initWithFrame:CGRectMake(180, 2530, 450, 35)];
    [titlelabel2 setFont:[UIFont fontWithName:@"Systembold" size:13]];
    titlelabel2.text=@"Validation de la préparation sécurité de l’intervention";
    titlelabel2.textColor=[UIColor blueColor];
    [scrollview addSubview:titlelabel2];
    
    
    UITextView *bottomtext=[[UITextView alloc]initWithFrame:CGRectMake(32, 2485, 710, 45)];
    [bottomtext setFont:[UIFont fontWithName:@"Arial" size:8]];
    bottomtext.text=@"Si l’intervention a lieu sur un équipement mobile entièrement déconnecté du tableau électrique, ce schéma n’est pas obligatoire. Sinon, il doit comporter une description succincte de l’installation concernée par l’intervention et les éventuelles sources d’énergies potentielles. Une indication sur les zones hors et sous tension doit apparaitre. La signalisation des mises à la terre et des cadenas posés lors de phase de consignation permet de visualiser la conformité de la mise en sécurité de la zone. L’annotation de ces éléments sur un schéma fournis par le client est à privilégier.";
    bottomtext.backgroundColor=[UIColor clearColor];
    [scrollview addSubview:bottomtext];
    
    
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(36, 1370, 230, 564)];
    view1.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:view1];
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(268, 1370, 240, 564)];
    view2.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:view2];
    
    UIView *view3=[[UIView alloc]initWithFrame:CGRectMake(510, 1370, 220, 564)];
    view3.backgroundColor=[UIColor whiteColor];
    [self.scrollview addSubview:view3];
    
    UILabel *view1title1=[[UILabel alloc]initWithFrame:CGRectMake(40, 1371, 100, 21)];
    [view1title1 setFont:[UIFont fontWithName:@"Arial" size:10]];
    
    view1title1.text=@"Risque en amont :";
    
    [scrollview addSubview:view1title1];
    
    UILabel *view2title1=[[UILabel alloc]initWithFrame:CGRectMake(275, 1371, 100, 21)];
    [view2title1 setFont:[UIFont fontWithName:@"Arial" size:10]];
    
    view2title1.text=@"Risque en aval :";
    
    [scrollview addSubview:view2title1];
    
    
    UILabel *view3title1=[[UILabel alloc]initWithFrame:CGRectMake(545, 1371, 150, 21)];
    [view3title1 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view3title1.text=@"Evolution de l’état de l’installation";
    [scrollview addSubview:view3title1];
    
    UILabel *view3title2=[[UILabel alloc]initWithFrame:CGRectMake(545, 1400, 160, 21)];
    [view3title2 setFont:[UIFont fontWithName:@"Arial" size:8]];
    view3title2.text=@"(informer l’ensemble des intervenants)";
    [scrollview addSubview:view3title2];
    
    textv2=[[UITextView alloc]initWithFrame:CGRectMake(520, 1430, 200, 390)];
    [textv2 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textv2.layer.borderWidth=1.0;
    textv2.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [scrollview addSubview:textv2];
    
    UILabel *view1title2=[[UILabel alloc]initWithFrame:CGRectMake(84, 1405, 100, 21)];
    [view1title2 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title2.text=@"Alimentation EDF";
    [scrollview addSubview:view1title2];
    
    UILabel *view2title2=[[UILabel alloc]initWithFrame:CGRectMake(315, 1405, 105, 21)];
    [view2title2 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view2title2.text=@"Consignée avec MALT";
    [scrollview addSubview:view2title2];
    
    UILabel *view1title3=[[UILabel alloc]initWithFrame:CGRectMake(130, 1452, 100, 21)];
    [view1title3 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title3.text=@"Présente";
    [scrollview addSubview:view1title3];
    
    UILabel *view2title3=[[UILabel alloc]initWithFrame:CGRectMake(315, 1452, 100, 21)];
    [view2title3 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view2title3.text=@"Séparée sans MALT";
    [scrollview addSubview:view2title3];
    
    UILabel *view1title4=[[UILabel alloc]initWithFrame:CGRectMake(130, 1497, 110, 21)];
    [view1title4 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title4.text=@"Consignée avec MALT";
    [scrollview addSubview:view1title4];
    
    UILabel *view2title4=[[UILabel alloc]initWithFrame:CGRectMake(315, 1497, 110, 21)];
    [view2title4 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view2title4.text=@"Onduleur";
    [scrollview addSubview:view2title4];
    
    self.button1=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button1.frame=CGRectMake(55, 1400, 22, 33);
    self.button1.layer.borderColor = [UIColor blackColor].CGColor;
    self.button1.layer.borderWidth = 1.0f;
    self.button1.tag=1;
    [self.button1 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button1];
    
    self.button2=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button2.frame=CGRectMake(100, 1450, 22, 28);
    self.button2.layer.borderColor = [UIColor blackColor].CGColor;
    self.button2.layer.borderWidth = 1.0f;
    self.button2.tag=2;
    [self.button2 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button2];
    
    self.button3=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button3.frame=CGRectMake(100, 1495, 22, 28);
    self.button3.layer.borderColor = [UIColor blackColor].CGColor;
    self.button3.layer.borderWidth = 1.0f;
    self.button3.tag=3;
    [self.button3 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button3];
    
    self.button4=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button4.frame=CGRectMake(100, 1540, 22, 28);
    self.button4.layer.borderColor = [UIColor blackColor].CGColor;
    self.button4.layer.borderWidth = 1.0f;
    self.button4.tag=4;
    [self.button4 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button4];
    
    self.button5=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button5.frame=CGRectMake(55, 1590, 22, 28);
    self.button5.layer.borderColor = [UIColor blackColor].CGColor;
    self.button5.layer.borderWidth = 1.0f;
    self.button5.tag=5;
    [self.button5 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button5];
    
    self.button6=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button6.frame=CGRectMake(55, 1635, 22, 28);
    self.button6.layer.borderColor = [UIColor blackColor].CGColor;
    self.button6.layer.borderWidth = 1.0f;
    self.button6.tag=6;
    [self.button6 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button6];
    
    self.button7=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button7.frame=CGRectMake(55, 1680, 22, 28);
    self.button7.layer.borderColor = [UIColor blackColor].CGColor;
    self.button7.layer.borderWidth = 1.0f;
    self.button7.tag=7;
    [self.button7 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button7];
    
    self.button8=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button8.frame=CGRectMake(55, 1725, 22, 28);
    self.button8.layer.borderColor = [UIColor blackColor].CGColor;
    self.button8.layer.borderWidth = 1.0f;
    self.button8.tag=8;
    [self.button8 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button8];
    
    
    self.button9=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button9.frame=CGRectMake(285, 1400, 22, 33);
    self.button9.layer.borderColor = [UIColor blackColor].CGColor;
    self.button9.layer.borderWidth = 1.0f;
    self.button9.tag=9;
    [self.button9 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button9];
    
    self.button10=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button10.frame=CGRectMake(285, 1450, 22, 28);
    self.button10.layer.borderColor = [UIColor blackColor].CGColor;
    self.button10.layer.borderWidth = 1.0f;
    self.button10.tag=10;
    [self.button10 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button10];
    
    self.button11=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button11.frame=CGRectMake(285, 1495, 22, 28);
    self.button11.layer.borderColor = [UIColor blackColor].CGColor;
    self.button11.layer.borderWidth = 1.0f;
    self.button11.tag=11;
    [self.button11 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button11];
    
    self.button12=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button12.frame=CGRectMake(285, 1540, 22, 28);
    self.button12.layer.borderColor = [UIColor blackColor].CGColor;
    self.button12.layer.borderWidth = 1.0f;
    self.button12.tag=12;
    [self.button12 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button12];
    
    self.button13=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button13.frame=CGRectMake(285, 1595, 22, 28);
    self.button13.layer.borderColor = [UIColor blackColor].CGColor;
    self.button13.layer.borderWidth = 1.0f;
    self.button13.tag=13;
    [self.button13 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollview addSubview:self.button13];
    
    self.tpbutton17=[UIButton buttonWithType:UIButtonTypeCustom];
    self.tpbutton17.frame=CGRectMake(15, 8, 22, 22);
    self.tpbutton17.layer.borderColor = [UIColor blackColor].CGColor;
    self.tpbutton17.layer.borderWidth = 1.0f;
    self.tpbutton17.tag=58;
    [self.tpbutton17 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * img_17 = [[ UIImageView alloc] initWithImage:[ UIImage imageNamed:@"17"]] ;
    img_17.frame = CGRectMake(41, 0, 44, 37) ;
    [ self.listviews1 addSubview:img_17] ;
    [self.listviews1 addSubview:self.tpbutton17];
    
    self.tpbutton18=[UIButton buttonWithType:UIButtonTypeCustom];
    self.tpbutton18.frame=CGRectMake(15, 8, 22, 22);
    self.tpbutton18.layer.borderColor = [UIColor blackColor].CGColor;
    self.tpbutton18.layer.borderWidth = 1.0f;
    self.tpbutton18.tag=59;
    [self.tpbutton18 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * img_18 = [[ UIImageView alloc] initWithImage:[ UIImage imageNamed:@"18"]] ;
    img_18.frame = CGRectMake(41, 0, 44, 37) ;
    [ self.listviews2 addSubview:img_18] ;
    [self.listviews2 addSubview:self.tpbutton18];
    
    self.tpbutton19=[UIButton buttonWithType:UIButtonTypeCustom];
    self.tpbutton19.frame=CGRectMake(15, 8, 22, 22);
    self.tpbutton19.layer.borderColor = [UIColor blackColor].CGColor;
    self.tpbutton19.layer.borderWidth = 1.0f;
    self.tpbutton19.tag=60;
    [self.tpbutton19 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * img_19 = [[ UIImageView alloc] initWithImage:[ UIImage imageNamed:@"19"]] ;
    img_19.frame = CGRectMake(41, 0, 44, 37) ;
    [ self.listviews3 addSubview:img_19] ;
    [self.listviews3 addSubview:self.tpbutton19];
    
    self.tpbutton20=[UIButton buttonWithType:UIButtonTypeCustom];
    self.tpbutton20.frame=CGRectMake(15, 12, 22, 22);
    self.tpbutton20.layer.borderColor = [UIColor blackColor].CGColor;
    self.tpbutton20.layer.borderWidth = 1.0f;
    self.tpbutton20.tag=61;
    [self.tpbutton20 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView * img_20 = [[ UIImageView alloc] initWithImage:[ UIImage imageNamed:@"20"]] ;
    img_20.frame = CGRectMake(41, 0, 44, 37) ;
    [ self.listviews4 addSubview:img_20] ;
    [self.listviews4 addSubview:self.tpbutton20];
    
    self.tpbutton21=[UIButton buttonWithType:UIButtonTypeCustom];
    self.tpbutton21.frame=CGRectMake(15, 19, 22, 22);
    self.tpbutton21.layer.borderColor = [UIColor blackColor].CGColor;
    self.tpbutton21.layer.borderWidth = 1.0f;
    self.tpbutton21.tag=62;
    [self.tpbutton21 addTarget:self action:@selector(butclicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * img_21 = [[ UIImageView alloc] initWithImage:[ UIImage imageNamed:@"21"]] ;
    img_21.frame = CGRectMake(41, 0, 44, 37) ;
    [ self.listviews5 addSubview:img_21] ;
    
    [self.listviews5 addSubview:self.tpbutton21];
    
    UILabel *view1title5=[[UILabel alloc]initWithFrame:CGRectMake(130, 1544, 110, 21)];
    [view1title5 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title5.text=@"Séparée sans MALT";
    [scrollview addSubview:view1title5];
    
    UILabel *view2title5=[[UILabel alloc]initWithFrame:CGRectMake(315, 1544, 120, 21)];
    [view2title5 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view2title5.text=@"Batterie de condensateurs";
    [scrollview addSubview:view2title5];
    
    UILabel *view1title6=[[UILabel alloc]initWithFrame:CGRectMake(85, 1595, 110, 21)];
    [view1title6 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title6.text=@"Groupe électrogène";
    [scrollview addSubview:view1title6];
    
    UILabel *view2title6=[[UILabel alloc]initWithFrame:CGRectMake(315, 1595, 120, 21)];
    [view2title6 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view2title6.text=@"Autres sources auxiliaires";
    [scrollview addSubview:view2title6];
    
    
    view2tv1=[[UITextView alloc]initWithFrame:CGRectMake(290, 1640, 190, 80)];
    [view2tv1 setFont:[UIFont fontWithName:@"Arial" size:9]];
    view2tv1.layer.borderWidth=1.0;
    view2tv1.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [scrollview addSubview:view2tv1];
    
    UILabel *view1title7=[[UILabel alloc]initWithFrame:CGRectMake(85, 1640, 110, 21)];
    [view1title7 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title7.text=@"Onduleur";
    [scrollview addSubview:view1title7];
    
    UILabel *view1title8=[[UILabel alloc]initWithFrame:CGRectMake(85, 1685, 120, 21)];
    [view1title8 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title8.text=@"Batterie de condensateurs";
    [scrollview addSubview:view1title8];
    
    UILabel *view1title9=[[UILabel alloc]initWithFrame:CGRectMake(85, 1730, 120, 21)];
    [view1title9 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title9.text=@"Autres sources auxiliaires";
    [scrollview addSubview:view1title9];
    
    view1tv1=[[UITextView alloc]initWithFrame:CGRectMake(60, 1770, 190, 80)];
    [view1tv1 setFont:[UIFont fontWithName:@"Arial" size:9]];
    view1tv1.layer.borderWidth=1.0;
    view1tv1.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [scrollview addSubview:view1tv1];
    
    
    UITextView *view1title11=[[UITextView alloc]initWithFrame:CGRectMake(275, 1860, 230, 30)];
    [view1title11 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title11.text=@"La tension est présente jusqu’à (organe de coupure) :";
    [scrollview addSubview:view1title11];
    
    UITextView *view1title10=[[UITextView alloc]initWithFrame:CGRectMake(55, 1860, 200, 30)];
    [view1title10 setFont:[UIFont fontWithName:@"Arial" size:10]];
    view1title10.text=@"La tension est présente jusqu’à (organe de coupure) :";
    [scrollview addSubview:view1title10];
   
    
    //self.nom2_text=[[UITextField alloc]initWithFrame:CGRectMake(408,3465, 145, 40)];
    self.amont_la_tension=[[UITextField alloc]initWithFrame:CGRectMake(55, 1895, 200, 30)];
    [self.amont_la_tension setFont:[UIFont fontWithName:@"Arial" size:10]];
    self.amont_la_tension.tag=800;
    self.amont_la_tension.layer.borderWidth=1.0;
    self.amont_la_tension.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [scrollview addSubview: self.amont_la_tension];
  //  self.amont_la_tension.delegate=self;
 
    
    
    self.aval_la_tension=[[UITextField alloc]initWithFrame:CGRectMake(275, 1895, 230, 30)];
    [self.aval_la_tension setFont:[UIFont fontWithName:@"Arial" size:10]];
    self.aval_la_tension.tag=801;
    self.aval_la_tension.layer.borderWidth=1.0;
    self.aval_la_tension.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [scrollview addSubview:self.aval_la_tension];
//    self.aval_la_tension.delegate=self;

    
    UILabel *labels=[[UILabel alloc]initWithFrame:CGRectMake(85, 8, 160, 21)];
    [labels setFont:[UIFont fontWithName:@"Arial-BoldMT" size:10  ]];
    labels.text=@"Travail isolé";
    [self.listviews1 addSubview:labels];
    
    UILabel *labels1=[[UILabel alloc]initWithFrame:CGRectMake(85, 8, 160, 21)];
    [labels1 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:10]];
    labels1.text=@"Fluide ";
    [self.listviews2 addSubview:labels1];
    
    UILabel *labels2=[[UILabel alloc]initWithFrame:CGRectMake(85, 8, 160, 21)];
    [labels2 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:10]];
    labels2.text=@"Manutention mécanisée";
    [self.listviews3 addSubview:labels2];
    
    UILabel *labels3=[[UILabel alloc]initWithFrame:CGRectMake(85, 11, 160, 21)];
    [labels3 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:10]];
    labels3.text=@"Environnementaux";
    [self.listviews4 addSubview:labels3];
    
    
    UILabel *labels4=[[UILabel alloc]initWithFrame:CGRectMake(85, 15, 160, 21)];
    [labels4 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:10]];
    labels4.text=@"Autres";
    [self.listviews5 addSubview:labels4];
    
    
    UITextView *textview1=[[UITextView alloc]initWithFrame:CGRectMake(234, -5, 184, 37)];
    [textview1 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textview1.text=@"Isolement : géographique, hors de vue, hors de porté de voix, dû au bruit, dû aux horaires.";
    [self.listviews1 addSubview:textview1];
    UITextView *textview2=[[UITextView alloc]initWithFrame:CGRectMake(434, -5, 260, 38)];
    [textview2 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textview2.text=@"Respecter l’instruction sur le travail isolé.  Organiser et formaliser dans le PdP le mode de surveillance. Définir les moyens de communication.";
    [textview2 setFont:[UIFont fontWithName:@"Arial" size:9]];
    //textview1.text=@"Isolement : géographique, hors de vue, hors de porté de voix, dû au bruit, dû aux horaires.";
    [self.listviews1 addSubview:textview1];
    [self.listviews1 addSubview:textview2];
    
    UITextView *textview3=[[UITextView alloc]initWithFrame:CGRectMake(234, -5, 184, 37)];
    [textview3 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textview3.text=@"Pression et température dans les canalisations.                           Eclatement ou rupture de canalisation.";
    [self.listviews2 addSubview:textview3];
    
    UITextView *textview4=[[UITextView alloc]initWithFrame:CGRectMake(434, -2, 260, 38)];
    [textview4 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textview4.text=@"S’assurer du repérage et de l’identification des canalisations. Faire consigner les réseaux des fluides.";
    [textview4 setFont:[UIFont fontWithName:@"Arial" size:9]];
    [self.listviews2 addSubview:textview4];
    
    
    
    UITextView *textview5=[[UITextView alloc]initWithFrame:CGRectMake(234, -5, 184, 37)];
    [textview5 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textview5.text=@"Travail sous ou à proximité d’une charge            en cours de manutention.      Grue, pont roulant, chariot, transpalette…";
    [self.listviews3 addSubview:textview5];
    
    UITextView *textview6=[[UITextView alloc]initWithFrame:CGRectMake(434, -5, 260, 38)];
    [textview6 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textview6.text=@"Gérer la co-activité. Vérifier le balisage des zones de manutention. Maitriser la sous traitance de manutention. Vérifier les moyens de manutention.";
    [self.listviews3 addSubview:textview6];
    
    
    UITextView *textview7=[[UITextView alloc]initWithFrame:CGRectMake(234, -5, 184, 37)];
    [textview7 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textview7.text=@"Utilisation de produits dangereux pour l'environnement (Huiles, graisses, produits lessiviels...). DIB et DID" ;
    [self.listviews4 addSubview:textview7];
    
    UITextView *textview8=[[UITextView alloc]initWithFrame:CGRectMake(434, -5, 260, 40)];
    [textview8 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textview8.text=@"Prévoir des bacs de rétention et protection des sols lors de l'utilisation. Avoir les FDS. Faire tri sélectif des déchets pour traitement en filières. Dépôt sur site client avec accord sinon retour agence";
    [self.listviews4 addSubview:textview8];
    
    
    textv=[[UITextView alloc]initWithFrame:CGRectMake(234, 5, 184, 55)];
    [textv setFont:[UIFont fontWithName:@"Arial" size:9]];
    textv.text=@"";
    textv.layer.borderWidth=1.0;
    textv.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [self.listviews5 addSubview:textv];
    
    textv1=[[UITextView alloc]initWithFrame:CGRectMake(434,5, 260, 55)];
    [textv1 setFont:[UIFont fontWithName:@"Arial" size:9]];
    textv1.text=@"";
    textv1.layer.borderWidth=1.0;
    textv1.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    [self.listviews5 addSubview:textv1];
    
    
    
    UILabel *footlabel=[[UILabel alloc]initWithFrame:CGRectMake(35, 1307, 375, 30)];
    [footlabel setFont:[UIFont fontWithName:@"Arial" size:13]];
    
    footlabel.text=@"Cocher le risque et rayer les mentions inutiles dans les colonnes ";
    
    [scrollview addSubview:footlabel];
    
    // NSString *str = @"causes potentielles";
    // NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    //[attributedString addAttribute:NSUnderlineStyleNone value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:NSMakeRange(6, 9)];
    
    
    NSMutableAttributedString *yourString = [[NSMutableAttributedString alloc] initWithString:@"causes potentielles"];
    [yourString addAttribute:NSUnderlineStyleAttributeName
                       value:[NSNumber numberWithInt:1]
                       range:(NSRange){0,19}];
    
    // label.attributedText = [yourString copy];
    
    UILabel *footlabel1=[[UILabel alloc]initWithFrame:CGRectMake(408, 1307, 115, 30)];
    [footlabel1 setFont:[UIFont fontWithName:@"Arial" size:13]];
    //footlabel.text=@"causes potentielles";
    footlabel1.textColor=[UIColor redColor];
    //[footlabel1 setAttributedText:attributedString];
    footlabel1.attributedText=[yourString copy];
    //footlabel1.backgroundColor=[UIColor yellowColor];
    [scrollview addSubview:footlabel1];
    
    UILabel *footlabel2=[[UILabel alloc]initWithFrame:CGRectMake(523, 1307, 50, 30)];
    [footlabel2 setFont:[UIFont fontWithName:@"Arial" size:13]];
    
    footlabel2.text=@"et";
    
    [scrollview addSubview:footlabel2];
    
    
    NSMutableAttributedString *yourString1 = [[NSMutableAttributedString alloc] initWithString:@"mesures de prévention"];
    [yourString1 addAttribute:NSUnderlineStyleAttributeName
                        value:[NSNumber numberWithInt:1]
                        range:(NSRange){0,21}];
    
    // label.attributedText = [yourString copy];
    
    UILabel *footlabel3=[[UILabel alloc]initWithFrame:CGRectMake(540, 1307, 135, 30)];
    [footlabel3 setFont:[UIFont fontWithName:@"Arial" size:13]];
    //footlabel.text=@"causes potentielles";
    footlabel3.textColor=[UIColor redColor];
    //[footlabel1 setAttributedText:attributedString];
    footlabel3.attributedText=[yourString1 copy];
    //footlabel1.backgroundColor=[UIColor yellowColor];
    [scrollview addSubview:footlabel3];
    
    [self.view addSubview:scrollview];
    
    
    
    self.tpbutton1.layer.borderWidth = 1.0f;
    
    self.tpbutton2.layer.borderWidth = 1.0f;
    
    self.tpbutton3.layer.borderWidth = 1.0f;
    
    self.tpbutton4.layer.borderWidth = 1.0f;
    
    self.tpbutton5.layer.borderWidth = 1.0f;
    
    self.tpbutton6.layer.borderWidth = 1.0f;
    
    self.tpbutton7.layer.borderWidth = 1.0f;
    
    self.tpbutton8.layer.borderWidth = 1.0f;
    
    self.tpbutton9.layer.borderWidth = 1.0f;
    
    self.tpbutton10.layer.borderWidth = 1.0f;
    
    self.tpbutton11.layer.borderWidth = 1.0f;
    
    self.tpbutton12.layer.borderWidth = 1.0f;
    
    self.tpbutton13.layer.borderWidth = 1.0f;
    
    self.tpbutton14.layer.borderWidth = 1.0f;
    
    self.tpbutton15.layer.borderWidth = 1.0f;
    
    self.tpbutton16.layer.borderWidth = 1.0f;
    
    
    
    
    NSLog(@"The retried array is %@", self.retrievedarray);
    
    if (self.IsForUpdating==YES)
    {
        _nde_dossier.text=(self.retrievedarray)[0] [@"nde_dossier"];
        _date_des_travaux.text=(self.retrievedarray)[0] [@"date_des_travaux"];
        _ndu_pdp.text=(self.retrievedarray)[0] [@"ndu_pdp"];
        _ndu_ppsp.text=(self.retrievedarray)[0] [@"ndu_ppsp"];
        _ouvrage_concerne.text=(self.retrievedarray)[0] [@"ouvrage_concerne"];
        _libelle_des_travaux.text=(self.retrievedarray)[0] [@"libelle_des_travaux"];
        _nom.text=(self.retrievedarray)[0] [@"nom"];
        
        NSString *datas11=(self.retrievedarray)[0][@"signature"];
        NSData *data11=[[NSData alloc]initWithBase64EncodedData:datas11 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image11=[[UIImage alloc]init];
        image11=[UIImage imageWithData:data11];
        [self.imagesign1 setImage:image11];
        
        
        NSString *strb1=(self.retrievedarray)[0] [@"ambiance_atmos"];
        NSString *strb2=@"YES";
        
        if([strb1 isEqualToString:strb2])
        {
            [self.tpbutton1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb1=@"YES";
        }
        else
        {
            tpb1=@"NO";
        }
        
        NSString *strb21=(self.retrievedarray)[0] [@"ambiance_lumi"];
       
        if([strb21 isEqualToString:strb2])
        {
            [self.tpbutton2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb2=@"YES";
        }
        else
        {
            tpb2=@"NO";
        }
        
        NSString *strb31=(self.retrievedarray)[0] [@"conditions_clim"];
        if([strb31 isEqualToString:strb2])
        {
            [self.tpbutton3 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb3=@"YES";
        }
        else
        {
            tpb3=@"NO";
        }
        
        NSString *strb41=(self.retrievedarray)[0] [@"ambiance_sono"];
    
        if([strb41 isEqualToString:strb2])
        {
            [self.tpbutton4 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb4=@"YES";
        }
        else
        {
            tpb4=@"NO";
        }
        
        NSString *strb51=(self.retrievedarray)[0] [@"chimiques"];
        if([strb51 isEqualToString:strb2])
        {
            [self.tpbutton5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb5=@"YES";
        }
        else
        {
            tpb5=@"NO";
        }
        NSString *strb61=(self.retrievedarray)[0] [@"chute_de_plain"];
        if([strb61 isEqualToString:strb2])
        {
            [self.tpbutton6 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb6=@"YES";
        }
        else
        {
            tpb6=@"NO";
        }
        
        NSString *strb71=(self.retrievedarray)[0] [@"chute_de_hau"];
        if([strb71 isEqualToString:strb2])
        {
            [self.tpbutton7 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb7=@"YES";
        }
        else
        {
            tpb7=@"NO";
        }
        
        NSString *strb81=(self.retrievedarray)[0] [@"chute_deob"];
        if([strb81 isEqualToString:strb2])
        {
            [self.tpbutton8 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb8=@"YES";
        }
        else
        {
            tpb8=@"NO";
        }
        
        
        NSString *strb91=(self.retrievedarray)[0] [@"routier_et_dep"];
        if([strb91 isEqualToString:strb2])
        {
            [self.tpbutton9 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb9=@"YES";
        }
        else
        {
            tpb9=@"NO";
        }
        
        NSString *strb101=(self.retrievedarray)[0] [@"danger_elect"];
        if([strb101 isEqualToString:strb2])
        {
            [self.tpbutton10 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb10=@"YES";
        }
        else
        {
            tpb10=@"NO";
        }
        
        NSString *strb111=(self.retrievedarray)[0] [@"amiante"];
        if([strb111 isEqualToString:strb2])
        {
            [self.tpbutton11 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb11=@"YES";
        }
        else
        {
            tpb11=@"NO";
        }
        
        NSString *strb121=(self.retrievedarray)[0] [@"musculo_sque"];
        if([strb121 isEqualToString:strb2])
        {
            [self.tpbutton12 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb12=@"YES";
        }
        else
        {
            tpb12=@"NO";
        }
        
        NSString *strb131=(self.retrievedarray)[0] [@"coupure_bleas"];
        if([strb131 isEqualToString:strb2])
        {
            [self.tpbutton13 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb13=@"YES";
        }
        else
        {
            tpb13=@"NO";
        }
        
        NSString *strb141=(self.retrievedarray)[0] [@"incendie"];
        if([strb141 isEqualToString:strb2])
        {
            [self.tpbutton14 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb14=@"YES";
        }
        else
        {
            tpb14=@"NO";
        }
        
        NSString *strb151=(self.retrievedarray)[0] [@"co_activite"];
        if([strb151 isEqualToString:strb2])
        {
            [self.tpbutton15 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb15=@"YES";
        }
        else
        {
            tpb15=@"NO";
        }
        
        NSString *strb161=(self.retrievedarray)[0] [@"machine_out"];
        if([strb161 isEqualToString:strb2])
        {
            [self.tpbutton16 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb16=@"YES";
        }
        else
        {
            tpb16=@"NO";
        }
        
        NSString *strb171=(self.retrievedarray)[0] [@"travail_iso"];
        if([strb171 isEqualToString:strb2])
        {
            [self.tpbutton17 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb17=@"YES";
        }
        else
        {
            tpb17=@"NO";
        }
        
        NSString *strb181=(self.retrievedarray)[0] [@"fluide"];
        if([strb181 isEqualToString:strb2])
        {
            [self.tpbutton18 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb18=@"YES";
        }
        else
        {
            tpb18=@"NO";
        }
        
        NSString *strb191=(self.retrievedarray)[0] [@"manuten_mecan"];
        if([strb191 isEqualToString:strb2])
        {
            [self.tpbutton19 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb19=@"YES";
        }
        else
        {
            tpb19=@"NO";
        }
        
        NSString *strb201=(self.retrievedarray)[0] [@"environmentaux"];
        if([strb201 isEqualToString:strb2])
        {
            [self.tpbutton20 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb20=@"YES";
        }
        else
        {
            tpb20=@"NO";
        }
        
        NSString *strb221=(self.retrievedarray)[0] [@"autres"];
        if([strb221 isEqualToString:strb2])
        {
            [self.tpbutton21 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb21=@"YES";
        }
        else
        {
            tpb21=@"NO";
        }
        
        
        
        
        NSString *strbb1=(self.retrievedarray)[0] [@"amont _alimentation_edf"];
        if([strbb1 isEqualToString:strb2])
        {
            [self.button1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b1=@"YES";
        }
        else
        {
            b1=@"NO";
        }
        
        NSString *strbb21=(self.retrievedarray)[0] [@"amont _presente"];
        if([strbb21 isEqualToString:strb2])
        {
            [self.button2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b2=@"YES";
        }
        else
        {
            b2=@"NO";
        }

        
        NSString *strbb31=(self.retrievedarray)[0] [@"amont _consignee_avec_malt"];
        if([strbb31 isEqualToString:strb2])
        {
            [self.button3 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b3=@"YES";
        }
        else
        {
            b3=@"NO";
        }

        
        NSString *strbb41=(self.retrievedarray)[0] [@"amont _separee_sans_malt"];
        if([strbb41 isEqualToString:strb2])
        {
            [self.button4 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b4=@"YES";
        }
        else
        {
            b4=@"NO";
        }

        
        NSString *strbb51=(self.retrievedarray)[0] [@"amont _groupe_eletrogene"];
        if([strbb51 isEqualToString:strb2])
        {
            [self.button5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b5=@"YES";
        }
        else
        {
            b5=@"NO";
        }

        
        NSString *strbb61=(self.retrievedarray)[0] [@"amont _onduleur"];
        if([strbb61 isEqualToString:strb2])
        {
            [self.button6 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b6=@"YES";
        }
        else
        {
            b6=@"NO";
        }

        
        NSString *strbb71=(self.retrievedarray)[0] [@"amont _batterie_de_cond"];
        if([strbb71 isEqualToString:strb2])
        {
            [self.button7 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b7=@"YES";
        }
        else
        {
            b7=@"NO";
        }

        
        NSString *strbb81=(self.retrievedarray)[0] [@"amont_autres_sources_auxiliaires"];
        if([strbb81 isEqualToString:strb2])
        {
            [self.button8 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b8=@"YES";
        }
        else
        {
            b8=@"NO";
        }

        
        NSString *strbb121=(self.retrievedarray)[0] [@"aval_consignee_avec_malt"];
        if([strbb121 isEqualToString:strb2])
        {
            [self.button9 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b9=@"YES";
        }
        else
        {
            b9=@"NO";
        }

        
        NSString *strbb131=(self.retrievedarray)[0] [@"aval_separee_sans_malt"];
        if([strbb131 isEqualToString:strb2])
        {
            [self.button10 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b10=@"YES";
        }
        else
        {
            b10=@"NO";
        }

        
        NSString *strbb141=(self.retrievedarray)[0] [@"aval_onduleur"];
        if([strbb141 isEqualToString:strb2])
        {
            [self.button11 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b11=@"YES";
        }
        else
        {
            b11=@"NO";
        }

        
        
        NSString *strbb151=(self.retrievedarray)[0] [@"aval_batterie_de_cond"];
        if([strbb151 isEqualToString:strb2])
        {
            [self.button12 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b12=@"YES";
        }
        else
        {
            b12=@"NO";
        }

        
        
        NSString *strbb161=(self.retrievedarray)[0] [@"aval_autres_src_auxiliaires"];
        if([strbb161 isEqualToString:strb2])
        {
            [self.button13 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b13=@"YES";
        }
        else
        {
            b13=@"NO";
        }

        
        
        NSString *strbb211=(self.retrievedarray)[0] [@"pdp_ou_ppsps"];
        if([strbb211 isEqualToString:strb2])
        {
            [self.button14 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b14=@"YES";
        }
        else
        {
            b14=@"NO";
        }

        
        
        NSString *strbb221=(self.retrievedarray)[0] [@"connaissance_de"];
        if([strbb221 isEqualToString:strb2])
        {
            [self.button15 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b15=@"YES";
        }
        else
        {
            b15=@"NO";
        }

        
        NSString *strbb311=(self.retrievedarray)[0] [@"attestation_oui"];
        if([strbb311 isEqualToString:strb2])
        {
            [self.button16 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b16=@"YES";
        }
        else
        {
            b16=@"NO";
        }

        
        NSString *strbb321=(self.retrievedarray)[0] [@"attestation_objet"];
        if([strbb321 isEqualToString:strb2])
        {
            [self.button17 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b17=@"YES";
        }
        else
        {
            b17=@"NO";
        }

        
        
        NSString *strbb331=(self.retrievedarray)[0] [@"connaissance_oui"];
        if([strbb331 isEqualToString:strb2])
        {
            [self.button18 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b18=@"YES";
        }
        else
        {
            b18=@"NO";
        }

        
        
        
        NSString *strbb341=(self.retrievedarray)[0] [@"connaissance_objet"];
        if([strbb341 isEqualToString:strb2])
        {
            [self.button19 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b19=@"YES";
        }
        else
        {
            b19=@"NO";
        }

        
        
        NSString *strbb351=(self.retrievedarray)[0] [@"pose_ht_oui"];
        if([strbb351 isEqualToString:strb2])
        {
            [self.button20 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b20=@"YES";
        }
        else
        {
            b20=@"NO";
        }
        
        NSString *strbb361=(self.retrievedarray)[0] [@"pose_ht_objet"];
        if([strbb361 isEqualToString:strb2])
        {
            [self.button21 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b21=@"YES";
        }
        else
        {
            b21=@"NO";
        }

        
        NSString *strbb371=(self.retrievedarray)[0] [@"pose_bt_oui"];
        if([strbb371 isEqualToString:strb2])
        {
            [self.button22 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b22=@"YES";
        }
        else
        {
            b22=@"NO";
        }

        
        NSString *strbb381=(self.retrievedarray)[0] [@"pose_bt_objet"];
        if([strbb381 isEqualToString:strb2])
        {
            [self.button23 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b23=@"YES";
        }
        else
        {
            b23=@"NO";
        }

        
        NSString *strbb391=(self.retrievedarray)[0] [@"vat_faite_oui"];
        if([strbb391 isEqualToString:strb2])
        {
            [self.button24 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b24=@"YES";
        }
        else
        {
            b24=@"NO";
        }

        
        
        NSString *strbb411=(self.retrievedarray)[0] [@"vat_faite_objet"];
        if([strbb411 isEqualToString:strb2])
        {
            [self.button25 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b25=@"YES";
        }
        else
        {
            b25=@"NO";
        }

        
        NSString *strbb421=(self.retrievedarray)[0] [@"malt_vaite_oui"];
        if([strbb421 isEqualToString:strb2])
        {
            [self.button26 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b26=@"YES";
        }
        else
        {
            b26=@"NO";
        }

        
        
        NSString *strbb431=(self.retrievedarray)[0] [@"malt_vaite_objet"];
        if([strbb431 isEqualToString:strb2])
        {
            [self.button27 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b27=@"YES";
        }
        else
        {
            b27=@"NO";
        }

        
        NSString *strbb441=(self.retrievedarray)[0] [@"balisage_oui"];
        if([strbb441 isEqualToString:strb2])
        {
            [self.button28 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b28=@"YES";
        }
        else
        {
            b28=@"NO";
        }

        
        NSString *strbb451=(self.retrievedarray)[0] [@"balisage_objet"];
        if([strbb451 isEqualToString:strb2])
        {
            [self.button29 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b29=@"YES";
        }
        else
        {
            b29=@"NO";
        }

        
        
        NSString *strbb461=(self.retrievedarray)[0] [@"protection_oui"];
        if([strbb461 isEqualToString:strb2])
        {
            [self.button30 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b30=@"YES";
        }
        else
        {
            b30=@"NO";
        }

        
        NSString *strbb471=(self.retrievedarray)[0] [@"protection_objet"];
        if([strbb471 isEqualToString:strb2])
        {
            [self.button31 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b31=@"YES";
        }
        else
        {
            b31=@"NO";
        }

        
        NSString *strbb481=(self.retrievedarray)[0] [@"balisage_zone_de_oui"];
        if([strbb481 isEqualToString:strb2])
        {
            [self.button32 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b32=@"YES";
        }
        else
        {
            b32=@"NO";
        }

        
        NSString *strbb491=(self.retrievedarray)[0] [@"balisage_zone_de_objet"];
        if([strbb491 isEqualToString:strb2])
        {
            [self.button33 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b33=@"YES";
        }
        else
        {
            b33=@"NO";
        }

        
        NSString *strbb511=(self.retrievedarray)[0] [@"mise_en_place_oui"];
        if([strbb511 isEqualToString:strb2])
        {
            [self.button34 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b34=@"YES";
        }
        else
        {
            b34=@"NO";
        }

        
        NSString *strbb521=(self.retrievedarray)[0] [@"mise_en_place_objet"];
        if([strbb521 isEqualToString:strb2])
        {
            [self.button35 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b35=@"YES";
        }
        else
        {
            b35=@"NO";
        }

        
        NSString *strbb531=(self.retrievedarray)[0] [@"port_des_epi_oui"];
        if([strbb531 isEqualToString:strb2])
        {
            [self.button36 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b36=@"YES";
        }
        else
        {
            b36=@"NO";
        }

        
        NSString *strbb541=(self.retrievedarray)[0] [@"port_des_epi_objet"];
        if([strbb541 isEqualToString:strb2])
        {
            [self.button37 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b37=@"YES";
        }
        else
        {
            b37=@"NO";
        }

        
        NSString *strbb551=(self.retrievedarray)[0] [@"connaissance_des_issues_oui"];
        if([strbb551 isEqualToString:strb2])
        {
            [self.button38 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b38=@"YES";
        }
        else
        {
            b38=@"NO";
        }

        
        NSString *strbb561=(self.retrievedarray)[0] [@"connaissance_des_issues_objet"];
        if([strbb561 isEqualToString:strb2])
        {
            [self.button39 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b39=@"YES";
        }
        else
        {
            b39=@"NO";
        }

        
        NSString *strbb571=(self.retrievedarray)[0] [@"val15_oui"];
        if([strbb571 isEqualToString:strb2])
        {
            [self.button40 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b40=@"YES";
        }
        else
        {
            b40=@"NO";
        }

        
        NSString *strbb581=(self.retrievedarray)[0] [@"val15_object"];
        if([strbb581 isEqualToString:strb2])
        {
            [self.button41 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b41=@"YES";
        }
        else
        {
            b41=@"NO";
        }

        
        NSString *strb661=(self.retrievedarray)[0] [@"auto_oui"];
        if([strb661 isEqualToString:strb2])
        {
            [self.bigbox setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b42=@"YES";
        }
        else
        {
            b42=@"NO";
        }

        
        NSString *datas1112=(self.retrievedarray)[0][@"Schema_signature"];
        UIImage * img_Retrieved = [ self decodeBase64ToImage:datas1112] ;
        //NSData *data1112=[[NSData alloc]initWithBase64EncodedData:datas1112 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        //UIImage *image1112=[[UIImage alloc]init];
        //image1112=[UIImage imageWithData:data1112];
        [self.border2backimage setImage:img_Retrieved];
        NSLog(@"IMAGE SET");
        
           
        _amont_la_tension.text=(self.retrievedarray)[0] [@"amont_la_tension"];
        _aval_la_tension.text=(self.retrievedarray)[0] [@"aval_la_tension"];
        
        _autorisation_de_travail_nom.text=(self.retrievedarray)[0] [@"autorisation_de_travail_nom"];
        
        NSString *datas1111=(self.retrievedarray)[0][@"autorisation_de_travail_signature"];
        NSData *data1111=[[NSData alloc]initWithBase64EncodedData:datas1111 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image1111=[[UIImage alloc]init];
        image1111=[UIImage imageWithData:data1111];
        [self.signature1 setImage:image1111];
        
        _nom1_text.text=(self.retrievedarray)[0] [@"val_intervenants_nom1"];
        _nom2_text.text=(self.retrievedarray)[0] [@"val_intervenants_nom2"];
        self.textv.text=(self.retrievedarray)[0] [@"autres_txt1"];
        self.textv1.text=(self.retrievedarray)[0] [@"autres_txt2"];
        
        self.view1tv1.text=(self.retrievedarray)[0][@"amont_auttv1"];
        self.view2tv1.text=(self.retrievedarray)[0][@"aval_auttv1"];
        
        self.textv2.text=(self.retrievedarray)[0][@"evol_tv1"];
        
        NSString *datas1=(self.retrievedarray)[0][@"val_intervenants_signature1"];
        NSData *data=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image=[[UIImage alloc]init];
        image=[UIImage imageWithData:data];
        [self.sig1 setImage:image];
        
        NSString *datas222=(self.retrievedarray)[0][@"val_intervenants_signature2"];
        NSData *data222=[[NSData alloc]initWithBase64EncodedData:datas222 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image222=[[UIImage alloc]init];
        image222=[UIImage imageWithData:data222];
        [self.sig2 setImage:image222];
        
    }
    
    //nde_dossier, *date_des_travaux, *ndu_pdp, *ndu_ppsp, *ouvrage_concerne, *libelle_des_travaux, *nom, *amont_la_tension, *aval_la_tension, *autorisation_de_travail_nom, *nom1_text, *nom2_text;
  
    self.nde_dossier.delegate=self;
    self.date_des_travaux.delegate=self;
    self.ndu_pdp.delegate=self;
    self.ndu_ppsp.delegate=self;
    self.ouvrage_concerne.delegate=self;
    self.libelle_des_travaux.delegate=self;
    self.nom.delegate=self;
    self.amont_la_tension.delegate=self;
    self.aval_la_tension.delegate=self;
    self.autorisation_de_travail_nom.delegate=self;
    self.nom1_text.delegate=self;
    self.nom2_text.delegate=self;
    
//    *view2tv1, *view1tv1, *textv2, *textv, *textv1;
    
    self.view2tv1.delegate=self;
    self.view1tv1.delegate=self;
    self.textv2.delegate=self;
    self.textv.delegate=self;
    self.textv1.delegate=self;
    
}

#pragma mark TextfieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField==self.nom1_text || textField==self.nom2_text) {
        
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textField==self.autorisation_de_travail_nom)
    {
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textField==self.aval_la_tension)
    {
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1250;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textField==self.amont_la_tension)
    {
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1250;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textField==self.nde_dossier || textField==self.ndu_pdp || textField==self.ndu_ppsp || textField==self.ouvrage_concerne || textField==self.libelle_des_travaux)
    {
        
        CGRect scrollViewFrame=self.scrollview.frame;
        scrollViewFrame.origin.y=0;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textField==self.date_des_travaux)
    {
        
        [self.view endEditing:YES];
        
        [self showDatePicker];
        
        return NO;
        
    }
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    needsRemoveFirstResponder=YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    needsRemoveFirstResponder=NO;
}

#pragma mark TextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return YES;
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
//    *view2tv1, *view1tv1, *textv2, *textv, *textv1;
    if (textView.tag==800 || textView.tag==801) {
        
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1500;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];

        
    }
    else if(textView==view2tv1)
    {
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1700;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==view1tv1)
    {
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1600;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==textv2)
    {
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1700;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==textv)
    {
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-2100;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(textView==textv1)
    {
        CGRect scrollViewFrame=self.scrollview.frame;
        CGPoint bottomOffset = CGPointMake(0, self.scrollview.contentSize.height - self.scrollview.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-2100;
        [self.scrollview scrollRectToVisible:scrollViewFrame animated:YES];
    }
    needsRemoveFirstResponder=YES;
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    needsRemoveFirstResponder=NO;
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


-(IBAction)butclicked:(id)sender
{
    UIButton *butt=(UIButton *)sender;
    
    if (butt.tag==1)
        
    {
        
        if (self.button1.currentBackgroundImage==nil)
        {
            [self.button1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b1=@"YES";
            
        }
        else if(self.button1.currentBackgroundImage!=nil)
            
        {
            [self.button1 setBackgroundImage:nil forState:UIControlStateNormal];
            b1=@"NO";
        }
    }
    
    else if (butt.tag==2)
        
    {
        
        if (self.button2.currentBackgroundImage==nil)
        {
            [self.button2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b2=@"YES";
            
        }
        else if(self.button2.currentBackgroundImage!=nil)
            
        {
            [self.button2 setBackgroundImage:nil forState:UIControlStateNormal];
            b2=@"NO";
        }
    }
    
    else if (butt.tag==3)
        
    {
        
        if (self.button3.currentBackgroundImage==nil)
        {
            [self.button3 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b3=@"YES";
        }
        else if(self.button3.currentBackgroundImage!=nil)
            
        {
            [self.button3 setBackgroundImage:nil forState:UIControlStateNormal];
            b3=@"NO";
        }
    }
    
    else if (butt.tag==4)
        
    {
        
        if (self.button4.currentBackgroundImage==nil)
        {
            [self.button4 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b4=@"YES";
        }
        else if(self.button4.currentBackgroundImage!=nil)
            
        {
            [self.button4 setBackgroundImage:nil forState:UIControlStateNormal];
            b4=@"NO";
        }
    }
    
    else if (butt.tag==5)
        
    {
        
        if (self.button5.currentBackgroundImage==nil)
        {
            [self.button5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b5=@"YES";
        }
        else if(self.button5.currentBackgroundImage!=nil)
            
        {
            [self.button5 setBackgroundImage:nil forState:UIControlStateNormal];
            b5=@"NO";
        }
    }
    
    else if (butt.tag==6)
        
    {
        
        if (self.button6.currentBackgroundImage==nil)
        {
            [self.button6 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b6=@"YES";
        }
        else if(self.button6.currentBackgroundImage!=nil)
            
        {
            [self.button6 setBackgroundImage:nil forState:UIControlStateNormal];
            b6=@"NO";
        }
    }
    
    else if (butt.tag==7)
        
    {
        
        if (self.button7.currentBackgroundImage==nil)
        {
            [self.button7 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b7=@"YES";
        }
        else if(self.button7.currentBackgroundImage!=nil)
            
        {
            [self.button7 setBackgroundImage:nil forState:UIControlStateNormal];
            b7=@"NO";
        }
    }
    
    else if (butt.tag==8)
        
    {
        
        if (self.button8.currentBackgroundImage==nil)
        {
            [self.button8 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b8=@"YES";
        }
        else if(self.button8.currentBackgroundImage!=nil)
            
        {
            [self.button8 setBackgroundImage:nil forState:UIControlStateNormal];
            b8=@"NO";
        }
    }
    
    else if (butt.tag==9)
        
    {
        
        if (self.button9.currentBackgroundImage==nil)
        {
            [self.button9 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b9=@"YES";
        }
        else if(self.button9.currentBackgroundImage!=nil)
            
        {
            [self.button9 setBackgroundImage:nil forState:UIControlStateNormal];
            b9=@"NO";
        }
    }
    
    else if (butt.tag==10)
        
    {
        
        if (self.button10.currentBackgroundImage==nil)
        {
            [self.button10 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b10=@"YES";
        }
        else if(self.button10.currentBackgroundImage!=nil)
            
        {
            [self.button10 setBackgroundImage:nil forState:UIControlStateNormal];
            b10=@"NO";
        }
    }
    
    else if (butt.tag==11)
        
    {
        
        if (self.button11.currentBackgroundImage==nil)
        {
            [self.button11 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b11=@"YES";
        }
        else if(self.button11.currentBackgroundImage!=nil)
            
        {
            [self.button11 setBackgroundImage:nil forState:UIControlStateNormal];
            b11=@"NO";
        }
    }
    
    else if (butt.tag==12)
        
    {
        
        if (self.button12.currentBackgroundImage==nil)
        {
            [self.button12 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b12=@"YES";
        }
        else if(self.button12.currentBackgroundImage!=nil)
            
        {
            [self.button12 setBackgroundImage:nil forState:UIControlStateNormal];
            b12=@"NO";
        }
    }
    
    else if (butt.tag==13)
        
    {
        
        if (self.button13.currentBackgroundImage==nil)
        {
            [self.button13 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b13=@"YES";
        }
        else if(self.button13.currentBackgroundImage!=nil)
            
        {
            [self.button13 setBackgroundImage:nil forState:UIControlStateNormal];
            b13=@"NO";
        }
    }
    
    else if (butt.tag==14)
        
    {
        if (self.button14.currentBackgroundImage==nil)
        {
            [self.button14 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b14=@"YES";
        }
        else if(self.button14.currentBackgroundImage!=nil)
            
        {
            [self.button14 setBackgroundImage:nil forState:UIControlStateNormal];
            b14=@"NO";
        }
    }
    
    else if (butt.tag==15)
        
    {
        
        if (self.button15.currentBackgroundImage==nil)
        {
            [self.button15 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b15=@"YES";
        }
        else if(self.button15.currentBackgroundImage!=nil)
            
        {
            [self.button15 setBackgroundImage:nil forState:UIControlStateNormal];
            b15=@"NO";
        }
    }
    
    else if (butt.tag==16)
        
    {
        
        
        if (self.button16.currentBackgroundImage==nil)
        {
            [self.button16 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b16=@"YES";
            [self.button17 setBackgroundImage:nil forState:UIControlStateNormal];
            b17=@"NO";
        }
        else if(self.button16.currentBackgroundImage!=nil)
            
        {
            [self.button16 setBackgroundImage:nil forState:UIControlStateNormal];
            b16=@"NO";
        }
    }
    
    else if (butt.tag==17)
        
    {
        
        
        if (self.button17.currentBackgroundImage==nil)
        {
            [self.button17 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b17=@"YES";
            [self.button16 setBackgroundImage:nil forState:UIControlStateNormal];
            b16=@"NO";

        }
        else if(self.button17.currentBackgroundImage!=nil)
            
        {
            [self.button17 setBackgroundImage:nil forState:UIControlStateNormal];
            b17=@"NO";
        }
    }
    
    else if (butt.tag==18)
        
    {
        
        if (self.button18.currentBackgroundImage==nil)
        {
            [self.button18 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b18=@"YES";
            [self.button19 setBackgroundImage:nil forState:UIControlStateNormal];
             b19=@"NO";

        }
        else if(self.button18.currentBackgroundImage!=nil)
            
        {
            [self.button18 setBackgroundImage:nil forState:UIControlStateNormal];
            b18=@"NO";
        }
    }
    
    else if (butt.tag==19)
        
    {
        
        
        if (self.button19.currentBackgroundImage==nil)
        {
            [self.button19 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b19=@"YES";
            [self.button18 setBackgroundImage:nil forState:UIControlStateNormal];
             b18=@"NO";
        }
        else if(self.button19.currentBackgroundImage!=nil)
            
        {
            [self.button19 setBackgroundImage:nil forState:UIControlStateNormal];
            b19=@"NO";
        }
    }
    
    else if (butt.tag==20)
        
    {
       
        
        if (self.button20.currentBackgroundImage==nil)
        {
            [self.button20 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b20=@"YES";
             [self.button21 setBackgroundImage:nil forState:UIControlStateNormal];
            b21=@"NO";
        }
        else if(self.button20.currentBackgroundImage!=nil)
            
        {
            [self.button20 setBackgroundImage:nil forState:UIControlStateNormal];
            b20=@"NO";
        }
    }
    
    else if (butt.tag==21)
        
    {
        
        
        if (self.button21.currentBackgroundImage==nil)
        {
            [self.button21 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b21=@"YES";
            [self.button20 setBackgroundImage:nil forState:UIControlStateNormal];
            b20=@"NO";
        }
        else if(self.button21.currentBackgroundImage!=nil)
            
        {
            [self.button21 setBackgroundImage:nil forState:UIControlStateNormal];
            b21=@"NO";
        }
    }
    
    else if (butt.tag==22)
        
    {
       
        
        if (self.button22.currentBackgroundImage==nil)
        {
            [self.button22 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b22=@"YES";
             [self.button23 setBackgroundImage:nil forState:UIControlStateNormal];
            b23=@"NO";

        }
        else if(self.button22.currentBackgroundImage!=nil)
            
        {
            [self.button22 setBackgroundImage:nil forState:UIControlStateNormal];
            b22=@"NO";
        }
    }
    
    else if (butt.tag==23)
        
    {
        
        
        if (self.button23.currentBackgroundImage==nil)
        {
            [self.button23 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b23=@"YES";
            [self.button22 setBackgroundImage:nil forState:UIControlStateNormal];
            b22=@"NO";
        }
        else if(self.button23.currentBackgroundImage!=nil)
            
        {
            [self.button23 setBackgroundImage:nil forState:UIControlStateNormal];
            b23=@"NO";
        }
    }
    
    else if (butt.tag==24)
        
    {
       
        
        if (self.button24.currentBackgroundImage==nil)
        {
            [self.button24 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b24=@"YES";
             [self.button25 setBackgroundImage:nil forState:UIControlStateNormal];
             b25=@"NO";
        }
        else if(self.button24.currentBackgroundImage!=nil)
            
        {
            [self.button24 setBackgroundImage:nil forState:UIControlStateNormal];
            b24=@"NO";
        }
    }
    
    
    else if (butt.tag==25)
        
    {
       
        
        if (self.button25.currentBackgroundImage==nil)
        {
            [self.button25 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b25=@"YES";
             [self.button24 setBackgroundImage:nil forState:UIControlStateNormal];
             b24=@"NO";
        }
        else if(self.button25.currentBackgroundImage!=nil)
            
        {
            [self.button25 setBackgroundImage:nil forState:UIControlStateNormal];
            b25=@"NO";
        }
    }
    
    
    else if (butt.tag==26)
        
    {
      
        
        if (self.button26.currentBackgroundImage==nil)
        {
            [self.button26 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b26=@"YES";
            [self.button27 setBackgroundImage:nil forState:UIControlStateNormal];
            b27=@"NO";
            
        }
        else if(self.button26.currentBackgroundImage!=nil)
            
        {
            [self.button26 setBackgroundImage:nil forState:UIControlStateNormal];
            b26=@"NO";
        }
    }
    
    
    else if (butt.tag==27)
        
    {
        
        
        if (self.button27.currentBackgroundImage==nil)
        {
            [self.button27 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b27=@"YES";
            [self.button26 setBackgroundImage:nil forState:UIControlStateNormal];
             b26=@"NO";
        }
        else if(self.button27.currentBackgroundImage!=nil)
            
        {
            [self.button27 setBackgroundImage:nil forState:UIControlStateNormal];
            b27=@"NO";
        }
    }
    
    
    else if (butt.tag==28)
        
    {
        
        
        if (self.button28.currentBackgroundImage==nil)
        {
            [self.button28 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b28=@"YES";
            [self.button29 setBackgroundImage:nil forState:UIControlStateNormal];
            b29=@"NO";

        }
        else if(self.button28.currentBackgroundImage!=nil)
            
        {
            [self.button28 setBackgroundImage:nil forState:UIControlStateNormal];
            b28=@"NO";
        }
    }
    
    
    else if (butt.tag==29)
        
    {
       
        
        if (self.button29.currentBackgroundImage==nil)
        {
            [self.button29 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b29=@"YES";
             [self.button28 setBackgroundImage:nil forState:UIControlStateNormal];
            b28=@"NO";
            
        }
        else if(self.button29.currentBackgroundImage!=nil)
            
        {
            [self.button29 setBackgroundImage:nil forState:UIControlStateNormal];
            b29=@"NO";
        }
    }
    
    
    else if (butt.tag==30)
        
    {
       
        
        if (self.button30.currentBackgroundImage==nil)
        {
            [self.button30 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b30=@"YES";
             [self.button31 setBackgroundImage:nil forState:UIControlStateNormal];
             b31=@"NO";
        }
        else if(self.button30.currentBackgroundImage!=nil)
            
        {
            [self.button30 setBackgroundImage:nil forState:UIControlStateNormal];
            b30=@"NO";
        }
    }
    
    
    else if (butt.tag==31)
        
    {
        
        
        if (self.button31.currentBackgroundImage==nil)
        {
            [self.button31 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b31=@"YES";
            [self.button30 setBackgroundImage:nil forState:UIControlStateNormal];
            b30=@"NO";
        }
        else if(self.button31.currentBackgroundImage!=nil)
            
        {
            [self.button31 setBackgroundImage:nil forState:UIControlStateNormal];
            b31=@"NO";
        }
    }
    
    else if (butt.tag==32)
        
    {
        
        if (self.button32.currentBackgroundImage==nil)
        {
            [self.button32 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b32=@"YES";
            [self.button33 setBackgroundImage:nil forState:UIControlStateNormal];
            b33=@"NO";


        }
        else if(self.button32.currentBackgroundImage!=nil)
            
        {
            [self.button32 setBackgroundImage:nil forState:UIControlStateNormal];
            b32=@"NO";
        }
    }
    
    else if (butt.tag==33)
        
    {
        
        
        if (self.button33.currentBackgroundImage==nil)
        {
            [self.button33 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b33=@"YES";
            [self.button32 setBackgroundImage:nil forState:UIControlStateNormal];
            b32=@"NO";
        }
        else if(self.button33.currentBackgroundImage!=nil)
            
        {
            [self.button33 setBackgroundImage:nil forState:UIControlStateNormal];
            b33=@"NO";
        }
    }
    
    else if (butt.tag==34)
        
    {
        
        
        if (self.button34.currentBackgroundImage==nil)
        {
            [self.button34 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b34=@"YES";
            [self.button35 setBackgroundImage:nil forState:UIControlStateNormal];
            b35=@"NO";

        }
        else if(self.button34.currentBackgroundImage!=nil)
            
        {
            [self.button34 setBackgroundImage:nil forState:UIControlStateNormal];
            b34=@"NO";
        }
    }
    
    else if (butt.tag==35)
        
    {
        
        
        if (self.button35.currentBackgroundImage==nil)
        {
            [self.button35 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b35=@"YES";
            [self.button34 setBackgroundImage:nil forState:UIControlStateNormal];
            b34=@"NO";
        }
        else if(self.button35.currentBackgroundImage!=nil)
            
        {
            [self.button35 setBackgroundImage:nil forState:UIControlStateNormal];
            b35=@"NO";
        }
    }
    
    else if (butt.tag==36)
        
    {
        
        
        if (self.button36.currentBackgroundImage==nil)
        {
            [self.button36 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b36=@"YES";
            [self.button37 setBackgroundImage:nil forState:UIControlStateNormal];
             b37=@"NO";
        }
        else if(self.button36.currentBackgroundImage!=nil)
            
        {
            [self.button36 setBackgroundImage:nil forState:UIControlStateNormal];
            b36=@"NO";
        }
    }
    
    else if (butt.tag==37)
        
    {
       
        
        if (self.button37.currentBackgroundImage==nil)
        {
            [self.button37 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b37=@"YES";
             [self.button36 setBackgroundImage:nil forState:UIControlStateNormal];
             b36=@"NO";
        }
        else if(self.button37.currentBackgroundImage!=nil)
            
        {
            [self.button37 setBackgroundImage:nil forState:UIControlStateNormal];
            b37=@"NO";
        }
    }
    
    else if (butt.tag==38)
        
    {
      
        
        if (self.button38.currentBackgroundImage==nil)
        {
            [self.button38 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b38=@"YES";
              [self.button39 setBackgroundImage:nil forState:UIControlStateNormal];
             b39=@"NO";
        }
        else if(self.button38.currentBackgroundImage!=nil)
            
        {
            [self.button38 setBackgroundImage:nil forState:UIControlStateNormal];
            b38=@"NO";
        }
    }
    
    else if (butt.tag==39)
        
    {
       
        
        if (self.button39.currentBackgroundImage==nil)
        {
            [self.button39 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b39=@"YES";
             [self.button38 setBackgroundImage:nil forState:UIControlStateNormal];
             b38=@"NO";
        }
        else if(self.button39.currentBackgroundImage!=nil)
            
        {
            [self.button39 setBackgroundImage:nil forState:UIControlStateNormal];
            b39=@"NO";
        }
    }
    
    else if (butt.tag==40)
        
    {
       
        
        if (self.button40.currentBackgroundImage==nil)
        {
            [self.button40 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b40=@"YES";
             [self.button41 setBackgroundImage:nil forState:UIControlStateNormal];
            b41=@"NO";
        }
        else if(self.button40.currentBackgroundImage!=nil)
            
        {
            [self.button40 setBackgroundImage:nil forState:UIControlStateNormal];
            b40=@"NO";
        }
    }
    
    else if (butt.tag==41)
        
    {
        
        if (self.button41.currentBackgroundImage==nil)
        {
            [self.button41 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b41=@"YES";
            [self.button40 setBackgroundImage:nil forState:UIControlStateNormal];
             b40=@"NO";

        }
        else if(self.button41.currentBackgroundImage!=nil)
            
        {
            [self.button41 setBackgroundImage:nil forState:UIControlStateNormal];
            
        }
    }
    
    else if (butt.tag==42)
    {
        if (self.tpbutton1.currentBackgroundImage==nil)
        {
            [self.tpbutton1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb1=@"YES";
        }
        else if(self.tpbutton1.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton1 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb1=@"NO";
        }
    }
    
    else if (butt.tag==43)
    {
        if (self.tpbutton2.currentBackgroundImage==nil)
        {
            [self.tpbutton2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb2=@"YES";
        }
        else if(self.tpbutton2.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton2 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb2=@"NO";
        }
    }
    
    else if (butt.tag==44)
    {
        if (self.tpbutton3.currentBackgroundImage==nil)
        {
            [self.tpbutton3 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb3=@"YES";
        }
        else if(self.tpbutton3.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton3 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb3=@"NO";
        }
    }
    
    else if (butt.tag==45)
    {
        if (self.tpbutton4.currentBackgroundImage==nil)
        {
            [self.tpbutton4 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb4=@"YES";
        }
        else if(self.tpbutton4.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton4 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb4=@"NO";
        }
    }
    
    else if (butt.tag==46)
    {
        if (self.tpbutton5.currentBackgroundImage==nil)
        {
            [self.tpbutton5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb5=@"YES";
        }
        else if(self.tpbutton5.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton5 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb5=@"NO";
        }
    }
    
    else if (butt.tag==47)
    {
        if (self.tpbutton6.currentBackgroundImage==nil)
        {
            [self.tpbutton6 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb6=@"YES";
        }
        else if(self.tpbutton6.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton6 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb6=@"NO";
        }
    }
    
    else if (butt.tag==48)
    {
        if (self.tpbutton7.currentBackgroundImage==nil)
        {
            [self.tpbutton7 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb7=@"YES";
        }
        else if(self.tpbutton7.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton7 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb7=@"NO";
        }
    }
    
    else if (butt.tag==49)
    {
        if (self.tpbutton8.currentBackgroundImage==nil)
        {
            [self.tpbutton8 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb8=@"YES";
        }
        else if(self.tpbutton8.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton8 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb8=@"NO";
        }
    }
    
    else if (butt.tag==50)
    {
        if (self.tpbutton9.currentBackgroundImage==nil)
        {
            [self.tpbutton9 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb9=@"YES";
        }
        else if(self.tpbutton9.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton9 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb9=@"NO";
        }
    }
    
    else if (butt.tag==51)
    {
        if (self.tpbutton10.currentBackgroundImage==nil)
        {
            [self.tpbutton10 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb10=@"YES";
        }
        else if(self.tpbutton10.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton10 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb10=@"NO";
        }
    }
    
    else if (butt.tag==52)
    {
        if (self.tpbutton11.currentBackgroundImage==nil)
        {
            [self.tpbutton11 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb11=@"YES";
        }
        else if(self.tpbutton11.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton11 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb11=@"NO";
        }
    }
    
    else if (butt.tag==53)
    {
        if (self.tpbutton12.currentBackgroundImage==nil)
        {
            [self.tpbutton12 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb12=@"YES";
        }
        else if(self.tpbutton12.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton12 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb12=@"NO";
        }
    }
    
    else if (butt.tag==54)
    {
        if (self.tpbutton13.currentBackgroundImage==nil)
        {
            [self.tpbutton13 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb13=@"YES";
        }
        else if(self.tpbutton13.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton13 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb13=@"NO";
        }
    }
    
    else if (butt.tag==55)
    {
        if (self.tpbutton14.currentBackgroundImage==nil)
        {
            [self.tpbutton14 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb14=@"YES";
        }
        else if(self.tpbutton14.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton14 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb14=@"NO";
        }
    }
    
    else if (butt.tag==56)
    {
        if (self.tpbutton15.currentBackgroundImage==nil)
        {
            [self.tpbutton15 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb15=@"YES";
        }
        else if(self.tpbutton15.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton15 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb15=@"NO";
        }
    }
    
    else if (butt.tag==57)
    {
        if (self.tpbutton16.currentBackgroundImage==nil)
        {
            [self.tpbutton16 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb16=@"YES";
        }
        else if(self.tpbutton16.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton16 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb16=@"NO";
        }
    }
    
    else if (butt.tag==58)
    {
        if (self.tpbutton17.currentBackgroundImage==nil)
        {
            [self.tpbutton17 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb17=@"YES";
        }
        else if(self.tpbutton17.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton17 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb17=@"NO";
        }
    }
    
    else if (butt.tag==59)
    {
        if (self.tpbutton18.currentBackgroundImage==nil)
        {
            [self.tpbutton18 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb18=@"YES";
        }
        else if(self.tpbutton18.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton18 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb18=@"NO";
        }
    }
    
    else if (butt.tag==60)
    {
        if (self.tpbutton19.currentBackgroundImage==nil)
        {
            [self.tpbutton19 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb19=@"YES";
        }
        else if(self.tpbutton19.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton19 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb19=@"NO";
        }
    }
    
    else if (butt.tag==61)
    {
        if (self.tpbutton20.currentBackgroundImage==nil)
        {
            [self.tpbutton20 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb20=@"YES";
        }
        else if(self.tpbutton20.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton20 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb20=@"NO";
        }
    }
    
    else if (butt.tag==62)
    {
        if (self.tpbutton21.currentBackgroundImage==nil)
        {
            [self.tpbutton21 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            tpb21=@"YES";
        }
        else if(self.tpbutton21.currentBackgroundImage!=nil)
            
        {
            [self.tpbutton21 setBackgroundImage:nil forState:UIControlStateNormal];
            tpb21=@"NO";
        }
    }
    
    
}

-(void)bigboxAction
{
    NSLog(@"Big box Action") ;
    NSLog(@"%@" , bigbox.currentBackgroundImage) ;
    bigbox.currentBackgroundImage == nil ? [bigbox setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal] : [ bigbox setBackgroundImage:nil forState:UIControlStateNormal] ;
    b42=@"YES";
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


-(void)saveToDataBase : ( UIBarButtonItem * ) currentBarButton
{
        int  nnn;
        NSDateFormatter *forma=[[NSDateFormatter alloc]init];
        NSDate *now=[NSDate date];
        [forma setDateFormat:@"dd-MM-YYYY"] ;
        NSString *datestring12 = [forma stringFromDate:now];
    
        NSString * str_Sig1 = [ self encodeToBase64String:self.imagesign1.image] ;
        NSString * str_Sig2 = [ self encodeToBase64String:self.signature1.image] ;
        NSString * str_Sig3 = [ self encodeToBase64String:self.sig1.image] ;
        NSString * str_Sig4 = [ self encodeToBase64String:self.sig2.image] ;
        NSString * str_Sig5 = [ self encodeToBase64String:self.border2backimage.image] ;

        if (self.IsForUpdating==YES)
        {
            if (self.retrievedarray!=nil)
            {
                NSLog(@"retrive:%@",self.retrievedarray);
                NSLog(@"retrive:%@",(self.retrievedarray)[0][@"risk_id"]);
                NSString *str=(self.retrievedarray)[0][@"risk_id"];
                nnn=[str intValue];
            }
            else
            {
                NSString * str_GetCount = @"SELECT risk_id FROM risk_analysis" ;
                int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
                nnn =  CurrentCount;
            }
        
            [self openPerPagePDF] ;
            NSString *updateSQL = [NSString stringWithFormat:
                               @"update risk_analysis set doc_name='%@',nde_dossier='%@',date_des_travaux='%@',ndu_pdp='%@',ndu_ppsp='%@',ouvrage_concerne='%@',libelle_des_travaux='%@',nom='%@',signature='%@',ambiance_atmos='%@',ambiance_lumi='%@',conditions_clim='%@',ambiance_sono='%@',chimiques='%@',chute_de_plain='%@',chute_de_hau='%@',chute_deob='%@',routier_et_dep='%@',danger_elect='%@',amiante='%@',musculo_sque='%@',coupure_bleas='%@',incendie='%@',co_activite='%@',machine_out='%@',travail_iso='%@',fluide='%@',manuten_mecan='%@',environmentaux='%@',autres='%@',autres_txt1='%@',autres_txt2='%@',amont _alimentation_edf='%@',amont _presente='%@',amont _consignee_avec_malt='%@',amont _separee_sans_malt='%@',amont _groupe_eletrogene='%@',amont _onduleur='%@',amont _batterie_de_cond='%@',amont_autres_sources_auxiliaires='%@',amont_auttv1='%@',aval_consignee_avec_malt='%@',aval_separee_sans_malt='%@',aval_onduleur='%@',aval_batterie_de_cond='%@',aval_autres_src_auxiliaires='%@',aval_auttv1='%@',amont_la_tension='%@',aval_la_tension='%@',evol_tv1='%@',Schema_signature='%@',pdp_ou_ppsps='%@',connaissance_de='%@',attestation_oui='%@',attestation_objet='%@',connaissance_oui='%@',connaissance_objet='%@',pose_ht_oui='%@',pose_ht_objet='%@',pose_bt_oui='%@',pose_bt_objet='%@',vat_faite_oui='%@',vat_faite_objet='%@',malt_vaite_oui='%@',malt_vaite_objet='%@',balisage_oui='%@',balisage_objet='%@',protection_oui='%@',protection_objet='%@',balisage_zone_de_oui='%@',balisage_zone_de_objet='%@',mise_en_place_oui='%@',mise_en_place_objet='%@',port_des_epi_oui='%@',port_des_epi_objet='%@',connaissance_des_issues_oui='%@',connaissance_des_issues_objet='%@',val15_oui='%@',val15_object='%@',auto_oui='%@',autorisation_de_travail_nom='%@',autorisation_de_travail_signature='%@',val_intervenants_nom1='%@',val_intervenants_signature1='%@',val_intervenants_nom2='%@',val_intervenants_signature2='%@',doc_modified_date='%@' where risk_id='%ld'", str_DocumentName,self.nde_dossier.text, self.date_des_travaux.text, self.ndu_pdp.text, self.ndu_ppsp.text, self.ouvrage_concerne.text, self.libelle_des_travaux.text, self.nom.text, str_Sig1, tpb1,tpb2, tpb3, tpb4, tpb5, tpb6, tpb7, tpb8, tpb9, tpb10, tpb11,tpb12, tpb13, tpb14, tpb15, tpb16, tpb17, tpb18, tpb19, tpb20, tpb21, self.textv.text, self.textv1.text,b1,b2,b3,b4,b5,b6,b7,b8,self.view1tv1.text,b9,b10,b11,b12,b13, self.view2tv1.text, self.amont_la_tension.text, self.aval_la_tension.text,self.textv2.text,str_Sig5, b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35,b36,b37,b38,b39, b40, b41,b42,self.autorisation_de_travail_nom.text, str_Sig2, self.nom1_text.text, str_Sig3, self.nom2_text.text, str_Sig4,datestring12,(long)nnn];
        [[ DBSqlite dbManager] updateStatement:updateSQL];
        
    }
    else
    {
        if(saved_Into_DB==NO)
        {
        [self openPerPagePDF] ;
        NSString * str_GetCount = @"SELECT risk_id FROM risk_analysis" ;
        int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
        NSString *strQuery = [NSString stringWithFormat:@"insert into risk_analysis(risk_id,doc_name,nde_dossier,date_des_travaux,ndu_pdp,ndu_ppsp,ouvrage_concerne,libelle_des_travaux,nom,signature,ambiance_atmos,ambiance_lumi,conditions_clim,ambiance_sono,chimiques,chute_de_plain,chute_de_hau,chute_deob,routier_et_dep,danger_elect,amiante,musculo_sque,coupure_bleas,incendie,co_activite,machine_out,travail_iso,fluide,manuten_mecan,environmentaux,autres,autres_txt1,autres_txt2,amont _alimentation_edf,amont _presente,amont _consignee_avec_malt,amont _separee_sans_malt,amont _groupe_eletrogene,amont _onduleur,amont _batterie_de_cond,amont_autres_sources_auxiliaires,amont_auttv1,aval_consignee_avec_malt,aval_separee_sans_malt,aval_onduleur,aval_batterie_de_cond,aval_autres_src_auxiliaires,aval_auttv1,amont_la_tension,aval_la_tension,evol_tv1,Schema_signature,pdp_ou_ppsps,connaissance_de,attestation_oui,attestation_objet,connaissance_oui,connaissance_objet,pose_ht_oui,pose_ht_objet,pose_bt_oui,pose_bt_objet,vat_faite_oui,vat_faite_objet,malt_vaite_oui,malt_vaite_objet,balisage_oui,balisage_objet,protection_oui,protection_objet,balisage_zone_de_oui,balisage_zone_de_objet,mise_en_place_oui,mise_en_place_objet,port_des_epi_oui,port_des_epi_objet,connaissance_des_issues_oui,connaissance_des_issues_objet,val15_oui,val15_object,auto_oui,autorisation_de_travail_nom,autorisation_de_travail_signature,val_intervenants_nom1,val_intervenants_signature1,val_intervenants_nom2,val_intervenants_signature2,doc_created_date,doc_modified_date) values (\"%d\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\",  \"%@\",\"%@\",\"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\",\"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\",  \"%@\",\"%@\",\"%@\",\"%@\", \"%@\")" ,++CurrentCount,str_DocumentName,self.nde_dossier.text, self.date_des_travaux.text, self.ndu_pdp.text, self.ndu_ppsp.text, self.ouvrage_concerne.text, self.libelle_des_travaux.text, self.nom.text, str_Sig1, tpb1,tpb2, tpb3, tpb4, tpb5, tpb6, tpb7, tpb8, tpb9, tpb10, tpb11,tpb12, tpb13, tpb14, tpb15, tpb16, tpb17, tpb18, tpb19, tpb20, tpb21, self.textv.text, self.textv1.text,b1,b2,b3,b4,b5,b6,b7,b8,self.view1tv1.text,b9,b10,b11,b12,b13, self.view2tv1.text, self.amont_la_tension.text, self.aval_la_tension.text,self.textv2.text,str_Sig5, b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35,b36,b37,b38,b39, b40, b41,b42,self.autorisation_de_travail_nom.text, str_Sig2, self.nom1_text.text, str_Sig3, self.nom2_text.text, str_Sig4, str_CreatedDate, str_CreatedDate];
            [[DBSqlite dbManager]insertStatement:strQuery];
            self.IsForUpdating=YES;
            saved_Into_DB=YES;
        }
        else if(saved_Into_DB==YES)
        {
            NSString * str_GetCount = @"SELECT risk_id FROM risk_analysis" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSString *updateSQL = [NSString stringWithFormat:
                                   @"update risk_analysis set doc_name='%@',nde_dossier='%@',date_des_travaux='%@',ndu_pdp='%@',ndu_ppsp='%@',ouvrage_concerne='%@',libelle_des_travaux='%@',nom='%@',signature='%@',ambiance_atmos='%@',ambiance_lumi='%@',conditions_clim='%@',ambiance_sono='%@',chimiques='%@',chute_de_plain='%@',chute_de_hau='%@',chute_deob='%@',routier_et_dep='%@',danger_elect='%@',amiante='%@',musculo_sque='%@',coupure_bleas='%@',incendie='%@',co_activite='%@',machine_out='%@',travail_iso='%@',fluide='%@',manuten_mecan='%@',environmentaux='%@',autres='%@',autres_txt1='%@',autres_txt2='%@',amont _alimentation_edf='%@',amont _presente='%@',amont _consignee_avec_malt='%@',amont _separee_sans_malt='%@',amont _groupe_eletrogene='%@',amont _onduleur='%@',amont _batterie_de_cond='%@',amont_autres_sources_auxiliaires='%@',amont_auttv1='%@',aval_consignee_avec_malt='%@',aval_separee_sans_malt='%@',aval_onduleur='%@',aval_batterie_de_cond='%@',aval_autres_src_auxiliaires='%@',aval_auttv1='%@',amont_la_tension='%@',aval_la_tension='%@',evol_tv1='%@',Schema_signature='%@',pdp_ou_ppsps='%@',connaissance_de='%@',attestation_oui='%@',attestation_objet='%@',connaissance_oui='%@',connaissance_objet='%@',pose_ht_oui='%@',pose_ht_objet='%@',pose_bt_oui='%@',pose_bt_objet='%@',vat_faite_oui='%@',vat_faite_objet='%@',malt_vaite_oui='%@',malt_vaite_objet='%@',balisage_oui='%@',balisage_objet='%@',protection_oui='%@',protection_objet='%@',balisage_zone_de_oui='%@',balisage_zone_de_objet='%@',mise_en_place_oui='%@',mise_en_place_objet='%@',port_des_epi_oui='%@',port_des_epi_objet='%@',connaissance_des_issues_oui='%@',connaissance_des_issues_objet='%@',val15_oui='%@',val15_object='%@',auto_oui='%@',autorisation_de_travail_nom='%@',autorisation_de_travail_signature='%@',val_intervenants_nom1='%@',val_intervenants_signature1='%@',val_intervenants_nom2='%@',val_intervenants_signature2='%@',doc_modified_date='%@' where risk_id='%d'", str_DocumentName,self.nde_dossier.text, self.date_des_travaux.text, self.ndu_pdp.text, self.ndu_ppsp.text, self.ouvrage_concerne.text, self.libelle_des_travaux.text, self.nom.text, str_Sig1, tpb1,tpb2, tpb3, tpb4, tpb5, tpb6, tpb7, tpb8, tpb9, tpb10, tpb11,tpb12, tpb13, tpb14, tpb15, tpb16, tpb17, tpb18, tpb19, tpb20, tpb21, self.textv.text, self.textv1.text,b1,b2,b3,b4,b5,b6,b7,b8,self.view1tv1.text,b9,b10,b11,b12,b13, self.view2tv1.text, self.amont_la_tension.text, self.aval_la_tension.text,self.textv2.text,str_Sig5, b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33,b34,b35,b36,b37,b38,b39, b40, b41,b42,self.autorisation_de_travail_nom.text, str_Sig2, self.nom1_text.text, str_Sig3, self.nom2_text.text, str_Sig4,datestring12,CurrentCount];
            [[ DBSqlite dbManager] updateStatement:updateSQL];
        }
    }
    if (currentBarButton == pdfButton)
    {
        [ self showEmail] ;
    }
}

- (NSString *)encodeToBase64String:(UIImage *)currentimage
{
    return [UIImageJPEGRepresentation(currentimage, 1) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (void)openPerPagePDF
{
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:self.scrollview];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    NSLog(@"Now : %@", now) ;
    //[format setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    [ format setDateFormat:@"dd-MM-YYYY_hhmmss"] ;
    NSString * datestring1 = [format stringFromDate:now];
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    //   Formname_DDMMYYYYhhmmss
    str_DocumentName = [NSString stringWithFormat:@"DAR Analyse des  Risques_%@.pdf", datestring1]  ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
    [pdfData writeToFile:path atomically:NO];
    NSLog(@"tmpDirectory: %@",path);
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
    NSString *recipients  =  @"mailto:example@gmail.com?cc = &subject = Digitram Email\n\n";
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
-(void)border3checkbox325Action
{
    border3checkbox325.selected=!border3checkbox325.selected;
    if (border3checkbox325.selected)
    {
        [border3checkbox325 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox325 setImage:image1 forState:UIControlStateNormal];
    }
}
-(void)border3checkbox324Action
{
    border3checkbox324.selected=!border3checkbox324.selected;
    if (border3checkbox324.selected)
    {
        [border3checkbox324 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox324 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox323Action
{
    border3checkbox323.selected=!border3checkbox323.selected;
    if (border3checkbox323.selected)
    {
        [border3checkbox323 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox323 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox321Action
{
    border3checkbox321.selected=!border3checkbox321.selected;
    if (border3checkbox321.selected)
    {
        [border3checkbox321 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox321 setImage:image1 forState:UIControlStateNormal];
    }
}
-(void)border3checkbox322Action
{
    border3checkbox322.selected=!border3checkbox322.selected;
    if (border3checkbox322.selected)
    {
        [border3checkbox322 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox322 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox31Action
{
    if (border3checkbox31.currentBackgroundImage==nil)
    {
        [border3checkbox31 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
    }
    else if(border3checkbox31.currentBackgroundImage!=nil)
    {
        [border3checkbox31 setBackgroundImage:nil forState:UIControlStateNormal];
    }
}

-(void)border3checkbox32Action
{
    border3checkbox32.selected=!border3checkbox32.selected;
    if (border3checkbox32.selected)
    {
        [border3checkbox32 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox32 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox33Action
{
    border3checkbox33.selected=!border3checkbox33.selected;
    if (border3checkbox33.selected)
    {
        [border3checkbox33 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox33 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox34Action
{
    border3checkbox34.selected=!border3checkbox34.selected;
    if (border3checkbox34.selected)
    {
        [border3checkbox34 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox34 setImage:image1 forState:UIControlStateNormal];
    }
}
-(void)border3checkbox35Action
{
    border3checkbox35.selected=!border3checkbox35.selected;
    if (border3checkbox35.selected)
    {
        [border3checkbox35 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox35 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox28Action
{
    border3checkbox28.selected=!border3checkbox28.selected;
    if (border3checkbox28.selected)
    {
        [border3checkbox28 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox28 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox27Action
{
    border3checkbox27.selected=!border3checkbox27.selected;
    if (border3checkbox27.selected)
    {
        [border3checkbox27 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox27 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox26Action
{
    border3checkbox26.selected=!border3checkbox26.selected;
    if (border3checkbox26.selected)
    {
        [border3checkbox26 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox26 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox25Action
{
    border3checkbox25.selected=!border3checkbox25.selected;
    if (border3checkbox25.selected)
    {
        [border3checkbox25 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox25 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox24Action
{
    border3checkbox24.selected=!border3checkbox24.selected;
    if (border3checkbox24.selected)
    {
        [border3checkbox24 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox24 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox23Action
{
    border3checkbox23.selected=!border3checkbox23.selected;
    if (border3checkbox23.selected)
    {
        [border3checkbox23 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox23 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox22Action
{
    border3checkbox22.selected=!border3checkbox22.selected;
    if (border3checkbox22.selected)
    {
        [border3checkbox22 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox22 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox21Action
{
    border3checkbox21.selected=!border3checkbox21.selected;
    if (border3checkbox21.selected)
    {
        [border3checkbox21 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox21 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox18Action
{
    border3checkbox18.selected=!border3checkbox18.selected;
    if (border3checkbox18.selected)
    {
        [border3checkbox18 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox18 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox17Action
{
    border3checkbox17.selected=!border3checkbox17.selected;
    if (border3checkbox17.selected)
    {
        [border3checkbox17 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox17 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox16Action
{
    border3checkbox16.selected=!border3checkbox16.selected;
    if (border3checkbox16.selected)
    {
        [border3checkbox16 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox16 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox15Action
{
    border3checkbox15.selected=!border3checkbox15.selected;
    if (border3checkbox15.selected)
    {
        [border3checkbox15 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox15 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox14Action
{
    border3checkbox14.selected=!border3checkbox14.selected;
    if (border3checkbox14.selected)
    {
        [border3checkbox14 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox14 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox13Action
{
    border3checkbox13.selected=!border3checkbox13.selected;
    if (border3checkbox13.selected)
    {
        [border3checkbox13 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox13 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox12Action
{
    border3checkbox12.selected=!border3checkbox12.selected;
    if (border3checkbox12.selected)
    {
        [border3checkbox12 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox12 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox11Action
{
    border3checkbox11.selected=!border3checkbox11.selected;
    if (border3checkbox11.selected)
    {
        [border3checkbox11 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox11 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox1Action
{
    border3checkbox1.selected=!border3checkbox1.selected;
    if (border3checkbox1.selected)
    {
        [border3checkbox1 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox1 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)border3checkbox2Action
{
    border3checkbox2.selected=!border3checkbox2.selected;
    if (border3checkbox2.selected)
    {
        [border3checkbox2 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [border3checkbox2 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view2checkbox1Action
{
    view2checkbox1.selected=!view2checkbox1.selected;
    if (view2checkbox1.selected)
    {
        [view2checkbox1 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view2checkbox1 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view2checkbox2Action
{
    view2checkbox2.selected=!view2checkbox2.selected;
    if (view2checkbox2.selected)
    {
        [view2checkbox2 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view2checkbox2 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view2checkbox3Action
{
    view2checkbox3.selected=!view2checkbox3.selected;
    if (view2checkbox3.selected)
    {
        [view2checkbox3 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view2checkbox3 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view2checkbox4Action
{
    view2checkbox4.selected=!view2checkbox4.selected;
    if (view2checkbox4.selected)
    {
        [view2checkbox4 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view2checkbox4 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view2checkbox5Action
{
    view2checkbox5.selected=!view2checkbox5.selected;
    if (view2checkbox5.selected)
    {
        [view2checkbox5 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view2checkbox5 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view1checkbox5Action
{
    view1checkbox5.selected=!view1checkbox5.selected;
    if (view1checkbox5.selected)
    {
        [view1checkbox5 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view1checkbox5 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view1checkbox6Action
{
    view1checkbox6.selected=!view1checkbox6.selected;
    if (view1checkbox6.selected)
    {
        [view1checkbox6 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view1checkbox6 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view1checkbox7Action
{
    view1checkbox7.selected=!view1checkbox7.selected;
    if (view1checkbox7.selected)
    {
        [view1checkbox7 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view1checkbox7 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view1checkbox3Action
{
    view1checkbox3.selected=!view1checkbox3.selected;
    if (view1checkbox3.selected)
    {
        [view1checkbox3 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view1checkbox3 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view1checkbox8Action
{
    view1checkbox8.selected=!view1checkbox8.selected;
    if (view1checkbox8.selected)
    {
        [view1checkbox8 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view1checkbox8 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view1checkbox4Action
{
    view1checkbox4.selected=!view1checkbox4.selected;
    if (view1checkbox4.selected)
    {
        [view1checkbox4 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view1checkbox4 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view1checkbox2Action
{
    view1checkbox2.selected=!view1checkbox2.selected;
    if (view1checkbox2.selected)
    {
        [view1checkbox2 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view1checkbox2 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)view1checkbox1Action
{
    view1checkbox1.selected=!view1checkbox1.selected;
    if (view1checkbox1.selected)
    {
        [view1checkbox1 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [view1checkbox1 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)Checkboxes21Action
{
    checkboxes21.selected=!checkboxes21.selected;
    if (checkboxes21.selected)
    {
        [checkboxes21 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkboxes21 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)Checkboxes20Action
{
    checkboxes20.selected=!checkboxes20.selected;
    if (checkboxes20.selected)
    {
        [checkboxes20 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkboxes20 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)Checkboxes19Action
{
    checkboxes19.selected=!checkboxes19.selected;
    if (checkboxes19.selected)
    {
        [checkboxes19 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkboxes19 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)Checkboxes18Action
{
    checkboxes18.selected=!checkboxes18.selected;
    if (checkboxes18.selected)
    {
        [checkboxes18 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkboxes18 setImage:image1 forState:UIControlStateNormal];
    }
}

-(void)Checkboxes17Action
{
    checkboxes17.selected=!checkboxes17.selected;
    if (checkboxes17.selected)
    {
        [checkboxes17 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkboxes17 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox1:(id)sender
{
    checkbox1.selected=!checkbox1.selected;
    if (checkbox1.selected)
    {
        [checkbox1 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox1 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox2:(id)sender
{
    checkbox2.selected=!checkbox2.selected;
    if (checkbox2.selected)
    {
        [checkbox2 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox2 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox3:(id)sender
{
    checkbox3.selected=!checkbox3.selected;
    if (checkbox3.selected)
    {
        [checkbox3 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox3 setImage:image1 forState:UIControlStateNormal];
    }
}
- (IBAction)checkbox4:(id)sender
{
    checkbox4.selected=!checkbox4.selected;
    if (checkbox4.selected)
    {
        [checkbox4 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox4 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox5:(id)sender
{
    checkbox5.selected=!checkbox5.selected;
    if (checkbox5.selected)
    {
        [checkbox5 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox5 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox6:(id)sender
{
    checkbox6.selected=!checkbox6.selected;
    if (checkbox6.selected)
    {
        [checkbox6 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox6 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox7:(id)sender
{
    checkbox7.selected=!checkbox7.selected;
    if (checkbox7.selected)
    {
        [checkbox7 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox7 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox8:(id)sender
{
    checkbox8.selected=!checkbox8.selected;
    if (checkbox8.selected)
    {
        [checkbox8 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox8 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox9:(id)sender
{
    checkbox9.selected=!checkbox9.selected;
    if (checkbox9.selected)
    {
        [checkbox9 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox9 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox10:(id)sender
{
    checkbox10.selected=!checkbox10.selected;
    if (checkbox10.selected)
    {
        [checkbox10 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox10 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox11:(id)sender
{
    checkbox11.selected=!checkbox11.selected;
    if (checkbox11.selected)
    {
        [checkbox11 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox11 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox12:(id)sender
{
    checkbox12.selected=!checkbox12.selected;
    if (checkbox12.selected)
    {
        [checkbox12 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox12 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox13:(id)sender
{
    checkbox13.selected=!checkbox13.selected;
    if (checkbox13.selected)
    {
        [checkbox13 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox13 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox14:(id)sender
{
    checkbox14.selected=!checkbox14.selected;
    if (checkbox14.selected)
    {
        [checkbox14 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox14 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox15:(id)sender
{
    checkbox15.selected=!checkbox15.selected;
    if (checkbox15.selected)
    {
        
        [checkbox15 setImage:image2 forState:UIControlStateNormal];
        
    }
    else
    {
        [checkbox15 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox16:(id)sender
{
    checkbox16.selected=!checkbox16.selected;
    if (checkbox16.selected)
    {
        [checkbox16 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox16 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox17:(id)sender
{
    checkbox17.selected=!checkbox17.selected;
    if (checkbox17.selected)
    {
        [checkbox17 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox17 setImage:image1 forState:UIControlStateNormal];
    }
}

- (IBAction)checkbox18:(id)sender
{
    checkbox18.selected=!checkbox17.selected;
    if (checkbox18.selected)
    {
        [checkbox18 setImage:image2 forState:UIControlStateNormal];
    }
    else
    {
        [checkbox18 setImage:image1 forState:UIControlStateNormal];
    }
}

-(IBAction)editbutclicked:(UIButton *)sender
{
    [self.view endEditing:YES];
    switch (sender.tag)
    {
        case 9997:
            img_CurrentImage = self.signature1;
            break;
        case 9998 :
            img_CurrentImage = self.sig1 ;
            break ;
        case 9999:
            img_CurrentImage = self.sig2 ;
            break ;
        case 400:
        {
            NSLog(@"Enterefd") ;
            img_CurrentImage = (UIImageView *)[self.view viewWithTag:501];
            NSLog(@"%@", img_CurrentImage) ;
            break ;
        }
        default:
            break ;
    }
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
    svc.delegate=self;
    [self.navigationController pushViewController:svc animated:NO];
}

#pragma mark Signature delegate

-(void)sendImgData:(UIImage *)image;
{
    NSLog(@"Inage : %@", image) ;
    UIImageView *imageView;
    imageView = img_CurrentImage ;
    imageView.image=image;
}

-(void)showDatePicker
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.date_des_travaux setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.date_des_travaux.frame inView:self.firstrowsecd permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.date_des_travaux.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.date_des_travaux.text = [NSString stringWithFormat:@"%@",dateString];
}

#pragma mark For Schema

-(IBAction)scheditbutclicked:(id)sender;
{
    [self.view endEditing:YES];
    UIButton *btn=(UIButton *)sender;
    if (btn.tag==8888)
    {
        sig2clicked=YES;
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SchemaVC *shvc=[sb instantiateViewControllerWithIdentifier:@"schema"];
        shvc.delegate=self;
        [self.navigationController pushViewController:shvc animated:NO];
    }
}

-(void)sendschImgData:(UIImage *)images;
{
    UIImageView *imageView;
    if(sig2clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:502];
        sig2clicked=NO;
    }
    else
    {
        
    }
    imageView.image=images;
}
// Bala included this code
#pragma mark ScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}
@end
