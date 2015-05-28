
#import "BeginFormVC.h"
#import <QuartzCore/QuartzCore.h>
#import "ScrollViewToPDF.h"
#import "CauzQSSE_ViewController.h"
#import <MessageUI/MessageUI.h>

@interface BeginFormVC ()<MFMailComposeViewControllerDelegate, SignaVCDelegate, UIAlertViewDelegate>

@end

@implementation BeginFormVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    str_DocumentName = @"QE7220TR PPS Emargement accueil chantier" ;
    self.title = str_DocumentName ;

    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // Created and modified date as of now
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;

    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    
    [scrollView setContentSize:(CGSizeMake(768,1200))];
    saved_Into_DB=NO;
    
    [self.view1.layer setBorderWidth:1.0];
    self.view1.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view2.layer setBorderWidth:1.0];
    self.view2.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view3.layer setBorderWidth:1.0];
    self.view3.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view4.layer setBorderWidth:1.0];
    self.view4.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view5.layer setBorderWidth:1.0];
    self.view5.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.imgView1.layer setBorderWidth:1.0];
    [self.imgView2.layer setBorderWidth:1.0];
    [self.imgView3.layer setBorderWidth:1.0];
    [self.imgView4.layer setBorderWidth:1.0];
    [self.imgView5.layer setBorderWidth:1.0];
    [self.imgView6.layer setBorderWidth:1.0];
    [self.imgView7.layer setBorderWidth:1.0];
    
    [self.view6.layer setBorderWidth:1.0];
    self.view6.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view7.layer setBorderWidth:1.0];
    self.view7.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view8.layer setBorderWidth:1.0];
    self.view8.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view9.layer setBorderWidth:1.0];
    self.view9.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view10.layer setBorderWidth:1.0];
    self.view10.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view11.layer setBorderWidth:1.0];
    self.view11.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view12.layer setBorderWidth:1.0];
    self.view12.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view13.layer setBorderWidth:1.0];
    self.view13.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view14.layer setBorderWidth:1.0];
    self.view14.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view15.layer setBorderWidth:1.0];
    self.view15.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view16.layer setBorderWidth:1.0];
    self.view16.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view17.layer setBorderWidth:1.0];
    self.view17.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view18.layer setBorderWidth:1.0];
    self.view18.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view19.layer setBorderWidth:1.0];
    self.view19.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view20.layer setBorderWidth:1.0];
    self.view20.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view21.layer setBorderWidth:1.0];
    self.view22.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view22.layer setBorderWidth:1.0];
    self.view22.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view23.layer setBorderWidth:1.0];
    self.view23.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view24.layer setBorderWidth:1.0];
    self.view24.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view25.layer setBorderWidth:1.0];
    self.view25.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view26.layer setBorderWidth:1.0];
    self.view26.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view27.layer setBorderWidth:1.0];
    self.view27.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view28.layer setBorderWidth:1.0];
    self.view28.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view29.layer setBorderWidth:1.0];
    self.view29.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view30.layer setBorderWidth:1.0];
    self.view30.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view31.layer setBorderWidth:1.0];
    self.view32.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view32.layer setBorderWidth:1.0];
    self.view32.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view33.layer setBorderWidth:1.0];
    self.view33.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view34.layer setBorderWidth:1.0];
    self.view34.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view35.layer setBorderWidth:1.0];
    self.view35.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view36.layer setBorderWidth:1.0];
    self.view36.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view37.layer setBorderWidth:1.0];
    self.view37.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view38.layer setBorderWidth:1.0];
    self.view38.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view39.layer setBorderWidth:1.0];
    self.view39.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view40.layer setBorderWidth:1.0];
    self.view40.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view41.layer setBorderWidth:1.0];
    self.view42.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view42.layer setBorderWidth:1.0];
    self.view42.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view43.layer setBorderWidth:1.0];
    self.view43.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view44.layer setBorderWidth:1.0];
    self.view44.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view45.layer setBorderWidth:1.0];
    self.view45.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view46.layer setBorderWidth:1.0];
    self.view46.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view47.layer setBorderWidth:1.0];
    self.view47.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view48.layer setBorderWidth:1.0];
    self.view48.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view49.layer setBorderWidth:1.0];
    self.view49.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view50.layer setBorderWidth:1.0];
    self.view50.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view51.layer setBorderWidth:1.0];
    self.view52.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view52.layer setBorderWidth:1.0];
    self.view52.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view53.layer setBorderWidth:1.0];
    self.view53.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view54.layer setBorderWidth:1.0];
    self.view54.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view55.layer setBorderWidth:1.0];
    self.view55.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view56.layer setBorderWidth:1.0];
    self.view56.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view57.layer setBorderWidth:1.0];
    self.view57.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view58.layer setBorderWidth:1.0];
    self.view58.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view59.layer setBorderWidth:1.0];
    self.view59.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view60.layer setBorderWidth:1.0];
    self.view60.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view61.layer setBorderWidth:1.0];
    self.view61.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view62.layer setBorderWidth:1.0];
    self.view62.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view63.layer setBorderWidth:1.0];
    self.view63.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view64.layer setBorderWidth:1.0];
    self.view64.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view65.layer setBorderWidth:1.0];
    self.view65.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view66.layer setBorderWidth:1.0];
    self.view66.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view67.layer setBorderWidth:1.0];
    self.view67.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view68.layer setBorderWidth:1.0];
    self.view68.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view69.layer setBorderWidth:1.0];
    self.view69.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.view70.layer setBorderWidth:1.0];
    self.view70.layer.borderColor=[[UIColor blackColor]CGColor];
    
    if (self.IsForUpdating==YES)
    {
        // ******************* For Signature
        
        NSString *datas1=(self.retrievedarray)[0][@"et_sign1"];
        NSData *data1=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image=[[UIImage alloc]init];
        image=[UIImage imageWithData:data1];
        [self.imgSign1 setImage:image];
        
        NSString *datas2=(self.retrievedarray)[0][@"et_sign2"];
        NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image1=[[UIImage alloc]init];
        image1=[UIImage imageWithData:data2];
        [self.imgSign2 setImage:image1];
        
        NSString *datas3=(self.retrievedarray)[0][@"et_sign3"];
        NSData *data3=[[NSData alloc]initWithBase64EncodedData:datas3 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image3=[[UIImage alloc]init];
        image3=[UIImage imageWithData:data3];
        [self.imgSign3 setImage:image3];
        
        NSString *datas4=(self.retrievedarray)[0][@"et_sign4"];
        NSData *data4=[[NSData alloc]initWithBase64EncodedData:datas4 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image4=[[UIImage alloc]init];
        image4=[UIImage imageWithData:data4];
        [self.imgSign4 setImage:image4];
        
        NSString *datas5=(self.retrievedarray)[0][@"et_sign5"];
        NSData *data5=[[NSData alloc]initWithBase64EncodedData:datas5 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image5=[[UIImage alloc]init];
        image5=[UIImage imageWithData:data5];
        [self.imgSign5 setImage:image5];
        
        NSString *datas6=(self.retrievedarray)[0][@"et_sign6"];
        NSData *data6=[[NSData alloc]initWithBase64EncodedData:datas6 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image6=[[UIImage alloc]init];
        image6=[UIImage imageWithData:data6];
        [self.imgSign6 setImage:image6];
        
        NSString *datas7=(self.retrievedarray)[0][@"et_sign7"];
        NSData *data7=[[NSData alloc]initWithBase64EncodedData:datas7 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image7=[[UIImage alloc]init];
        image7=[UIImage imageWithData:data7];
        [self.imgSign7 setImage:image7];
        
       //************** For Text
        
        self.site.text=(self.retrievedarray)[0][@"site"];
        self.societe.text=(self.retrievedarray)[0][@"societe"];
        self.adresse1.text=(self.retrievedarray)[0][@"adresse1"];
        self.adresse2.text=(self.retrievedarray)[0][@"adresse2"];
        self.cp.text=(self.retrievedarray)[0][@"cp"];
        self.ville.text=(self.retrievedarray)[0][@"ville"];
        
        self.nom1.text=(self.retrievedarray)[0][@"nom1"];
        self.nom2.text=(self.retrievedarray)[0][@"nom2"];
        self.nom3.text=(self.retrievedarray)[0][@"nom3"];
        self.nom4.text=(self.retrievedarray)[0][@"nom4"];
        self.nom5.text=(self.retrievedarray)[0][@"nom5"];
        self.nom6.text=(self.retrievedarray)[0][@"nom6"];
        self.nom7.text=(self.retrievedarray)[0][@"nom7"];
        
        self.habilitation1.text=(self.retrievedarray)[0][@"habilitation1"];
        self.habilitation2.text=(self.retrievedarray)[0][@"habilitation2"];
        self.habilitation3.text=(self.retrievedarray)[0][@"habilitation3"];
        self.habilitation4.text=(self.retrievedarray)[0][@"habilitation4"];
        self.habilitation5.text=(self.retrievedarray)[0][@"habilitation5"];
        self.habilitation6.text=(self.retrievedarray)[0][@"habilitation6"];
        self.habilitation7.text=(self.retrievedarray)[0][@"habilitation7"];
        
        self.gies1.text=(self.retrievedarray)[0][@"gies1"];
        self.gies2.text=(self.retrievedarray)[0][@"gies2"];
        self.gies3.text=(self.retrievedarray)[0][@"gies3"];
        self.gies4.text=(self.retrievedarray)[0][@"gies4"];
        self.gies5.text=(self.retrievedarray)[0][@"gies5"];
        self.gies6.text=(self.retrievedarray)[0][@"gies6"];
        self.gies7.text=(self.retrievedarray)[0][@"gies7"];
        
        self.risque_chimique1.text=(self.retrievedarray)[0][@"risque_chimique1"];
        self.risque_chimique2.text=(self.retrievedarray)[0][@"risque_chimique2"];
        self.risque_chimique3.text=(self.retrievedarray)[0][@"risque_chimique3"];
        self.risque_chimique4.text=(self.retrievedarray)[0][@"risque_chimique4"];
        self.risque_chimique5.text=(self.retrievedarray)[0][@"risque_chimique5"];
        self.risque_chimique6.text=(self.retrievedarray)[0][@"risque_chimique6"];
        self.risque_chimique7.text=(self.retrievedarray)[0][@"risque_chimique7"];
        
        self.atex1.text=(self.retrievedarray)[0][@"atex1"];
        self.atex2.text=(self.retrievedarray)[0][@"atex2"];
        self.atex3.text=(self.retrievedarray)[0][@"atex3"];
        self.atex4.text=(self.retrievedarray)[0][@"atex4"];
        self.atex5.text=(self.retrievedarray)[0][@"atex5"];
        self.atex6.text=(self.retrievedarray)[0][@"atex6"];
        self.atex7.text=(self.retrievedarray)[0][@"atex7"];
        
        self.restriction1.text=(self.retrievedarray)[0][@"restriction1"];
        self.restriction2.text=(self.retrievedarray)[0][@"restriction2"];
        self.restriction3.text=(self.retrievedarray)[0][@"restriction3"];
        self.restriction4.text=(self.retrievedarray)[0][@"restriction4"];
        self.restriction5.text=(self.retrievedarray)[0][@"restriction5"];
        self.restriction6.text=(self.retrievedarray)[0][@"restriction6"];
        self.restriction7.text=(self.retrievedarray)[0][@"restriction7"];
        
        self.autes1.text=(self.retrievedarray)[0][@"autes1"];
        self.autes2.text=(self.retrievedarray)[0][@"autes2"];
        self.autes3.text=(self.retrievedarray)[0][@"autes3"];
        self.autes4.text=(self.retrievedarray)[0][@"autes4"];
        self.autes5.text=(self.retrievedarray)[0][@"autes5"];
        self.autes6.text=(self.retrievedarray)[0][@"autes6"];
        self.autes7.text=(self.retrievedarray)[0][@"autes7"];
        
        self.destf1.text=(self.retrievedarray)[0][@"date1"];
        self.destf2.text=(self.retrievedarray)[0][@"date2"];
        self.destf3.text=(self.retrievedarray)[0][@"date3"];
        self.destf4.text=(self.retrievedarray)[0][@"date4"];
        self.destf5.text=(self.retrievedarray)[0][@"date5"];
        self.destf6.text=(self.retrievedarray)[0][@"date6"];
        self.destf7.text=(self.retrievedarray)[0][@"date7"];
    }
    
    self.nom5.delegate=self;
    self.habilitation5.delegate=self;
    self.gies5.delegate=self;
    self.risque_chimique5.delegate=self;
    self.atex5.delegate=self;
    self.restriction5.delegate=self;
    self.autes5.delegate=self;
    self.date_et_sign5.delegate=self;
    
    self.nom6.delegate=self;
    self.habilitation6.delegate=self;
    self.gies6.delegate=self;
    self.risque_chimique6.delegate=self;
    self.atex6.delegate=self;
    self.restriction6.delegate=self;
    self.autes6.delegate=self;
    self.date_et_sign6.delegate=self;
    
    self.nom7.delegate=self;
    self.habilitation7.delegate=self;
    self.gies7.delegate=self;
    self.risque_chimique7.delegate=self;
    self.atex7.delegate=self;
    self.restriction7.delegate=self;
    self.autes7.delegate=self;
    self.date_et_sign7.delegate=self;
}

-(IBAction)editbutclicked:(id)sender
{
    UIButton *butt=(UIButton *)sender;
    if (butt.tag==400)
    {
        sig1clicked=YES;
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
    }
    else if(butt.tag==401)
    {
        sig2clicked=YES;
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
    }
    else if(butt.tag==402)
    {
        sig3clicked=YES;
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
    }
    else if(butt.tag==403)
    {
        sig4clicked=YES;
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
    }
    else if(butt.tag==404)
    {
        sig5clicked=YES;
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
    }
    else if(butt.tag==405)
    {
        sig6clicked=YES;
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
    }
    else if(butt.tag==406)
    {
        sig7clicked=YES;
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    //BarButton
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(saveToDataBase:)] ;
    self.navigationItem.rightBarButtonItem = pdfButton ;
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,saveButton, nil];
    self.navigationItem.rightBarButtonItems = arry ;
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
    NSString * str_Image1 = [ self encodeToBase64String:self.imgSign1.image];
    NSString * str_Image2 = [ self encodeToBase64String:self.imgSign2.image];
    NSString * str_Image3 = [ self encodeToBase64String:self.imgSign3.image];
    NSString * str_Image4 = [ self encodeToBase64String:self.imgSign4.image];
    NSString * str_Image5 = [ self encodeToBase64String:self.imgSign5.image];
    NSString * str_Image6 = [ self encodeToBase64String:self.imgSign6.image];
    NSString * str_Image7 = [ self encodeToBase64String:self.imgSign7.image];
    NSDateFormatter *forma=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [forma setDateFormat:@"dd-MM-YYYY"] ;
    NSString *datestring12 = [forma stringFromDate:now];
    if (self.IsForUpdating==YES )
    {
        if (self.retrievedarray!=nil)
        {
            NSLog(@"retrive:%@",self.retrievedarray);
            NSLog(@"retrive:%@",(self.retrievedarray)[0][@"attestation_id"]);
            NSString *str=(self.retrievedarray)[0][@"attestation_id"];
            nnn=[str intValue];
        }
        else
        {
            NSString * str_GetCount = @"SELECT attestation_id FROM attestation" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            nnn =  CurrentCount;
        }
            [self openPerPagePDF] ;
            NSString *updateSQL = [NSString stringWithFormat:
                               @"update attestation set site = '%@', societe = '%@', adresse1='%@', adresse2='%@', cp='%@', ville='%@', nom1='%@', nom2='%@', nom3='%@', nom4='%@', nom5='%@', nom6='%@', nom7='%@', habilitation1='%@', habilitation2='%@', habilitation3='%@', habilitation4='%@', habilitation5='%@', habilitation6='%@', habilitation7='%@', gies1='%@', gies2='%@', gies3='%@', gies4='%@', gies5='%@', gies6='%@', gies7='%@', risque_chimique1='%@', risque_chimique2='%@', risque_chimique3='%@', risque_chimique4='%@', risque_chimique5='%@', risque_chimique6='%@', risque_chimique7='%@', atex1='%@', atex2='%@', atex3='%@', atex4='%@', atex5='%@', atex6='%@', atex7='%@', restriction1='%@', restriction2='%@', restriction3='%@', restriction4='%@', restriction5='%@', restriction6='%@', restriction7='%@', autes1='%@', autes2='%@', autes3='%@', autes4='%@', autes5='%@', autes6='%@', autes7='%@',date1='%@', et_sign1='%@', date2='%@', et_sign2='%@', date3='%@', et_sign3='%@', date4='%@', et_sign4='%@', date5='%@', et_sign5='%@', date6='%@', et_sign6='%@', date7='%@', et_sign7='%@', doc_modified_date='%@', doc_name='%@' where attestation_id='%ld'", self.site.text, self.societe.text, self.adresse1.text, self.adresse2.text, self.cp.text, self.ville.text, self.nom1.text, self.nom2.text, self.nom3.text, self.nom4.text, self.nom5.text, self.nom6.text, self.nom7.text, self.habilitation1.text,self.habilitation2.text, self.habilitation3.text, self.habilitation4.text, self.habilitation5.text, self.habilitation6.text, self.habilitation7.text, self.gies1.text, self.gies2.text, self.gies3.text, self.gies4.text, self.gies5.text, self.gies6.text, self.gies7.text, self.risque_chimique1.text, self.risque_chimique2.text, self.risque_chimique3.text, self.risque_chimique4.text, self.risque_chimique5.text, self.risque_chimique6.text, self.risque_chimique7.text, self.atex1.text, self.atex2.text, self.atex3.text, self.atex4.text, self.atex5.text, self.atex6.text, self.atex7.text, self.restriction1.text, self.restriction2.text, self.restriction3.text, self.restriction4.text, self.restriction5.text, self.restriction6.text, self.restriction7.text, self.autes1.text, self.autes2.text, self.autes3.text, self.autes4.text, self.autes5.text, self.autes6.text, self.autes7.text,self.destf1.text, str_Image1, self.destf2.text, str_Image2 ,self.destf3.text, str_Image3,self.destf4.text, str_Image4,self.destf5.text, str_Image5,self.destf6.text, str_Image6,self.destf7.text, str_Image7,datestring12,str_DocumentName, (long)nnn];
            [[ DBSqlite dbManager] updateStatement:updateSQL];
        }
    else
    {
        if (saved_Into_DB==NO)
        {
            [self openPerPagePDF];
            NSString * str_GetCount = @"SELECT attestation_id FROM attestation";
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount];
            NSString *strQuery = [NSString stringWithFormat:@"insert into attestation(doc_name,attestation_id,site,societe,adresse1,adresse2,cp,ville,nom1,nom2,nom3,nom4,nom5,nom6,nom7,habilitation1,habilitation2,habilitation3,habilitation4,habilitation5,habilitation6,habilitation7,gies1,gies2,gies3,gies4,gies5,gies6,gies7,risque_chimique1,risque_chimique2,risque_chimique3,risque_chimique4,risque_chimique5,risque_chimique6,risque_chimique7,atex1,atex2,atex3,atex4,atex5,atex6,atex7,restriction1,restriction2,restriction3,restriction4,restriction5,restriction6,restriction7,autes1,autes2,autes3,autes4,autes5,autes6,autes7,date1,et_sign1,date2,et_sign2,date3,et_sign3,date4,et_sign4,date5,et_sign5,date6,et_sign6,date7,et_sign7,doc_created_date,doc_modified_date) values (\"%@\",\"%d\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",str_DocumentName,++CurrentCount,self.site.text, self.societe.text, self.adresse1.text, self.adresse2.text, self.cp.text, self.ville.text, self.nom1.text, self.nom2.text, self.nom3.text, self.nom4.text, self.nom5.text, self.nom6.text, self.nom7.text, self.habilitation1.text,self.habilitation2.text, self.habilitation3.text, self.habilitation4.text, self.habilitation5.text, self.habilitation6.text, self.habilitation7.text, self.gies1.text, self.gies2.text, self.gies3.text, self.gies4.text, self.gies5.text, self.gies6.text, self.gies7.text, self.risque_chimique1.text, self.risque_chimique2.text, self.risque_chimique3.text, self.risque_chimique4.text, self.risque_chimique5.text, self.risque_chimique6.text, self.risque_chimique7.text, self.atex1.text, self.atex2.text, self.atex3.text, self.atex4.text, self.atex5.text, self.atex6.text, self.atex7.text, self.restriction1.text, self.restriction2.text, self.restriction3.text, self.restriction4.text, self.restriction5.text, self.restriction6.text, self.restriction7.text, self.autes1.text, self.autes2.text, self.autes3.text, self.autes4.text, self.autes5.text, self.autes6.text, self.autes7.text,self.destf1.text, str_Image1, self.destf2.text, str_Image2 ,self.destf3.text, str_Image3,self.destf4.text, str_Image4,self.destf5.text, str_Image5,self.destf6.text, str_Image6,self.destf7.text, str_Image7,str_CreatedDate,str_CreatedDate];
            [[DBSqlite dbManager]insertStatement:strQuery];
            self.IsForUpdating=YES;
            saved_Into_DB=YES;
        }
        
        else if(saved_Into_DB==YES)
        {
            NSString * str_GetCount = @"SELECT attestation_id FROM attestation";
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount];
            NSString *updateSQL = [NSString stringWithFormat:
                                   @"update attestation set site = '%@', societe = '%@', adresse1='%@', adresse2='%@', cp='%@', ville='%@', nom1='%@', nom2='%@', nom3='%@', nom4='%@', nom5='%@', nom6='%@', nom7='%@', habilitation1='%@', habilitation2='%@', habilitation3='%@', habilitation4='%@', habilitation5='%@', habilitation6='%@', habilitation7='%@', gies1='%@', gies2='%@', gies3='%@', gies4='%@', gies5='%@', gies6='%@', gies7='%@', risque_chimique1='%@', risque_chimique2='%@', risque_chimique3='%@', risque_chimique4='%@', risque_chimique5='%@', risque_chimique6='%@', risque_chimique7='%@', atex1='%@', atex2='%@', atex3='%@', atex4='%@', atex5='%@', atex6='%@', atex7='%@', restriction1='%@', restriction2='%@', restriction3='%@', restriction4='%@', restriction5='%@', restriction6='%@', restriction7='%@', autes1='%@', autes2='%@', autes3='%@', autes4='%@', autes5='%@', autes6='%@', autes7='%@',date1='%@', et_sign1='%@', date2='%@', et_sign2='%@', date3='%@', et_sign3='%@', date4='%@', et_sign4='%@', date5='%@', et_sign5='%@', date6='%@', et_sign6='%@', date7='%@', et_sign7='%@', doc_modified_date='%@', doc_name='%@' where attestation_id='%d'", self.site.text, self.societe.text, self.adresse1.text, self.adresse2.text, self.cp.text, self.ville.text, self.nom1.text, self.nom2.text, self.nom3.text, self.nom4.text, self.nom5.text, self.nom6.text, self.nom7.text, self.habilitation1.text,self.habilitation2.text, self.habilitation3.text, self.habilitation4.text, self.habilitation5.text, self.habilitation6.text, self.habilitation7.text, self.gies1.text, self.gies2.text, self.gies3.text, self.gies4.text, self.gies5.text, self.gies6.text, self.gies7.text, self.risque_chimique1.text, self.risque_chimique2.text, self.risque_chimique3.text, self.risque_chimique4.text, self.risque_chimique5.text, self.risque_chimique6.text, self.risque_chimique7.text, self.atex1.text, self.atex2.text, self.atex3.text, self.atex4.text, self.atex5.text, self.atex6.text, self.atex7.text, self.restriction1.text, self.restriction2.text, self.restriction3.text, self.restriction4.text, self.restriction5.text, self.restriction6.text, self.restriction7.text, self.autes1.text, self.autes2.text, self.autes3.text, self.autes4.text, self.autes5.text, self.autes6.text, self.autes7.text,self.destf1.text, str_Image1, self.destf2.text, str_Image2 ,self.destf3.text, str_Image3,self.destf4.text, str_Image4,self.destf5.text, str_Image5,self.destf6.text, str_Image6,self.destf7.text, str_Image7,datestring12,str_DocumentName, CurrentCount];
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

- (void)openPerPagePDF
{
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:scrollView];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    NSLog(@"Now : %@", now) ;
    [format setDateFormat:@"dd-MM-YYYY_hhmmss"] ;
    NSString * datestring1 = [format stringFromDate:now];
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    str_DocumentName = [NSString stringWithFormat:@"PPS Emargement accueil chantier_%@.pdf", datestring1]  ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
    [pdfData writeToFile:path atomically:NO];
    NSLog(@"tmpDirectory: %@",path);
}

- (void)openPath:(NSString *)pathString
{
    NSURL *path1 = [NSURL fileURLWithPath:pathString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:path1];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    webView.scalesPageToFit = YES;
    [webView loadRequest:urlRequest];
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view = webView;
    [self.navigationController pushViewController:viewController animated:YES];
    UIBarButtonItem * sendButton = [[ UIBarButtonItem alloc] initWithTitle:@"Send Email" style:UIBarButtonItemStyleDone target:self action:@selector(showEmail:)];
    viewController.navigationItem.rightBarButtonItem=sendButton;
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


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
{
    if(textField==self.destf1)
    {
        [self.view endEditing:YES];
        [self showDatePicker];
        return NO;
    }
    else if(textField==self.destf2)
    {
        [self.view endEditing:YES];
        [self showDatePicker1];
        return NO;
    }
    else if(textField==self.destf3)
    {
        [self.view endEditing:YES];
        [self showDatePicker3];
        return NO;
    }
    else if(textField==self.destf4)
    {
        [self.view endEditing:YES];
        [self showDatePicker4];
        return NO;
    }
    else if(textField==self.destf5)
    {
        [self.view endEditing:YES];
        [self showDatePicker5];
        return NO;
    }
    
    else if(textField==self.destf6)
    {
        [self.view endEditing:YES];
        [self showDatePicker6];
        return NO;
    }
    
    else if(textField==self.destf7)
    {
        [self.view endEditing:YES];
        [self showDatePicker7];
        return NO;
    }
    return YES;
}

-(void)showDatePicker
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.destf1 setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.destf1.frame inView:self.view20 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.destf1.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.destf1.text = [NSString stringWithFormat:@"%@",dateString];
}

// ************ for second date *****************

-(void)showDatePicker1
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField1:) forControlEvents:UIControlEventValueChanged];
    [self.destf2 setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.destf2.frame inView:self.view28 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField1:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.destf2.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.destf2.text = [NSString stringWithFormat:@"%@",dateString];
}

// ****************** for third date *********************

-(void)showDatePicker3
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField3:) forControlEvents:UIControlEventValueChanged];
    [self.destf3 setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.destf3.frame inView:self.view36 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField3:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.destf3.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.destf3.text = [NSString stringWithFormat:@"%@",dateString];
}

