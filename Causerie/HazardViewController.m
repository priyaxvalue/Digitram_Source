//
//  HazardViewController.m
//  Causerie
//
//
//

#import "HazardViewController.h"
#import "ScrollViewToPDF.h"
#import "DBSqlite.h"

@interface HazardViewController () < MFMailComposeViewControllerDelegate>

@end

@implementation HazardViewController

@synthesize txt_NomPrenom,txt_Date_de_Incident_ou_de_soins_benins,txt_Siege_de_lesions,txt_Date_transmission_par_le_Dr_au_DRSI,txt_Telephone,txt_lieu_de_levenement,txt_date_fiche,txt_temoins,txt_evaluation,txt_date_et_faits,txt_desc_faits,txt_Causes,txt_Mesure,txt_pilote,txt_delai,txt_Realise_Visa,txt_Date_Manager,txt_Type,txt_Nom,txt_Actions,txt_Qui,txt_Delai,txt_Realise,txt_Date_lemetteur,txt_Date_FSD,txt_Nom_du_declarant,txt_date_de_reception;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Entered") ;
    [self.scroll_View setContentSize:(CGSizeMake(768, 3000))];
    
    str_DocumentName = @"QE7160TR Fiche de Situation Dangereuse ou incident" ;
    self.title = str_DocumentName ;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;
    
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(saveToDataBase:)] ;
    self.navigationItem.rightBarButtonItem = pdfButton ;
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,saveButton, nil];
    self.navigationItem.rightBarButtonItems = arry ;
    
    self.fiche_btn=[[UIButton alloc]initWithFrame:CGRectMake(599, 47, 15, 15)];
    self.fiche_btn.layer.borderWidth=1.0;
    UIColor * green = [UIColor colorWithRed:0 green:128 blue:0 alpha:1.0];
    self.fiche_btn.layer.borderColor=(__bridge CGColorRef)(green);
    [self.fiche_btn addTarget:self action:@selector(fichebuttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.scroll_View addSubview:self.fiche_btn];
    
    self.incident_btn=[[UIButton alloc]initWithFrame:CGRectMake(460, 84, 15, 15)];
    self.incident_btn.layer.borderWidth=1.0;
    self.incident_btn.layer.borderColor=(__bridge CGColorRef)(green);
    [self.incident_btn addTarget:self action:@selector(incidentbuttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.scroll_View addSubview:self.incident_btn];
    saved_Into_DB=NO;
    
    
    if (self.IsForUpdating==NO )
    {
        b1=@"NO";
        b2=@"NO";
    }
    
    self.txt_desc_faits.layer.borderWidth = 1;
    self.txt_desc_faits.layer.borderColor = [[ UIColor blackColor] CGColor];
    
    self.txt_Causes.layer.borderWidth = 1 ;
    self.txt_Causes.layer.borderColor = [[ UIColor blackColor] CGColor] ;
    
    [self.dimg_tf1 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.dimg_tf2 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.dimg_tf3 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.dimg_tf4 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.dimg_tf5 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.dimg_lbl1 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.dimg_lbl2 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.dimg_lbl3 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.dimg_lbl4 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    
    ris_val=@"0";
    
    self.dimg_blbl1.layer.borderWidth=1.0;
    self.dimg_blbl2.layer.borderWidth=1.0;
    self.dimg_blbl3.layer.borderWidth=1.0;
    self.dimg_blbl4.layer.borderWidth=1.0;
    self.dimg_blbl5.layer.borderWidth=1.0;
    self.dimg_blbl6.layer.borderWidth=1.0;
    self.dimg_blbl7.layer.borderWidth=1.0;
    self.dimg_blbl8.layer.borderWidth=1.0;
    self.dimg_blbl9.layer.borderWidth=1.0;
    self.dimg_blbl10.layer.borderWidth=1.0;
    self.dimg_blbl11.layer.borderWidth=1.0;
    self.dimg_blbl12.layer.borderWidth=1.0;
    self.dimg_blbl13.layer.borderWidth=1.0;
    self.dimg_blbl14.layer.borderWidth=1.0;
    self.dimg_blbl15.layer.borderWidth=1.0;
    self.dimg_blbl16.layer.borderWidth=1.0;
    
    self.dimg_view1.layer.borderWidth=1.0;
    self.dimg_view2.layer.borderWidth=1.0;
    self.dimg_view3.layer.borderWidth=1.0;
    self.dimg_view4.layer.borderWidth=1.0;
    self.dimg_view5.layer.borderWidth=1.0;
    self.dimg_view6.layer.borderWidth=1.0;
    self.dimg_view7.layer.borderWidth=1.0;
    self.dimg_view8.layer.borderWidth=1.0;
    self.dimg_view9.layer.borderWidth=1.0;
    self.dimg_view10.layer.borderWidth=1.0;
    self.dimg_view11.layer.borderWidth=1.0;
    self.dimg_view12.layer.borderWidth=1.0;
    self.dimg_view13.layer.borderWidth=1.0;
    self.dimg_view14.layer.borderWidth=1.0;
    self.dimg_view15.layer.borderWidth=1.0;
    self.dimg_view16.layer.borderWidth=1.0;
    self.dimg_view17.layer.borderWidth=1.0;
    self.dimg_view18.layer.borderWidth=1.0;
    self.dimg_view19.layer.borderWidth=1.0;
    self.dimg_view20.layer.borderWidth=1.0;
    self.dimg_view21.layer.borderWidth=1.0;
    self.dimg_view22.layer.borderWidth=1.0;
    self.dimg_view23.layer.borderWidth=1.0;
    self.dimg_view24.layer.borderWidth=1.0;
    self.dimg_view25.layer.borderWidth=1.0;
    self.dimg_view26.layer.borderWidth=1.0;
    self.dimg_view27.layer.borderWidth=1.0;
    self.dimg_view28.layer.borderWidth=1.0;
    self.dimg_view29.layer.borderWidth=1.0;
    self.dimg_view30.layer.borderWidth=1.0;
    self.dimg_view31.layer.borderWidth=1.0;
    self.dimg_view32.layer.borderWidth=1.0;
    self.dimg_view33.layer.borderWidth=1.0;
    self.dimg_view34.layer.borderWidth=1.0;
    self.dimg_view35.layer.borderWidth=1.0;
    
    if (self.IsForUpdating==YES)
    {
        
        NSString *strb1=(self.retrievedarray)[0] [@"fiche"];
        NSString *strb2=@"YES";
        if([strb1 isEqualToString:strb2])
        {
            [self.fiche_btn setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b1=@"YES";
        }
        else
        {
            b1=@"NO";
        }
        
        NSString *strb3=(self.retrievedarray)[0] [@"incident"];
        
        if([strb3 isEqualToString:strb2])
        {
            [self.incident_btn setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            b2=@"YES";
        }
        else
        {
            b2=@"NO";
        }
        
        txt_NomPrenom.text= (self.retrievedarray)[0] [@"nom_premom"];
        txt_Date_de_Incident_ou_de_soins_benins.text=(self.retrievedarray)[0] [@"date_de_lincident"];
        txt_Siege_de_lesions.text=(self.retrievedarray)[0] [@"siege_de_lesions"];
        txt_Date_transmission_par_le_Dr_au_DRSI.text=(self.retrievedarray)[0] [@"date_transmission"];
        txt_Nom_du_declarant.text=(self.retrievedarray)[0] [@"declarant_de_la_fsd"];
        txt_date_de_reception.text=(self.retrievedarray)[0] [@"ingenieur_securite"];
        
        NSString *s=(self.retrievedarray)[0] [@"nom_fsd_telephone"];
        txt_Telephone.text=s;
        
        txt_lieu_de_levenement.text=(self.retrievedarray)[0] [@"lieu_de_levenement"];
        //txt_lieu_de_levenement.text=@"eeeeeeeeff";
        txt_date_fiche.text=(self.retrievedarray)[0] [@"date_de_lemission_de_fiche"];
        txt_temoins.text=(self.retrievedarray)[0] [@"temoins"];
        txt_evaluation.text=(self.retrievedarray)[0] [@"evaluation_de_criticite"];
        txt_date_et_faits.text=(self.retrievedarray)[0] [@"date_et_heure_des_faits"];
        
        txt_desc_faits.text=(self.retrievedarray)[0] [@"description_des_faits"];
        txt_Causes.text=(self.retrievedarray)[0] [@"causes_les_pourquoi"];
        txt_Mesure.text=(self.retrievedarray)[0] [@"mesure_prises_immediatement"];
        txt_pilote.text=(self.retrievedarray)[0] [@"pilote"];
        txt_delai.text=(self.retrievedarray)[0] [@"delai"];
        txt_Realise_Visa.text=(self.retrievedarray)[0] [@"realise_visa_du_pilote"];
        
        txt_Date_Manager.text=(self.retrievedarray)[0] [@"date_de_reception_par_le_manager"];
        txt_Nom.text=(self.retrievedarray)[0] [@"carde_reserve_nom"];
        
        txt_Type.text=(self.retrievedarray)[0] [@"si_traitement_type"];
        txt_Actions.text=(self.retrievedarray)[0] [@"si_traitement_actions_de_suivi"];
        txt_Qui.text=(self.retrievedarray)[0] [@"si_traitement_qui"];
        txt_Delai.text=(self.retrievedarray)[0] [@"si_traitement_delai"];
        txt_Realise.text=(self.retrievedarray)[0] [@"si_traitement_realise"];
        
        txt_Date_lemetteur.text=(self.retrievedarray)[0] [@"date_du_retour_emitteur"];
        txt_Date_FSD.text=(self.retrievedarray)[0] [@"date_du_solda_de_la_fsd"];
        
        
        NSString *rat_st=(self.retrievedarray)[0] [@"risk_value"];
        NSLog(@"%@", rat_st) ;
        ris_val = rat_st  ;
        
        NSString *st1=@"1";
        NSString *st2=@"2";
        NSString *st3=@"3";
        NSString *st4=@"4";
        NSString *st5=@"5";
        NSString *st6=@"6";
        NSString *st7=@"7";
        NSString *st8=@"8";
        NSString *st9=@"9";
        NSString *st10=@"10";
        NSString *st11=@"11";
        NSString *st12=@"12";
        NSString *st13=@"13";
        NSString *st14=@"14";
        NSString *st15=@"15";
        NSString *st16=@"16";
        
        if ([rat_st isEqualToString:st1])
        {
            [self.dimg_bt1 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st2])
        {
            [self.dimg_bt2 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st3])
        {
            [self.dimg_bt3 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st4])
        {
            [self.dimg_bt4 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st5])
        {
            [self.dimg_bt5 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st6])
        {
            [self.dimg_bt6 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st7])
        {
            [self.dimg_bt7 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st8])
        {
            [self.dimg_bt8 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st9])
        {
            [self.dimg_bt9 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st10])
        {
            [self.dimg_bt10 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st11])
        {
            [self.dimg_bt11 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st12])
        {
            [self.dimg_bt12 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st13])
        {
            [self.dimg_bt13 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st14])
        {
            [self.dimg_bt14 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st15])
        {
            [self.dimg_bt15 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
        else if ([rat_st isEqualToString:st16])
        {
            [self.dimg_bt16 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        }
    }
    
    txt_desc_faits.delegate=self;
    txt_Causes.delegate=self;
    txt_Causes.delegate=self;
    txt_Mesure.delegate=self;
    txt_pilote.delegate=self;
    txt_delai.delegate=self;
    txt_Realise_Visa.delegate=self;
    
    txt_Type.delegate=self;
    txt_Actions.delegate=self;
    txt_Qui.delegate=self;
    txt_Delai.delegate=self;
    txt_Realise.delegate=self;
    
    txt_Nom.delegate=self;
}

-(void)fichebuttonClicked
{
    
    if(self.fiche_btn.currentBackgroundImage==nil)
    {
        [self.fiche_btn setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        b1=@"YES";
        
        // [self.incident_btn setBackgroundImage:nil forState:UIControlStateNormal];
        //b2=@"NO";
        
    }
    else
    {
        [self.fiche_btn setBackgroundImage:nil forState:UIControlStateNormal];
        b1=@"NO";
        
    }
    
}

-(void)incidentbuttonClicked{
    if(self.incident_btn.currentBackgroundImage==nil)
    {
        [self.incident_btn setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        b2=@"YES";
        
        //[self.fiche_btn setBackgroundImage:nil forState:UIControlStateNormal];
        //b1=@"NO";
        
    }
    else
    {
        [self.incident_btn setBackgroundImage:nil forState:UIControlStateNormal];
        b2=@"NO";
        
    }
    
    
}





-(IBAction)buttcl:(id)sender;
{
    UIButton *butt=(UIButton *)sender;
    
    if (butt.tag==1)
    {
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        
        if(self.dimg_bt1.currentBackgroundImage==nil)
        {
            [self.dimg_bt1 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"1";
        }
        else if(self.dimg_bt1.currentBackgroundImage!=nil)
        {
            [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
            
        }
    }
    else if (butt.tag==2)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        
        if(self.dimg_bt2.currentBackgroundImage==nil)
        {
            [self.dimg_bt2 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"2";
            
        }
        else if(self.dimg_bt2.currentBackgroundImage!=nil)
        {
            [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    if (butt.tag==3)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        if(self.dimg_bt3.currentBackgroundImage==nil)
        {
            [self.dimg_bt3 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"3";
        }
        else if(self.dimg_bt3.currentBackgroundImage!=nil)
        {
            [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==4)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        if(self.dimg_bt4.currentBackgroundImage==nil)
        {
            [self.dimg_bt4 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"4";
        }
        else if(self.dimg_bt4.currentBackgroundImage!=nil)
        {
            [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==5)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        if(self.dimg_bt5.currentBackgroundImage==nil)
        {
            [self.dimg_bt5 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"5";
        }
        else if(self.dimg_bt5.currentBackgroundImage!=nil)
        {
            [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==6)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        if(self.dimg_bt6.currentBackgroundImage==nil)
        {
            [self.dimg_bt6 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"6";
        }
        else if(self.dimg_bt6.currentBackgroundImage!=nil)
        {
            [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==7)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        if(self.dimg_bt7.currentBackgroundImage==nil)
        {
            [self.dimg_bt7 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"7";
            
        }
        else if(self.dimg_bt7.currentBackgroundImage!=nil)
        {
            [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==8)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        if(self.dimg_bt8.currentBackgroundImage==nil)
        {
            [self.dimg_bt8 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"8";
        }
        else if(self.dimg_bt8.currentBackgroundImage!=nil)
        {
            [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==9)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        if(self.dimg_bt9.currentBackgroundImage==nil)
        {
            [self.dimg_bt9 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"9";
        }
        else if(self.dimg_bt9.currentBackgroundImage!=nil)
        {
            [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==10)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        
        if(self.dimg_bt10.currentBackgroundImage==nil)
        {
            [self.dimg_bt10 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"10";
        }
        else if(self.dimg_bt10.currentBackgroundImage!=nil)
        {
            [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==11)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        if(self.dimg_bt11.currentBackgroundImage==nil)
        {
            [self.dimg_bt11 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"11";
        }
        else if(self.dimg_bt11.currentBackgroundImage!=nil)
        {
            [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==12)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        if(self.dimg_bt12.currentBackgroundImage==nil)
        {
            [self.dimg_bt12 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"12";
        }
        else if(self.dimg_bt12.currentBackgroundImage!=nil)
        {
            [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==13)
    {
        
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        
        if(self.dimg_bt13.currentBackgroundImage==nil)
        {
            [self.dimg_bt13 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"13";
        }
        else if(self.dimg_bt13.currentBackgroundImage!=nil)
        {
            [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==14)
    {
        
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        
        if(self.dimg_bt14.currentBackgroundImage==nil)
        {
            [self.dimg_bt14 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"14";
        }
        else if(self.dimg_bt14.currentBackgroundImage!=nil)
        {
            [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==15)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        
        if(self.dimg_bt15.currentBackgroundImage==nil)
        {
            [self.dimg_bt15 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"15";
            
        }
        else if(self.dimg_bt15.currentBackgroundImage!=nil)
        {
            [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    
    if (butt.tag==16)
    {
        [self.dimg_bt1 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt2 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt3 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt4 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt5 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt6 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt7 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt8 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt9 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt10 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt11 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt12 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt13 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt14 setBackgroundImage:nil forState:UIControlStateNormal];
        [self.dimg_bt15 setBackgroundImage:nil forState:UIControlStateNormal];
        
        if(self.dimg_bt16.currentBackgroundImage==nil)
        {
            [self.dimg_bt16 setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
            ris_val=@"16";
        }
        else if(self.dimg_bt16.currentBackgroundImage!=nil)
        {
            [self.dimg_bt16 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
}
#pragma mark TextView delegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    //    txt_Type;
    //    txt_Actions;
    //    txt_Qui;
    //    txt_Delai;
    //    txt_Realise;
    
    if (textView==txt_desc_faits) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1700;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_Causes) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1500;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_Mesure) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1200;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_pilote) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1200;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_delai) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1200;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_Realise_Visa) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1200;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_Type) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-100;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_Actions) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-100;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_Qui) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-100;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_Delai) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-100;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if (textView==txt_Realise) {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-100;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.txt_Date_de_Incident_ou_de_soins_benins)
    {
        [self.view endEditing:YES];
        [self showDatePicker];
        return NO;
    }
    else if(textField == self.txt_Date_transmission_par_le_Dr_au_DRSI)
    {
        [self.view endEditing:YES];
        [self showDatePicker11];
        return NO;
    }
    
    else if(textField == self.txt_date_fiche)
    {
        [self.view endEditing:YES];
        [self showDatePicker12];
        return NO;
    }
    
    else if(textField == self.txt_date_et_faits)
    {
        [self.view endEditing:YES];
        [self showDatePicker13];
        return NO;
    }
    
    else if(textField == self.txt_Date_Manager)
    {
        [self.view endEditing:YES];
        [self showDatePicker14];
        return NO;
    }
    
    else if(textField == self.txt_Date_FSD)
    {
        [self.view endEditing:YES];
        [self showDatePicker16];
        return NO;
    }
    
    else if(textField == self.txt_Date_lemetteur)
    {
        [self.view endEditing:YES];
        [self showDatePicker17];
        return NO;
    }
    
    else if(textField == self.txt_date_de_reception)
    {
        [self.view endEditing:YES];
        [self showDatePicker18];
        return NO;
    }
    
    else if(textField == txt_Nom)
    {
        CGRect scrollViewFrame=_scroll_View.frame;
        CGPoint bottomOffset = CGPointMake(0, _scroll_View.contentSize.height - _scroll_View.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1000;
        [_scroll_View scrollRectToVisible:scrollViewFrame animated:YES];
    }
    
    return YES;
}

-(void)showDatePicker

{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.txt_Date_de_Incident_ou_de_soins_benins setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.txt_Date_de_Incident_ou_de_soins_benins.frame inView:self.view_NomPrenom permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.txt_Date_de_Incident_ou_de_soins_benins.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.txt_Date_de_Incident_ou_de_soins_benins.text = [NSString stringWithFormat:@"%@",dateString];
}

-(void)showDatePicker11
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField11:) forControlEvents:UIControlEventValueChanged];
    [self.txt_Date_transmission_par_le_Dr_au_DRSI setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.txt_Date_transmission_par_le_Dr_au_DRSI.frame inView:self.view_NomPrenom permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField11:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.txt_Date_transmission_par_le_Dr_au_DRSI.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.txt_Date_transmission_par_le_Dr_au_DRSI.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void)showDatePicker12

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField12:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_date_fiche setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.txt_date_fiche.frame inView:self.scroll_View permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField12:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.txt_date_fiche.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.txt_date_fiche.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void)showDatePicker13

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    [datePicker addTarget:self action:@selector(dateTextField13:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_date_et_faits setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.txt_date_et_faits.frame inView:self.scroll_View permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField13:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.txt_date_et_faits.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY HH:mm"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.txt_date_et_faits.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void)showDatePicker14

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField14:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Date_Manager setInputView:datePicker];
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.txt_Date_Manager.frame inView:self.scroll_View permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField14:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.txt_Date_Manager.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.txt_Date_Manager.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void)showDatePicker16

{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField16:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Date_FSD setInputView:datePicker];
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.txt_Date_FSD.frame inView:self.scroll_View permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField16:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.txt_Date_FSD.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.txt_Date_FSD.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void)showDatePicker17

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField17:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Date_lemetteur setInputView:datePicker];
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.txt_Date_lemetteur.frame inView:self.scroll_View permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField17:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.txt_Date_lemetteur.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.txt_Date_lemetteur.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void)showDatePicker18

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField18:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_date_de_reception setInputView:datePicker];
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.txt_date_de_reception.frame inView:self.scroll_View permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}
-(void) dateTextField18:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.txt_date_de_reception.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.txt_date_de_reception.text = [NSString stringWithFormat:@"%@",dateString];
    
}




#pragma mark - PDF Creation

- (void)openPerPagePDF
{
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:self.scroll_View];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    NSLog(@"Now : %@", now) ;
    //[format setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    [ format setDateFormat:@"dd-MM-YYYY_hhmmss"] ;
    NSString * datestring1 = [format stringFromDate:now];
    
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    
    //   Formname_DDMMYYYYhhmmss
    str_DocumentName = [NSString stringWithFormat:@"Fiche de Situation Dangereuse ou incident_%@.pdf", datestring1]  ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
    [pdfData writeToFile:path atomically:NO];
   // bool_SavedTofile = true ;
    NSLog(@"tmpDirectory: %@",path);
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
    
    if (self.IsForUpdating==YES )
    {
      
        if (self.retrievedarray!=nil)
        {
            NSLog(@"retrive:%@",self.retrievedarray);
            NSLog(@"retrive:%@",(self.retrievedarray)[0][@"hazard_id"]);
            NSString *str=(self.retrievedarray)[0][@"hazard_id"];
            nnn=[str intValue];
        }
        else
        {
            NSString * str_GetCount = @"SELECT hazard_id FROM hazardous_record" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            nnn =  CurrentCount;
        }
            [self openPerPagePDF] ;
            NSString *updateSQL = [NSString stringWithFormat:
                               @"update hazardous_record set doc_name='%@',nom_premom='%@',date_de_lincident='%@',siege_de_lesions='%@',date_transmission='%@',nom_fsd_telephone='%@',lieu_de_levenement='%@',date_de_lemission_de_fiche='%@',temoins='%@',evaluation_de_criticite='%@',date_et_heure_des_faits='%@',description_des_faits='%@',causes_les_pourquoi='%@',mesure_prises_immediatement='%@',pilote='%@',delai='%@',realise_visa_du_pilote='%@',date_de_reception_par_le_manager='%@',carde_reserve_nom='%@',risk_value='%@',si_traitement_type='%@',si_traitement_actions_de_suivi='%@',si_traitement_qui='%@',si_traitement_delai='%@',si_traitement_realise='%@',date_du_retour_emitteur='%@',date_du_solda_de_la_fsd='%@',doc_modified_date='%@',fiche='%@',incident='%@',declarant_de_la_fsd='%@',ingenieur_securite='%@' where hazard_id='%ld'", str_DocumentName,self.txt_NomPrenom.text, self.txt_Date_de_Incident_ou_de_soins_benins.text, self.txt_Siege_de_lesions.text,self.txt_Date_transmission_par_le_Dr_au_DRSI.text,self.txt_Telephone.text,self.txt_lieu_de_levenement.text,self.txt_date_fiche.text,self.txt_temoins.text,self.txt_evaluation.text, self.txt_date_et_faits.text,self.txt_desc_faits.text,self.txt_Causes.text,self.txt_Mesure.text,self.txt_pilote.text,self.txt_delai.text, self.txt_Realise_Visa.text,self.txt_Date_Manager.text,self.txt_Nom.text,ris_val,self.txt_Type.text,self.txt_Actions.text,self.txt_Qui.text,self.txt_Delai.text,self.txt_Realise.text,self.txt_Date_lemetteur.text,self.txt_Date_FSD.text,datestring12,b1,b2,txt_Nom_du_declarant.text,txt_date_de_reception.text, (long)nnn];
            [[ DBSqlite dbManager] updateStatement:updateSQL];
        }
    
    else
    {
        if(saved_Into_DB==NO)
        {
            [self openPerPagePDF] ;
            NSString * str_GetCount = @"SELECT hazard_id FROM hazardous_record" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSLog(@"Current Count : %d", CurrentCount) ;
            NSString *strQuery = [NSString stringWithFormat:@"insert into hazardous_record(hazard_id,doc_name,nom_premom,date_de_lincident,siege_de_lesions,date_transmission,nom_fsd_telephone,lieu_de_levenement,date_de_lemission_de_fiche,temoins,evaluation_de_criticite,date_et_heure_des_faits,description_des_faits,causes_les_pourquoi,mesure_prises_immediatement,pilote,delai,realise_visa_du_pilote,date_de_reception_par_le_manager,carde_reserve_nom,risk_value,si_traitement_type,si_traitement_actions_de_suivi,si_traitement_qui,si_traitement_delai,si_traitement_realise,date_du_retour_emitteur,date_du_solda_de_la_fsd,doc_created_date,doc_modified_date,fiche,incident,declarant_de_la_fsd,ingenieur_securite) values (\"%d\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",++CurrentCount,str_DocumentName,self.txt_NomPrenom.text, self.txt_Date_de_Incident_ou_de_soins_benins.text, self.txt_Siege_de_lesions.text,self.txt_Date_transmission_par_le_Dr_au_DRSI.text,self.txt_Telephone.text,self.txt_lieu_de_levenement.text,self.txt_date_fiche.text,self.txt_temoins.text,self.txt_evaluation.text, self.txt_date_et_faits.text,self.txt_desc_faits.text,self.txt_Causes.text,self.txt_Mesure.text,self.txt_pilote.text,self.txt_delai.text, self.txt_Realise_Visa.text,self.txt_Date_Manager.text,self.txt_Nom.text,ris_val,self.txt_Type.text,self.txt_Actions.text,self.txt_Qui.text,self.txt_Delai.text,self.txt_Realise.text,self.txt_Date_lemetteur.text,self.txt_Date_FSD.text,str_CreatedDate,str_CreatedDate,b1,b2,txt_Nom_du_declarant.text,txt_date_de_reception.text];
            [[DBSqlite dbManager]insertStatement:strQuery];
            self.IsForUpdating=YES;
            saved_Into_DB=YES;
        }
        else if(saved_Into_DB==YES)
        {
            NSString * str_GetCount = @"SELECT hazard_id FROM hazardous_record";
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount];
            NSString *updateSQL = [NSString stringWithFormat:
                                   @"update hazardous_record set doc_name='%@',nom_premom='%@',date_de_lincident='%@',siege_de_lesions='%@',date_transmission='%@',nom_fsd_telephone='%@',lieu_de_levenement='%@',date_de_lemission_de_fiche='%@',temoins='%@',evaluation_de_criticite='%@',date_et_heure_des_faits='%@',description_des_faits='%@',causes_les_pourquoi='%@',mesure_prises_immediatement='%@',pilote='%@',delai='%@',realise_visa_du_pilote='%@',date_de_reception_par_le_manager='%@',carde_reserve_nom='%@',risk_value='%@',si_traitement_type='%@',si_traitement_actions_de_suivi='%@',si_traitement_qui='%@',si_traitement_delai='%@',si_traitement_realise='%@',date_du_retour_emitteur='%@',date_du_solda_de_la_fsd='%@',doc_modified_date='%@',fiche='%@',incident='%@',declarant_de_la_fsd='%@',ingenieur_securite='%@' where hazard_id='%d'", str_DocumentName,self.txt_NomPrenom.text, self.txt_Date_de_Incident_ou_de_soins_benins.text, self.txt_Siege_de_lesions.text,self.txt_Date_transmission_par_le_Dr_au_DRSI.text,self.txt_Telephone.text,self.txt_lieu_de_levenement.text,self.txt_date_fiche.text,self.txt_temoins.text,self.txt_evaluation.text, self.txt_date_et_faits.text,self.txt_desc_faits.text,self.txt_Causes.text,self.txt_Mesure.text,self.txt_pilote.text,self.txt_delai.text, self.txt_Realise_Visa.text,self.txt_Date_Manager.text,self.txt_Nom.text,ris_val,self.txt_Type.text,self.txt_Actions.text,self.txt_Qui.text,self.txt_Delai.text,self.txt_Realise.text,self.txt_Date_lemetteur.text,self.txt_Date_FSD.text,datestring12,b1,b2,txt_Nom_du_declarant.text,txt_date_de_reception.text, CurrentCount];
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
