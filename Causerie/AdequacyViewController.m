

#import "AdequacyViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ScrollViewToPDF.h"
#import "CauzQSSE_ViewController.h"
#import "messageui/messageui.h"
#import "SignaVC.h"
#import "AdequacyViewController.h"

@interface AdequacyViewController ()<UIPopoverControllerDelegate,MFMailComposeViewControllerDelegate, SignaVCDelegate, UIAlertViewDelegate, UITextFieldDelegate>


@end

@implementation AdequacyViewController

- (void)viewDidLoad
{
    
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    
    self.title = @"Print Preview" ;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // Created and modified date as of now
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;
    
    sig1clicked=NO;
    sig2clicked=NO;
    
    if (self.IsForUpdating==NO)
    {
        self.b1=@"NO";
        self.b2=@"NO";
        self.b3=@"NO";
        self.b4=@"NO";
        self.b5=@"NO";
        self.b6=@"NO";
        self.b7=@"NO";
        self.b8=@"NO";
        self.b9=@"NO";
        self.b10=@"NO";
        self.b11=@"NO";
        self.b12=@"NO";
        self.b13=@"NO";
        self.b14=@"NO";
        self.b15=@"NO";
        self.b16=@"NO";
        self.b17=@"NO";
        self.b18=@"NO";
        self.b19=@"NO";
        self.b20=@"NO";
        self.b21=@"NO";
        self.b22=@"NO";
        self.b23=@"NO";
        self.b24=@"NO";
        self.b25=@"NO";
        self.b26=@"NO";
        self.b27=@"NO";
    }
    
    [super viewDidLoad];
    [scrollView setContentSize:(CGSizeMake(768 , 2100))];
    saved_Into_DB=NO;
    self.bgrue.layer.borderWidth=1.0;
    self.bgrue.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bpemp.layer.borderWidth=1.0;
    self.bgrue.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bengn.layer.borderWidth=1.0;
    self.bengn.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bpont.layer.borderWidth=1.0;
    self.bengn.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bacces.layer.borderWidth=1.0;
    self.bacces.layer.borderColor=[[UIColor blackColor]CGColor];
    self.blope1.layer.borderWidth=1.0;
    self.blope1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.blope2.layer.borderWidth=1.0;
    self.blope2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bleng1.layer.borderWidth=1.0;
    self.bleng1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bleng2.layer.borderWidth=1.0;
    self.bleng2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bles1.layer.borderWidth=1.0;
    self.bles1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bles2.layer.borderWidth=1.0;
    self.bles2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.blengc1.layer.borderWidth=1.0;
    self.blengc1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.blengc2.layer.borderWidth=1.0;
    self.blengc2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.blengt1.layer.borderWidth=1.0;
    self.blengt1.layer.borderColor=[[UIColor blackColor]CGColor];    
    self.blengt2.layer.borderWidth=1.0;
    self.blengt2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.badeq1.layer.borderWidth=1.0;
    self.badeq1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.badeq2.layer.borderWidth=1.0;
    self.badeq2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bprise1.layer.borderWidth=1.0;
    self.bprise1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bprise2.layer.borderWidth=1.0;
    self.bprise2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bprisefos1.layer.borderWidth=1.0;
    self.bprisefos1.layer.borderColor=[[UIColor blackColor]CGColor];    
    self.bprisefos2.layer.borderWidth=1.0;
    self.bprisefos2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bprisepou1.layer.borderWidth=1.0;
    self.bprisepou1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bprisepou2.layer.borderWidth=1.0;
    self.bprisepou2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bpriseora1.layer.borderWidth=1.0;
    self.bpriseora1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bpriseora2.layer.borderWidth=1.0;
    self.bpriseora2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bzone1.layer.borderWidth=1.0;
    self.bzone1.layer.borderColor=[[UIColor blackColor]CGColor];
    self.bzone2.layer.borderWidth=1.0;
    self.bzone2.layer.borderColor=[[UIColor blackColor]CGColor];
    self.headtf.layer.borderColor=[[UIColor colorWithRed:0/255.00f green:149/255.00f blue:48/255.00f alpha:1.0f]CGColor];
    self.headtf.layer.borderWidth=2.0;
    self.headtf.layer.cornerRadius=5;
    self.headtf.clipsToBounds=YES;
    self.headtf.enabled=NO;
    self.img1view.layer.borderWidth=0.8;
    self.img2view.layer.borderWidth=0.8;
    self.adresse_du_chantier.layer.borderWidth=1.0;
    self.sheadview1.layer.borderWidth=0.8;
    self.view1.layer.borderWidth=0.8;
    self.view2.layer.borderWidth=0.8;
    self.view3.layer.borderWidth=0.8;
    self.sheadview2.layer.borderWidth=0.8;
    self.view4.layer.borderWidth=0.8;
    self.sheadview3.layer.borderWidth=0.8;
    self.view5.layer.borderWidth=0.8;
    self.view6.layer.borderWidth=0.8;
    self.view7.layer.borderWidth=0.8;
    self.view8.layer.borderWidth=0.8;
    self.view9.layer.borderWidth=0.8;
    self.view10.layer.borderWidth=0.8;
    self.view11.layer.borderWidth=0.8;
    self.view12.layer.borderWidth=0.8;
    self.view13.layer.borderWidth=0.8;
    self.view14.layer.borderWidth=0.8;
    self.view15.layer.borderWidth=0.8;
    self.view16.layer.borderWidth=0.8;
    self.view17.layer.borderWidth=0.8;
    self.view18.layer.borderWidth=0.8;
    self.view19.layer.borderWidth=0.8;    
    self.view20.layer.borderWidth=0.8;
    self.view21.layer.borderWidth=0.8;
    self.sheadview4.layer.borderWidth=0.8;
    self.view22.layer.borderWidth=0.8;    
    self.view23.layer.borderWidth=0.8;
    self.view24.layer.borderWidth=0.8;
    self.view25.layer.borderWidth=0.8;
    self.view26.layer.borderWidth=0.8;
    self.view27.layer.borderWidth=0.8;
    self.view28.layer.borderWidth=0.8;
    self.view29.layer.borderWidth=0.8;
    self.view30.layer.borderWidth=0.8;
    self.view31.layer.borderWidth=0.8;
    self.view32.layer.borderWidth=0.8;
    self.view33.layer.borderWidth=0.8;
    self.view34.layer.borderWidth=0.8;
    self.view35.layer.borderWidth=0.8;
    self.view36.layer.borderWidth=0.8;
    self.view37.layer.borderWidth=0.8;
    self.view38.layer.borderWidth=0.8;
    self.view39.layer.borderWidth=0.8;
    self.view40.layer.borderWidth=0.8;
    self.view41.layer.borderWidth=0.8;
    self.view42.layer.borderWidth=0.8;
    self.view43.layer.borderWidth=0.8;
    self.view44.layer.borderWidth=0.8;
    self.view45.layer.borderWidth=0.8;
    self.view46.layer.borderWidth=0.8;
    self.view47.layer.borderWidth=0.8;
    self.view48.layer.borderWidth=0.8;
    self.view49.layer.borderWidth=0.8;
    self.view50.layer.borderWidth=0.8;
    self.view51.layer.borderWidth=0.8;
    self.view52.layer.borderWidth=0.8;
    
    self.ver_controle_non_obs1.delegate=self;
    self.ver_controle_non_obs2.delegate=self;
    self.ver_controle_non_obs3.delegate=self;
    self.ver_controle_non_obs4.delegate=self;
    self.ver_controle_non_obs5.delegate=self;
    
    self.examen_controle_obs1.delegate=self;
    self.examen_controle_obs2.delegate=self;
    self.examen_controle_obs3.delegate=self;
    self.examen_controle_obs4.delegate=self;
    self.examen_controle_obs5.delegate=self;
    self.examen_controle_obs6.delegate=self;
    self.examen_poids_total.delegate=self;
    self.examen_cmu.delegate=self;
    self.examen_cmu_des_accessories.delegate=self;
    self.charge_de_travaux.delegate=self;
    self.levagiste_si_location_nom.delegate=self;
    
    if(self.confirmpdf==YES)
    {
        self.charge_de_travaux.text=self.dataarray[5];
        self.proprietaire_du_materiel.text=self.dataarray[6];
        self.no_dossier.text=self.dataarray[7];
        self.adresse_du_chantier.text=self.dataarray[8];
    
        self.identi_marque.text=self.dataarray[9];
        self.identi_type.text=self.dataarray[10];
        self.identi_no.text=self.dataarray[11];
        self.identi_n_serie.text=self.dataarray[12];
        self.identi_no_immatri_grue.text=self.dataarray[13];
    
        self.ver_controle_non_obs1.text=self.dataarray[24];
        self.ver_controle_non_obs2.text=self.dataarray[25];
        self.ver_controle_non_obs3.text=self.dataarray[26];
        self.ver_controle_non_obs4.text=self.dataarray[27];
        self.ver_controle_non_obs5.text=self.dataarray[28];
    
        self.examen_poids_total.text=self.dataarray[29];
        self.examen_cmu.text=self.dataarray[30];
        self.examen_cmu_des_accessories.text=self.dataarray[31];
    
        self.examen_controle_obs1.text=self.dataarray[44];
        self.examen_controle_obs2.text=self.dataarray[45];
        self.examen_controle_obs3.text=self.dataarray[46];
        self.examen_controle_obs4.text=self.dataarray[47];
        self.examen_controle_obs5.text=self.dataarray[48];
        self.examen_controle_obs6.text=self.dataarray[49];
    
        self.charge_de_travaux_nom.text=self.dataarray[50];
        self.datf1.text=self.dataarray[51];
        self.levagiste_si_location_nom.text=self.dataarray1[0];
        self.datf2.text=self.dataarray1[1];
    
        NSString *strb1=self.dataarray[0];
        NSString *strb2=@"YES";
        if([strb1 isEqualToString:strb2])
        {
            [self.bgrue setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b1=@"YES";
        }
    
        NSString *strb3=self.dataarray[1];
        NSString *strb4=@"YES";
        if([strb3 isEqualToString:strb4])
        {
        [self.bpemp setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b2=@"YES";
        }
    
        NSString *strb5=self.dataarray[2];
        NSString *strb6=@"YES";
        if([strb5 isEqualToString:strb6])
        {
            [self.bengn setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b3=@"YES";
        }
    
        NSString *strb7=self.dataarray[3];
        NSString *strb8=@"YES";
        if([strb7 isEqualToString:strb8])
        {
            [self.bpont setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b4=@"YES";
        }
    
        NSString *strb9=self.dataarray[4];
        NSString *strb10=@"YES";
        if([strb9 isEqualToString:strb10])
        {
            [self.bacces setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b5=@"YES";
        }
    
        NSString *strb11=self.dataarray[14];
        NSString *strb12=@"YES";
        if([strb11 isEqualToString:strb12])
        {
            [self.blope1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b6=@"YES";
        }
    
        NSString *strb13=self.dataarray[15];
        NSString *strb14=@"YES";
        if([strb13 isEqualToString:strb14])
        {
            [self.blope2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b7=@"YES";
        }
    
        NSString *strb15=self.dataarray[16];
        NSString *strb16=@"YES";
        if([strb15 isEqualToString:strb16])
        {
            [self.bleng1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b8=@"YES";
        }
    
        NSString *strb17=self.dataarray[17];
        NSString *strb18=@"YES";
        if([strb17 isEqualToString:strb18])
        {
            [self.bleng2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b9=@"YES";
        }
    
        NSString *strb19=self.dataarray[18];
        NSString *strb20=@"YES";
        if([strb19 isEqualToString:strb20])
        {
            [self.bles1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b10=@"YES";
        }
    
        NSString *strb21=self.dataarray[19];
        NSString *strb22=@"YES";
        if([strb21 isEqualToString:strb22])
        {
            [self.bles2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b11=@"YES";
        }
    
        NSString *strb23=self.dataarray[20];
        NSString *strb24=@"YES";
        if([strb23 isEqualToString:strb24])
        {
            [self.blengc1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b12=@"YES";
        }
    
        NSString *strb25=self.dataarray[21];
        NSString *strb26=@"YES";
        if([strb25 isEqualToString:strb26])
        {
            [self.blengc2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b13=@"YES";
        }
    
        NSString *strb27=self.dataarray[22];
        NSString *strb28=@"YES";
        if([strb27 isEqualToString:strb28])
        {
            [self.blengt1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b14=@"YES";
        }
    
        NSString *strb29=self.dataarray[23];
        NSString *strb30=@"YES";
        if([strb29 isEqualToString:strb30])
        {
            [self.blengt2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b15=@"YES";
        }
    
        NSString *strb31=self.dataarray[32];
        NSString *strb32=@"YES";
        if([strb31 isEqualToString:strb32])
        {
            [self.badeq1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b16=@"YES";
        }
    
        NSString *strb33=self.dataarray[33];
        NSString *strb34=@"YES";
        if([strb33 isEqualToString:strb34])
        {
            [self.badeq2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b17=@"YES";
        }
    
        NSString *strb35=self.dataarray[34];
        NSString *strb36=@"YES";
        if([strb35 isEqualToString:strb36])
        {
            [self.bprise1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b18=@"YES";
        }
    
        NSString *strb37=self.dataarray[35];
        NSString *strb38=@"YES";
        if([strb37 isEqualToString:strb38])
        {
        [self.bprise2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b19=@"YES";
        }
        NSString *strb39=self.dataarray[36];
        NSString *strb40=@"YES";
        if([strb39 isEqualToString:strb40])
        {
            [self.bprisefos1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b20=@"YES";
        }
        NSString *strb41=self.dataarray[37];
        NSString *strb42=@"YES";
        if([strb41 isEqualToString:strb42])
        {
            [self.bprisefos2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b21=@"YES";
        }
    
        NSString *strb43=self.dataarray[38];
        NSString *strb44=@"YES";
        if([strb43 isEqualToString:strb44])
        {
            [self.bprisepou1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b22=@"YES";
        }
    
        NSString *strb45=self.dataarray[39];
        NSString *strb46=@"YES";
        if([strb45 isEqualToString:strb46])
        {
            [self.bprisepou2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b23=@"YES";
        }
    
        NSString *strb47=self.dataarray[40];
        NSString *strb48=@"YES";
        if([strb47 isEqualToString:strb48])
        {
            [self.bpriseora1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b24=@"YES";
        }
        NSString *strb49=self.dataarray[41];
        NSString *strb50=@"YES";
        if([strb49 isEqualToString:strb50])
        {
            [self.bpriseora2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b25=@"YES";
        }
    
        NSString *strb51=self.dataarray[42];
        NSString *strb52=@"YES";
        if([strb51 isEqualToString:strb52])
        {
            [self.bzone1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b26=@"YES";
        }
        NSString *strb53=self.dataarray[43];
        NSString *strb54=@"YES";
        if([strb53 isEqualToString:strb54])
        {
        [   self.bzone2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b27=@"YES";
        }
        if (self.imagearray.count!=0)
        {
            NSString *datas1=self.imagearray[0];
            NSData *data=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image=[[UIImage alloc]init];
            image=[UIImage imageWithData:data];
            [self.imgSign1 setImage:image];
        }
        if (self.imagearray1.count!=0)
        {
            NSString *datas2=self.imagearray1[0];
            NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image1=[[UIImage alloc]init];
            image1=[UIImage imageWithData:data2];
            [self.imgSign2 setImage:image1];
        }
    
    }
    
    
    else
    {
    if (self.IsForUpdating==YES)
    {
        self.charge_de_travaux.text=(self.retrievedarray)[0][@"charge_de_travaux"];
        self.proprietaire_du_materiel.text=(self.retrievedarray)[0][@"proprietaire_du_materiel"];
        self.no_dossier.text=(self.retrievedarray)[0][@"no_dossier"];
        self.adresse_du_chantier.text=(self.retrievedarray)[0][@"adresse_du_chantier"];
        
        self.identi_marque.text=(self.retrievedarray)[0][@"identi_marque"];
        self.identi_type.text=(self.retrievedarray)[0][@"identi_type"];
        self.identi_no.text=(self.retrievedarray)[0][@"identi_no"];
        self.identi_n_serie.text=(self.retrievedarray)[0][@"identi_n_serie"];
        self.identi_no_immatri_grue.text=(self.retrievedarray)[0][@"identi_no_immatri_grue"];
        
        self.ver_controle_non_obs1.text=(self.retrievedarray)[0][@"ver_controle_non_obs1"];
        self.ver_controle_non_obs2.text=(self.retrievedarray)[0][@"ver_controle_non_obs2"];
        self.ver_controle_non_obs3.text=(self.retrievedarray)[0][@"ver_controle_non_obs3"];
        self.ver_controle_non_obs4.text=(self.retrievedarray)[0][@"ver_controle_non_obs4"];
        self.ver_controle_non_obs5.text=(self.retrievedarray)[0][@"ver_controle_non_obs5"];
        
        self.examen_poids_total.text=(self.retrievedarray)[0][@"examen_poids_total"];
        self.examen_cmu.text=(self.retrievedarray)[0][@"examen_cmu"];
        self.examen_cmu_des_accessories.text=(self.retrievedarray)[0][@"examen_cmu_des_accessories"];
        self.examen_controle_obs1.text=(self.retrievedarray)[0][@"examen_controle_obs1"];
        self.examen_controle_obs2.text=(self.retrievedarray)[0][@"examen_controle_obs2"];
        self.examen_controle_obs3.text=(self.retrievedarray)[0][@"examen_controle_obs3"];
        self.examen_controle_obs4.text=(self.retrievedarray)[0][@"examen_controle_obs4"];
        self.examen_controle_obs5.text=(self.retrievedarray)[0][@"examen_controle_obs5"];
        self.examen_controle_obs6.text=(self.retrievedarray)[0][@"examen_controle_obs6"];
        
        self.charge_de_travaux_nom.text=(self.retrievedarray)[0][@"charge_de_travaux_nom"];
        self.datf1.text=(self.retrievedarray)[0][@"charge_de_travaux_date"];
        self.levagiste_si_location_nom.text=(self.retrievedarray)[0][@"levagiste_si_location_nom"];
        self.datf2.text=(self.retrievedarray)[0][@"levagiste_si_location_date"];
        
        // ***************** For Checkbox Button
        
        NSString *strb1=(self.retrievedarray)[0] [@"grue"];
        NSString *strb2=@"YES";
        if([strb1 isEqualToString:strb2])
        {
            [self.bgrue setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b1=@"YES";
        }
        else
        {
            self.b1=@"NO";
        }
        
        NSString *strb3=(self.retrievedarray)[0] [@"pemp_nacelle"];
        if([strb3 isEqualToString:strb2])
        {
            [self.bpemp setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b2=@"YES";
        }
        else
        {
            self.b2=@"NO";
        }
        
        NSString *strb5=(self.retrievedarray)[0] [@"engin_autometeur"];
        if([strb5 isEqualToString:strb2])
        {
            [self.bengn setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b3=@"YES";
        }
        else
        {
            self.b3=@"NO";
        }
        
        NSString *strb7=(self.retrievedarray)[0] [@"pont_roulant_potence"];
        if([strb7 isEqualToString:strb2])
        {
            [self.bpont setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b4=@"YES";
        }
        else
        {
            self.b4=@"NO";
        }
        
        NSString *strb9=(self.retrievedarray)[0] [@"accessoires_levage"];
        if([strb9 isEqualToString:strb2])
        {
            [self.bacces setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b5=@"YES";
        }
        else
        {
            self.b5=@"NO";
        }
        
        NSString *strb11=(self.retrievedarray)[0] [@"ver_controle_oui_1"];
        if([strb11 isEqualToString:strb2])
        {
            [self.blope1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b6=@"YES";
        }
        else
        {
            self.b6=@"NO";
        }
        
        NSString *strb13=(self.retrievedarray)[0] [@"ver_controle_non_1"];
        if([strb13 isEqualToString:strb2])
        {
            [self.blope2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b7=@"YES";
        }
        else
        {
            self.b7=@"NO";
        }
        
        NSString *strb15=(self.retrievedarray)[0] [@"ver_controle_oui_2"];
        if([strb15 isEqualToString:strb2])
        {
            [self.bleng1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b8=@"YES";
        }
        else
        {
            self.b8=@"NO";
        }
        
        NSString *strb17=(self.retrievedarray)[0] [@"ver_controle_non_2"];
        if([strb17 isEqualToString:strb2])
        {
            [self.bleng2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b9=@"YES";
        }
        else
        {
            self.b9=@"NO";
        }
        
        NSString *strb19=(self.retrievedarray)[0] [@"ver_controle_oui_3"];
        if([strb19 isEqualToString:strb2])
        {
            [self.bles1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b10=@"YES";
        }
        else
        {
            self.b10=@"NO";
        }
        
        NSString *strb21=(self.retrievedarray)[0] [@"ver_controle_non_3"];
        if([strb21 isEqualToString:strb2])
        {
            [self.bles2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b11=@"YES";
        }
        else
        {
            self.b11=@"NO";
        }
        
        NSString *strb23=(self.retrievedarray)[0] [@"ver_controle_oui_4"];
        if([strb23 isEqualToString:strb2])
        {
            [self.blengc1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b12=@"YES";
        }
        else
        {
            self.b12=@"NO";
        }
        
        NSString *strb25=(self.retrievedarray)[0] [@"ver_controle_non_4"];
        if([strb25 isEqualToString:strb2])
        {
            [self.blengc2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b13=@"YES";
        }
        else
        {
            self.b13=@"NO";
        }
        
        NSString *strb27=(self.retrievedarray)[0] [@"ver_controle_oui_5"];
        if([strb27 isEqualToString:strb2])
        {
            [self.blengt1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b14=@"YES";
        }
        else
        {
            self.b14=@"NO";
        }
        
        NSString *strb29=(self.retrievedarray)[0] [@"ver_controle_non_5"];
        if([strb29 isEqualToString:strb2])
        {
            [self.blengt2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b15=@"YES";
        }
        else
        {
            self.b15=@"NO";
        }
        
        NSString *strb31=(self.retrievedarray)[0] [@"examen_controle_oui1"];
        if([strb31 isEqualToString:strb2])
        {
            [self.badeq1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b16=@"YES";
        }
        else
        {
            self.b16=@"NO";
        }
        
        NSString *strb33=(self.retrievedarray)[0] [@"examen_controle_non1"];
        if([strb33 isEqualToString:strb2])
        {
            [self.badeq2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b17=@"YES";
        }
        else
        {
            self.b17=@"NO";
        }
        
        NSString *strb35=(self.retrievedarray)[0] [@"examen_controle_oui2"];
        if([strb35 isEqualToString:strb2])
        {
            [self.bprise1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b18=@"YES";
        }
        else
        {
            self.b18=@"NO";
        }
        
        NSString *strb37=(self.retrievedarray)[0] [@"examen_controle_non2"];
        if([strb37 isEqualToString:strb2])
        {
            [self.bprise2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b19=@"YES";
        }
        else
        {
            self.b19=@"NO";
        }
        
        NSString *strb39=(self.retrievedarray)[0] [@"examen_controle_oui3"];
        if([strb39 isEqualToString:strb2])
        {
            [self.bprisefos1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b20=@"YES";
        }
        else
        {
            self.b20=@"NO";
        }
        
        NSString *strb41=(self.retrievedarray)[0] [@"examen_controle_non3"];
        if([strb41 isEqualToString:strb2])
        {
            [self.bprisefos2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b21=@"YES";
        }
        else
        {
            self.b21=@"NO";
        }
        
        NSString *strb43=(self.retrievedarray)[0] [@"examen_controle_oui4"];
        if([strb43 isEqualToString:strb2])
        {
            [self.bprisepou1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b22=@"YES";
        }
        else
        {
            self.b22=@"NO";
        }
        
        NSString *strb45=(self.retrievedarray)[0] [@"examen_controle_non4"];
        if([strb45 isEqualToString:strb2])
        {
            [self.bprisepou2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b23=@"YES";
        }
        else
        {
            self.b23=@"NO";
        }
        
        NSString *strb47=(self.retrievedarray)[0] [@"examen_controle_oui5"];
        if([strb47 isEqualToString:strb2])
        {
            [self.bpriseora1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b24=@"YES";
        }
        else
        {
            self.b24=@"NO";
        }
        
        NSString *strb49=(self.retrievedarray)[0] [@"examen_controle_non5"];
        if([strb49 isEqualToString:strb2])
        {
            [self.bpriseora2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b25=@"YES";
        }
        else
        {
            self.b25=@"NO";
        }
        
        NSString *strb51=(self.retrievedarray)[0] [@"examen_controle_oui6"];
        if([strb51 isEqualToString:strb2])
        {
            [self.bzone1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b26=@"YES";
        }
        else
        {
            self.b26=@"NO";
        }
        
        NSString *strb53=(self.retrievedarray)[0] [@"examen_controle_non6"];
        if([strb53 isEqualToString:strb2])
        {
            [self.bzone2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b27=@"YES";
        }
        else
        {
            self.b27=@"NO";
        }
        
        // *************** For Signature
        
        NSString *datas1=(self.retrievedarray)[0][@"charge_de_travaux_signature"];
        NSData *data=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image=[[UIImage alloc]init];
        image=[UIImage imageWithData:data];
        [self.imgSign1 setImage:image];
        
        NSString *datas2=(self.retrievedarray)[0][@"levagiste_si_location_signature"];
        NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image1=[[UIImage alloc]init];
        image1=[UIImage imageWithData:data2];
        [self.imgSign2 setImage:image1];
    }
}

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
}

-(void)viewWillAppear:(BOOL)animated
{
    //savebut = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(redirect)] ;
    
    //BarButton
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(saveToDataBase:)] ;
    
    self.navigationItem.rightBarButtonItem = pdfButton ;
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,saveButton, nil];
    self.navigationItem.rightBarButtonItems = arry ;
}

-(void)viewDidAppear:(BOOL)animated
{
    self.charge_de_travaux.enabled=FALSE;
    self.proprietaire_du_materiel.enabled=FALSE;
    self.no_dossier.enabled=FALSE;
    self.adresse_du_chantier.editable=NO;
    
    self.identi_marque.enabled=FALSE;
    self.identi_type.enabled=FALSE;
    self.identi_no.enabled=FALSE;
    self.identi_n_serie.enabled=FALSE;
    self.identi_no_immatri_grue.enabled=FALSE;
    
    self.ver_controle_non_obs1.editable=NO;
    self.ver_controle_non_obs2.editable=NO;
    self.ver_controle_non_obs3.editable=NO;
    self.ver_controle_non_obs4.editable=NO;
    self.ver_controle_non_obs5.editable=NO;
    
    self.examen_poids_total.enabled=FALSE;
    self.examen_cmu.enabled=FALSE;
    self.examen_cmu_des_accessories.enabled=FALSE;
    
    self.examen_controle_obs1.editable=NO;
    self.examen_controle_obs2.editable=NO;
    self.examen_controle_obs3.editable=NO;
    self.examen_controle_obs4.editable=NO;
    self.examen_controle_obs5.editable=NO;
    self.examen_controle_obs6.editable=NO;
    
    self.charge_de_travaux_nom.enabled=FALSE;
    self.datf1.enabled=FALSE;
    self.levagiste_si_location_nom.enabled=FALSE;
    self.datf2.enabled=FALSE;
    
    //self.bgrue.userInteractionEnabled=FALSE;
    self.bpemp.userInteractionEnabled=FALSE;
    self.bengn.userInteractionEnabled=FALSE;
    self.bpont.userInteractionEnabled=FALSE;
    self.bacces.userInteractionEnabled=FALSE;
    
    self.blope1.userInteractionEnabled=FALSE;
    self.blope2.userInteractionEnabled=FALSE;
    self.bleng1.userInteractionEnabled=FALSE;
    self.bleng2.userInteractionEnabled=FALSE;
    self.bles1.userInteractionEnabled=FALSE;
    self.bles2.userInteractionEnabled=FALSE;
    self.blengc1.userInteractionEnabled=FALSE;
    self.blengc2.userInteractionEnabled=FALSE;
    self.blengt1.userInteractionEnabled=FALSE;
    self.blengt2.userInteractionEnabled=FALSE;
    
    self.badeq1.userInteractionEnabled=FALSE;
    self.badeq2.userInteractionEnabled=FALSE;
    self.bprise1.userInteractionEnabled=FALSE;
    self.bprise2.userInteractionEnabled=FALSE;
    self.bprisefos1.userInteractionEnabled=FALSE;
    self.bprisefos2.userInteractionEnabled=FALSE;
    self.bprisepou1.userInteractionEnabled=FALSE;
    self.bprisepou2.userInteractionEnabled=FALSE;
    self.bpriseora1.userInteractionEnabled=FALSE;
    self.bpriseora2.userInteractionEnabled=FALSE;
    self.bzone1.userInteractionEnabled=FALSE;
    self.bzone2.userInteractionEnabled=FALSE;
    
    self.editsig1.userInteractionEnabled=FALSE;
    self.editsig2.userInteractionEnabled=FALSE;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField==self.headtf)
    {
        self.editing=NO;
    }
    if (textField == self.datf1)
    {
        [self.view endEditing:YES];
        [self showDatePicker];
        return NO;
    }
    else if (textField == self.datf2)
    {
        [self.view endEditing:YES];
        [self showDatePicker1];
        return NO;
    }
    else if (textField==self.examen_poids_total)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-350;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textField==self.examen_cmu)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-350;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textField==self.examen_cmu_des_accessories)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-350;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textField==self.charge_de_travaux)
    {
        //        CGRect scrollViewFrame=scrollView.frame;
        //        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        //        scrollViewFrame.origin.y=bottomOffset.y;
        //        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textField==self.levagiste_si_location_nom)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    return YES;
}

-(void)showDatePicker
{
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.datf1 setInputView:datePicker];
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView *popoverView = [[UIView alloc] init];
    popoverView.backgroundColor = [UIColor clearColor];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    UIPopoverController *popoverController;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    popoverController.delegate=self;
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController presentPopoverFromRect:self.datf1.frame inView:self.view51 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.datf1.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.datf1.text = [NSString stringWithFormat:@"%@",dateString];
}

-(void)showDatePicker1
{
    UIDatePicker *datePicker1 = [[UIDatePicker alloc]init];
    [datePicker1 setDate:[NSDate date]];
    datePicker1.datePickerMode = UIDatePickerModeDate;
    [datePicker1 addTarget:self action:@selector(dateTextField1:) forControlEvents:UIControlEventValueChanged];
    [self.datf2 setInputView:datePicker1];
    UIViewController* popoverContent1 = [[UIViewController alloc] init];
    UIView *popoverView1 = [[UIView alloc] init];
    popoverView1.backgroundColor = [UIColor clearColor];
    [popoverView1 addSubview:datePicker1];
    popoverContent1.view = popoverView1;
    UIPopoverController *popoverController1;
    popoverController1 = [[UIPopoverController alloc] initWithContentViewController:popoverContent1];
    popoverController1.delegate=self;
    [popoverController1 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [popoverController1 presentPopoverFromRect:self.datf2.frame inView:self.view52 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField1:(id)sender
{
    UIDatePicker *picker1 = (UIDatePicker*)self.datf2.inputView;
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    NSDate *eventDate1 = picker1.date;
    [dateFormat1 setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString1 = [dateFormat1 stringFromDate:eventDate1];
    self.datf2.text = [NSString stringWithFormat:@"%@",dateString1];
}

- (IBAction)buttonclicked:(id)sender
{
    UIButton *but=(UIButton *)sender;
    if(but.tag==1)
    {
        if(self.bgrue.currentBackgroundImage==nil)
        {
            [self.bgrue setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b1=@"YES";
        }
        else if(self.bgrue.currentBackgroundImage!=nil)
        {
            [self.bgrue setBackgroundImage:nil forState:UIControlStateNormal];
            self.b1=@"NO";
            //[self.bgrue setBackgroundImage:[UIImage imageNamed:@"whitebg.gif"] forState:UIControlStateNormal];
        }
    }
    if(but.tag==2)
    {
        if(self.bpemp.currentBackgroundImage==nil)
        {
            [self.bpemp setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b2=@"YES";
        }
        else if(self.bpemp.currentBackgroundImage!=nil)
        {
            [self.bpemp setBackgroundImage:nil forState:UIControlStateNormal];
            self.b2=@"NO";
        }
    }
    if(but.tag==3)
    {
        if(self.bengn.currentBackgroundImage==nil)
        {
            [self.bengn setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b3=@"YES";
        }
        else if(self.bengn.currentBackgroundImage!=nil)
        {
            [self.bengn setBackgroundImage:nil forState:UIControlStateNormal];
            self.b3=@"NO";
        }
    }
    
    if(but.tag==4)
    {
        if(self.bpont.currentBackgroundImage==nil)
        {
            [self.bpont setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b4=@"YES";
        }
        else if(self.bpont.currentBackgroundImage!=nil)
        {
            [self.bpont setBackgroundImage:nil forState:UIControlStateNormal];
            self.b4=@"NO";
        }
    }
    
    if(but.tag==5)
    {
        if(self.bacces.currentBackgroundImage==nil)
        {
            [self.bacces setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b5=@"YES";
        }
        else if(self.bacces.currentBackgroundImage!=nil)
        {
            [self.bacces setBackgroundImage:nil forState:UIControlStateNormal];
            self.b5=@"NO";
        }
    }
    
    if(but.tag==6)
    {
        
        
        if(self.blope1.currentBackgroundImage==nil)
        {
            [self.blope1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b6=@"YES";
            
            [self.blope2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b7=@"NO";
            
        }
        else if(self.blope1.currentBackgroundImage!=nil)
        {
            [self.blope1 setBackgroundImage:nil forState:UIControlStateNormal];
            
            self.b6=@"NO";
        }
    }
    
    if(but.tag==7)
    {
        
        
        if(self.blope2.currentBackgroundImage==nil)
        {
            [self.blope2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b7=@"YES";
            
            [self.blope1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b6=@"NO";
            
            
        }
        else if(self.blope2.currentBackgroundImage!=nil)
        {
            [self.blope2 setBackgroundImage:nil forState:UIControlStateNormal];
            
            self.b7=@"NO";
        }
    }
    
    if(but.tag==8)
    {
        //[self.bleng2 setBackgroundImage:nil forState:UIControlStateNormal];
        
        if(self.bleng1.currentBackgroundImage==nil)
        {
            [self.bleng1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b8=@"YES";
            [self.bleng2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b9=@"NO";
        }
        else if(self.bleng1.currentBackgroundImage!=nil)
        {
            [self.bleng1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b8=@"NO";
        }
    }
    if(but.tag==9)
    {
        //[self.bleng1 setBackgroundImage:nil forState:UIControlStateNormal];
        
        if(self.bleng2.currentBackgroundImage==nil)
        {
            [self.bleng2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b9=@"YES";
            [self.bleng1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b8=@"NO";
        }
        else if(self.bleng2.currentBackgroundImage!=nil)
        {
            [self.bleng2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b9=@"NO";
        }
    }
    
    if(but.tag==10)
    {
        
        
        if(self.bles1.currentBackgroundImage==nil)
        {
            [self.bles1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b10=@"YES";
            [self.bles2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b11=@"NO";
        }
        else if(self.bles1.currentBackgroundImage!=nil)
        {
            [self.bles1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b10=@"NO";
        }
    }
    
    if(but.tag==11)
    {
        
        
        if(self.bles2.currentBackgroundImage==nil)
        {
            [self.bles2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b11=@"YES";
            [self.bles1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b10=@"NO";
        }
        else if(self.bles2.currentBackgroundImage!=nil)
        {
            [self.bles2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b11=@"NO";
        }
    }
    
    if(but.tag==12)
    {
        
        
        if(self.blengc1.currentBackgroundImage==nil)
        {
            [self.blengc1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b12=@"YES";
            [self.blengc2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b13=@"NO";
        }
        else if(self.blengc1.currentBackgroundImage!=nil)
        {
            [self.blengc1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b12=@"NO";
        }
    }
    
    if(but.tag==13)
    {
        
        
        if(self.blengc2.currentBackgroundImage==nil)
        {
            [self.blengc2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b13=@"YES";
            [self.blengc1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b12=@"NO";
            
        }
        else if(self.blengc2.currentBackgroundImage!=nil)
        {
            [self.blengc2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b13=@"NO";
        }
    }
    
    if(but.tag==14)
    {
        
        if(self.blengt1.currentBackgroundImage==nil)
        {
            [self.blengt1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b14=@"YES";
            [self.blengt2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b15=@"NO";
        }
        else if(self.blengt1.currentBackgroundImage!=nil)
        {
            [self.blengt1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b14=@"NO";
        }
    }
    
    if(but.tag==15)
    {
        
        if(self.blengt2.currentBackgroundImage==nil)
        {
            [self.blengt2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b15=@"YES";
            [self.blengt1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b14=@"NO";
        }
        else if(self.blengt2.currentBackgroundImage!=nil)
        {
            [self.blengt2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b15=@"NO";
        }
    }
    
    if(but.tag==16)
    {
        
        if(self.badeq1.currentBackgroundImage==nil)
        {
            [self.badeq1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b16=@"YES";
            [self.badeq2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b17=@"NO";
        }
        else if(self.badeq1.currentBackgroundImage!=nil)
        {
            [self.badeq1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b16=@"NO";
        }
    }
    
    if(but.tag==17)
    {
        
        if(self.badeq2.currentBackgroundImage==nil)
        {
            [self.badeq2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b17=@"YES";
            [self.badeq1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b16=@"NO";
            
        }
        else if(self.badeq2.currentBackgroundImage!=nil)
        {
            [self.badeq2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b17=@"NO";
        }
    }
    
    if(but.tag==18)
    {
        
        if(self.bprise1.currentBackgroundImage==nil)
        {
            [self.bprise1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b18=@"YES";
            [self.bprise2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b19=@"NO";
            
        }
        else if(self.bprise1.currentBackgroundImage!=nil)
        {
            [self.bprise1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b18=@"NO";
        }
    }
    
    if(but.tag==19)
    {
        
        if(self.bprise2.currentBackgroundImage==nil)
        {
            [self.bprise2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b19=@"YES";
            [self.bprise1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b18=@"NO";
        }
        else if(self.bprise2.currentBackgroundImage!=nil)
        {
            [self.bprise2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b19=@"NO";
        }
    }
    
    if(but.tag==20)
    {
        
        if(self.bprisefos1.currentBackgroundImage==nil)
        {
            [self.bprisefos1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b20=@"YES";
            [self.bprisefos2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b21=@"NO";
        }
        else if(self.bprisefos1.currentBackgroundImage!=nil)
        {
            [self.bprisefos1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b20=@"NO";
        }
    }
    
    if(but.tag==21)
    {
        
        if(self.bprisefos2.currentBackgroundImage==nil)
        {
            [self.bprisefos2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b21=@"YES";
            [self.bprisefos1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b20=@"NO";
        }
        else if(self.bprisefos2.currentBackgroundImage!=nil)
        {
            [self.bprisefos2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b21=@"NO";
        }
    }
    
    if(but.tag==22)
    {
        
        if(self.bprisepou1.currentBackgroundImage==nil)
        {
            [self.bprisepou1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b22=@"YES";
            [self.bprisepou2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b23=@"NO";
        }
        else if(self.bprisepou1.currentBackgroundImage!=nil)
        {
            [self.bprisepou1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b22=@"NO";
        }
    }
    
    if(but.tag==23)
    {
        
        if(self.bprisepou2.currentBackgroundImage==nil)
        {
            [self.bprisepou2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b23=@"YES";
            [self.bprisepou1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b22=@"NO";
        }
        else if(self.bprisepou2.currentBackgroundImage!=nil)
        {
            [self.bprisepou2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b23=@"NO";
        }
    }
    
    if(but.tag==24)
    {
        
        if(self.bpriseora1.currentBackgroundImage==nil)
        {
            [self.bpriseora1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b24=@"YES";
            [self.bpriseora2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b25=@"NO";
            
        }
        else if(self.bpriseora1.currentBackgroundImage!=nil)
        {
            [self.bpriseora1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b24=@"NO";
        }
    }
    
    if(but.tag==25)
    {
        
        if(self.bpriseora2.currentBackgroundImage==nil)
        {
            [self.bpriseora2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b25=@"YES";
            [self.bpriseora1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b24=@"NO";
        }
        else if(self.bpriseora2.currentBackgroundImage!=nil)
        {
            [self.bpriseora2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b25=@"NO";
        }
    }
    
    if(but.tag==26)
    {
        
        if(self.bzone1.currentBackgroundImage==nil)
        {
            [self.bzone1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b26=@"YES";
            [self.bzone2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b27=@"NO";
        }
        else if(self.bzone1.currentBackgroundImage!=nil)
        {
            [self.bzone1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b26=@"NO";
        }
    }
    
    if(but.tag==27)
    {
        
        if(self.bzone2.currentBackgroundImage==nil)
        {
            [self.bzone2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b27=@"YES";
            [self.bzone1 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b26=@"NO";
        }
        else if(self.bzone2.currentBackgroundImage!=nil)
        {
            [self.bzone2 setBackgroundImage:nil forState:UIControlStateNormal];
            self.b27=@"NO";
        }
    }
    
    
}

#pragma mark - UITextviewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView==self.ver_controle_non_obs1) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-900;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.ver_controle_non_obs2) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-850;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.ver_controle_non_obs3) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-850;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.ver_controle_non_obs4) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-700;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.ver_controle_non_obs5) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-650;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.examen_controle_obs1) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-300;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.examen_controle_obs2) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-300;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.examen_controle_obs3) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-300;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.examen_controle_obs4) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-300;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.examen_controle_obs5) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-250;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textView==self.examen_controle_obs6) {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-100;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    
}


#pragma mark - Saving to Database


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
    NSString * str_img1 = [ self encodeToBase64String:self.imgSign1.image] ;
    NSString * str_img2 = [ self encodeToBase64String:self.imgSign2.image] ;
    NSDateFormatter *forma=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [ forma setDateFormat:@"dd-MM-YYYY"] ;
    NSString *datestring12 = [forma stringFromDate:now];
    
    if (self.IsForUpdating==YES )
    {
        if (self.retrievedarray!=nil)
        {
            NSLog(@"retrive:%@",self.retrievedarray);
            NSLog(@"retrive:%@",(self.retrievedarray)[0][@"adequacy_id"]);
            NSString *str=(self.retrievedarray)[0][@"adequacy_id"];
            nnn=[str intValue];
        }
        else
        {
            NSString * str_GetCount = @"SELECT adequacy_id FROM adequacy_conservation" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            nnn =  CurrentCount;
        }
        
        [ self openPerPagePDF] ;
        str_DocumentName = [str_DocumentName stringByReplacingOccurrencesOfString:@"'"
                                                                       withString:@"''"];
        NSString *updateSQL = [NSString stringWithFormat:
                               @"update adequacy_conservation set grue='%@',pemp_nacelle='%@',engin_autometeur='%@',pont_roulant_potence='%@',accessoires_levage='%@',charge_de_travaux='%@',proprietaire_du_materiel='%@',no_dossier='%@',adresse_du_chantier='%@',identi_marque='%@',identi_type='%@',identi_no='%@',identi_n_serie='%@',identi_no_immatri_grue='%@',ver_controle_oui_1='%@',ver_controle_non_1='%@',ver_controle_oui_2='%@',ver_controle_non_2='%@',ver_controle_oui_3='%@',ver_controle_non_3='%@',ver_controle_oui_4='%@',ver_controle_non_4='%@',ver_controle_oui_5='%@',ver_controle_non_5='%@',ver_controle_non_obs1='%@',ver_controle_non_obs2='%@',ver_controle_non_obs3='%@',ver_controle_non_obs4='%@',ver_controle_non_obs5='%@',examen_poids_total='%@',examen_cmu='%@',examen_cmu_des_accessories='%@',examen_controle_oui1='%@',examen_controle_non1='%@',examen_controle_oui2='%@',examen_controle_non2='%@',examen_controle_oui3='%@',examen_controle_non3='%@',examen_controle_oui4='%@',examen_controle_non4='%@',examen_controle_oui5='%@',examen_controle_non5='%@',examen_controle_oui6='%@',examen_controle_non6='%@',examen_controle_obs1='%@',examen_controle_obs2='%@',examen_controle_obs3='%@',examen_controle_obs4='%@',examen_controle_obs5='%@',examen_controle_obs6='%@',charge_de_travaux_nom='%@',charge_de_travaux_date='%@',charge_de_travaux_signature='%@',levagiste_si_location_nom='%@',levagiste_si_location_date='%@',levagiste_si_location_signature='%@',doc_modified_date='%@',doc_name='%@' where adequacy_id='%ld'", self.b1, self.b2, self.b3, self.b4, self.b5, self.charge_de_travaux.text, self.proprietaire_du_materiel.text, self.no_dossier.text, self.adresse_du_chantier.text, self.identi_marque.text, self.identi_type.text, self.identi_no.text, self.identi_n_serie.text, self.identi_no_immatri_grue.text, self.b6, self.b7, self.b8, self.b9, self.b10, self.b11, self.b12, self.b13, self.b14, self.b15, self.ver_controle_non_obs1.text, self.ver_controle_non_obs2.text, self.ver_controle_non_obs3.text, self.ver_controle_non_obs4.text, self.ver_controle_non_obs5.text, self.examen_poids_total.text, self.examen_cmu.text, self.examen_cmu_des_accessories.text, self.b16, self.b17, self.b18, self.b19, self.b20, self.b21, self.b22, self.b23, self.b24, self.b25, self.b26, self.b27, self.examen_controle_obs1.text, self.examen_controle_obs2.text, self.examen_controle_obs3.text, self.examen_controle_obs4.text, self.examen_controle_obs5.text, self.examen_controle_obs6.text, self.charge_de_travaux_nom.text, self.datf1.text,str_img1, self.levagiste_si_location_nom.text, self.datf2.text, str_img2,datestring12,str_DocumentName, (long)nnn];
        [[ DBSqlite dbManager] updateStatement:updateSQL];
    }
    else
    {
        if (saved_Into_DB==NO)
        {
            [ self openPerPagePDF] ;
            NSString * str_GetCount = @"SELECT adequacy_id FROM adequacy_conservation";
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSString * str_img1 = [ self encodeToBase64String:self.imgSign1.image] ;
            NSString * str_img2 = [ self encodeToBase64String:self.imgSign2.image] ;
            
            NSString *strQuery = [NSString stringWithFormat:@"insert into adequacy_conservation(grue,pemp_nacelle,engin_autometeur,pont_roulant_potence,accessoires_levage,charge_de_travaux,proprietaire_du_materiel,no_dossier,adresse_du_chantier,identi_marque,identi_type,identi_no,identi_n_serie,identi_no_immatri_grue,ver_controle_oui_1,ver_controle_non_1,ver_controle_oui_2,ver_controle_non_2,ver_controle_oui_3,ver_controle_non_3,ver_controle_oui_4,ver_controle_non_4,ver_controle_oui_5,ver_controle_non_5,ver_controle_non_obs1,ver_controle_non_obs2,ver_controle_non_obs3,ver_controle_non_obs4,ver_controle_non_obs5,examen_poids_total,examen_cmu,examen_cmu_des_accessories,examen_controle_oui1,examen_controle_non1,examen_controle_oui2,examen_controle_non2,examen_controle_oui3,examen_controle_non3,examen_controle_oui4,examen_controle_non4,examen_controle_oui5,examen_controle_non5,examen_controle_oui6,examen_controle_non6,examen_controle_obs1,examen_controle_obs2,examen_controle_obs3,examen_controle_obs4,examen_controle_obs5,examen_controle_obs6,charge_de_travaux_nom,charge_de_travaux_date,charge_de_travaux_signature,levagiste_si_location_nom,levagiste_si_location_date,levagiste_si_location_signature,adequacy_id,doc_name,doc_created_date,doc_modified_date) values (\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%d\",\"%@\", \"%@\", \"%@\")",self.b1, self.b2, self.b3, self.b4, self.b5, self.charge_de_travaux.text, self.proprietaire_du_materiel.text, self.no_dossier.text, self.adresse_du_chantier.text, self.identi_marque.text, self.identi_type.text, self.identi_no.text, self.identi_n_serie.text, self.identi_no_immatri_grue.text, self.b6, self.b7, self.b8, self.b9, self.b10, self.b11, self.b12, self.b13, self.b14, self.b15, self.ver_controle_non_obs1.text, self.ver_controle_non_obs2.text, self.ver_controle_non_obs3.text, self.ver_controle_non_obs4.text, self.ver_controle_non_obs5.text, self.examen_poids_total.text, self.examen_cmu.text, self.examen_cmu_des_accessories.text, self.b16, self.b17, self.b18, self.b19, self.b20, self.b21, self.b22, self.b23, self.b24, self.b25, self.b26, self.b27, self.examen_controle_obs1.text, self.examen_controle_obs2.text, self.examen_controle_obs3.text, self.examen_controle_obs4.text, self.examen_controle_obs5.text, self.examen_controle_obs6.text, self.charge_de_travaux_nom.text, self.datf1.text,str_img1, self.levagiste_si_location_nom.text, self.datf2.text, str_img2, ++CurrentCount,str_DocumentName, str_CreatedDate, str_CreatedDate];
            
            [[DBSqlite dbManager]insertStatement:strQuery];
            
            saved_Into_DB=YES;
            self.IsForUpdating=YES;
        }
        else if(saved_Into_DB==YES)
        {
            [ self openPerPagePDF] ;
            NSString * str_GetCount = @"SELECT adequacy_id FROM adequacy_conservation" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSLog(@"Correct way!!!!!!!!!!!!!!!!");
            NSString *updateSQL = [NSString stringWithFormat:
                                   @"update adequacy_conservation set grue='%@',pemp_nacelle='%@',engin_autometeur='%@',pont_roulant_potence='%@',accessoires_levage='%@',charge_de_travaux='%@',proprietaire_du_materiel='%@',no_dossier='%@',adresse_du_chantier='%@',identi_marque='%@',identi_type='%@',identi_no='%@',identi_n_serie='%@',identi_no_immatri_grue='%@',ver_controle_oui_1='%@',ver_controle_non_1='%@',ver_controle_oui_2='%@',ver_controle_non_2='%@',ver_controle_oui_3='%@',ver_controle_non_3='%@',ver_controle_oui_4='%@',ver_controle_non_4='%@',ver_controle_oui_5='%@',ver_controle_non_5='%@',ver_controle_non_obs1='%@',ver_controle_non_obs2='%@',ver_controle_non_obs3='%@',ver_controle_non_obs4='%@',ver_controle_non_obs5='%@',examen_poids_total='%@',examen_cmu='%@',examen_cmu_des_accessories='%@',examen_controle_oui1='%@',examen_controle_non1='%@',examen_controle_oui2='%@',examen_controle_non2='%@',examen_controle_oui3='%@',examen_controle_non3='%@',examen_controle_oui4='%@',examen_controle_non4='%@',examen_controle_oui5='%@',examen_controle_non5='%@',examen_controle_oui6='%@',examen_controle_non6='%@',examen_controle_obs1='%@',examen_controle_obs2='%@',examen_controle_obs3='%@',examen_controle_obs4='%@',examen_controle_obs5='%@',examen_controle_obs6='%@',charge_de_travaux_nom='%@',charge_de_travaux_date='%@',charge_de_travaux_signature='%@',levagiste_si_location_nom='%@',levagiste_si_location_date='%@',levagiste_si_location_signature='%@',doc_modified_date='%@' where adequacy_id='%d'", self.b1, self.b2, self.b3, self.b4, self.b5, self.charge_de_travaux.text, self.proprietaire_du_materiel.text, self.no_dossier.text, self.adresse_du_chantier.text, self.identi_marque.text, self.identi_type.text, self.identi_no.text, self.identi_n_serie.text, self.identi_no_immatri_grue.text, self.b6, self.b7, self.b8, self.b9, self.b10, self.b11, self.b12, self.b13, self.b14, self.b15, self.ver_controle_non_obs1.text, self.ver_controle_non_obs2.text, self.ver_controle_non_obs3.text, self.ver_controle_non_obs4.text, self.ver_controle_non_obs5.text, self.examen_poids_total.text, self.examen_cmu.text, self.examen_cmu_des_accessories.text, self.b16, self.b17, self.b18, self.b19, self.b20, self.b21, self.b22, self.b23, self.b24, self.b25, self.b26, self.b27, self.examen_controle_obs1.text, self.examen_controle_obs2.text, self.examen_controle_obs3.text, self.examen_controle_obs4.text, self.examen_controle_obs5.text, self.examen_controle_obs6.text, self.charge_de_travaux_nom.text, self.datf1.text,str_img1, self.levagiste_si_location_nom.text, self.datf2.text, str_img2,datestring12, CurrentCount];
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

#pragma mark - PDF Creation

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
    
    str_DocumentName = [NSString stringWithFormat:@"DAR Examen d'adéquation et de conservation_%@.pdf", datestring1]  ;
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

#pragma mark Signature delegate

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
    else
    {
        
    }
    imageView.image=image;
}


@end