// ************************ for fourth date *************************

-(void)showDatePicker4
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField4:) forControlEvents:UIControlEventValueChanged];
    [self.destf4 setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.destf4.frame inView:self.view44 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField4:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.destf4.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.destf4.text = [NSString stringWithFormat:@"%@",dateString];
}

// ********************** for fifth date **************************

-(void)showDatePicker5
{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField5:) forControlEvents:UIControlEventValueChanged];
    [self.destf5 setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.destf5.frame inView:self.view52 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField5:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.destf5.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.destf5.text = [NSString stringWithFormat:@"%@",dateString];
}

// ********************** for sixth date **************************

-(void)showDatePicker6
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField6:) forControlEvents:UIControlEventValueChanged];
    [self.destf6 setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.destf6.frame inView:self.view60 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField6:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.destf6.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.destf6.text = [NSString stringWithFormat:@"%@",dateString];
}

// ********************** for seventh date **************************

-(void)showDatePicker7
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField7:) forControlEvents:UIControlEventValueChanged];
    [self.destf7 setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.destf7.frame inView:self.view68 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField7:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.destf7.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.destf7.text = [NSString stringWithFormat:@"%@",dateString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)sendImgData:(UIImage *)image;
{
    UIImageView *imageView;
    if (sig1clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:501];
        sig1clicked=NO;
    }
    else if(sig2clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:502];
        sig2clicked=NO;
    }
    else if(sig3clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:503];
        sig3clicked=NO;
    }
    else if(sig4clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:504];
        sig4clicked=NO;
    }
    else if(sig5clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:505];
        sig5clicked=NO;
    }
    else if(sig6clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:506];
        sig6clicked=NO;
    }
    else if(sig7clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:507];
        sig7clicked=NO;
    }
    else
    {
        
    }
    imageView.image=image;
    //imgSign1.image=image;
}

#pragma mark UITextView delegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if(self.nom5==textView || self.habilitation5==textView || self.gies5==textView || self.risque_chimique5==textView || self.atex5==textView || self.restriction5==textView || self.autes5==textView || self.date_et_sign5==textView)
    {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 400)
                            animated:YES];
    }
    else if(self.nom6==textView || self.habilitation6==textView || self.gies6==textView || self.risque_chimique6==textView || self.atex6==textView || self.restriction6==textView || self.autes6==textView || self.date_et_sign6==textView)
    {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 450)
                                 animated:YES];
    }
    else if(self.nom7==textView || self.habilitation7==textView || self.gies7==textView || self.risque_chimique7==textView || self.atex7==textView || self.restriction7==textView || self.autes7==textView || self.date_et_sign7==textView)
    {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 450)
                            animated:YES];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    if(self.nom5==textView || self.habilitation5==textView || self.gies5==textView || self.risque_chimique5==textView || self.atex5==textView || self.restriction5==textView || self.autes5==textView || self.date_et_sign5==textView)
    {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 176)
                            animated:YES];
    }
    else if(self.nom6==textView || self.habilitation6==textView || self.gies6==textView || self.risque_chimique6==textView || self.atex6==textView || self.restriction6==textView || self.autes6==textView || self.date_et_sign6==textView)
    {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 176)
                            animated:YES];
    }
    else if(self.nom7==textView || self.habilitation7==textView || self.gies7==textView || self.risque_chimique7==textView || self.atex7==textView || self.restriction7==textView || self.autes7==textView || self.date_et_sign7==textView)
    {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 176)
                            animated:YES];
    }
}

@end
