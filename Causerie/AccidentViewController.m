//
//  AccidentViewController.m
//  Digitram
//
//  Created by Ravi on 26/05/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import "AccidentViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ScrollViewToPDF.h"
#import "CauzQSSE_ViewController.h"
#import <MessageUI/MessageUI.h>
#import "SignaVC.h"

@interface AccidentViewController ()<UIPopoverControllerDelegate, MFMailComposeViewControllerDelegate, SignaVCDelegate>

@end

@implementation AccidentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    
    str_DocumentName = @"QE7230TR Compte-rendu d'accident à chaud" ;
    self.title = @"Print Preview";
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // Created and modified date as of now
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;
    
    //BarButton
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(saveToDataBase:)] ;
    self.navigationItem.rightBarButtonItem = pdfButton ;
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,saveButton, nil];
    self.navigationItem.rightBarButtonItems = arry ;
    
    
    if (self.IsForUpdating==NO )
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
    }
    sig1clicked=NO;
    sig2clicked=NO;
    saved_Into_DB=NO;
    
    if(self.confirmpdf==YES)
    {
        self.empl.text=self.dataarray[2];
        self.emp_n_rue_bp.text=self.dataarray[3];
        self.emp_code_postal.text=self.dataarray[4];
        self.emp_commune.text=self.dataarray[5];
        
        self.accid.text=self.dataarray[6];
        self.acc_fonction.text=self.dataarray[7];
        self.acc_anciennete_au_poste.text=self.dataarray[8];
        self.acc_qualification.text=self.dataarray[9];
        
        self.acc_jour_de_laccident.text=self.dataarray[13];
        self.dateacctf.text=self.dataarray[14];
        
        self.accident_excercait_elle.text=self.dataarray[21];
        self.lieu_n_rue_bp.text=self.dataarray[22];
        self.lieu_code_postal=self.dataarray[23];
        self.lieu_commune.text=self.dataarray[24];
        
        self.temoin_immediat.text=self.dataarray[25];
        self.premiere_prosonne_ayent.text=self.dataarray[26];
        self.textview1.text=self.dataarray[27];
        self.siege_des_lesions.text=self.dataarray[28];
        self.nature_des_lesions.text=self.dataarray[29];
        self.textview2.text=self.dataarray[30];
        self.textview3.text=self.dataarray[31];
        self.textview4.text=self.dataarray[32];
        
        self.donnes_le_date.text=self.dataarray[33];
        self.premiers_N_rue_bp.text=self.dataarray[37];
        self.premiers_code_postal.text=self.dataarray[38];
        self.premiers_commune.text=self.dataarray[39];
        
        self.donnees_si_non_preciser.text=self.dataarray[42];
        self.premiers_excercait_elle.text=self.dataarray[45];
        self.donnees_concernant_mesure.text=self.dataarray[46];
        self.vswtf.text=self.dataarray[48];
        self.daystf.text=self.dataarray[49];
        self.textview5.text=self.dataarray[52];
        
        self.declarant_name.text=self.dataarray[53];
        self.declarant_a.text=self.dataarray[54];
        self.decdatetf.text=self.dataarray[55];
        self.information_du_chsct.text=self.dataarray[56];
        self.infdatetf.text=self.dataarray[57];
        self.annee.text=self.dataarray[58];
        self.classement_no.text=self.dataarray[59];
        self.pris_no.text=self.dataarray[60];
        self.pris_a.text=self.dataarray[61];
        self.prisdatetf.text=self.dataarray[62];
        self.txt_consequences.text=self.dataarray[63];
        
        
        NSString *strb1=self.dataarray[0];
        NSString *strb2=@"YES";
        if([strb1 isEqualToString:strb2])
        {
            [self.badt setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b1=@"YES";
        }
        else
        {
            self.b1=@"NO";
        }
        
        NSString *strb11=self.dataarray[1];
        if([strb11 isEqualToString:strb2])
        {
            [self.baslc setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b2=@"YES";
        }
        else
        {
            self.b2=@"NO";
        }
        
        NSString *strb21=self.dataarray[10];
        if([strb21 isEqualToString:strb2])
        {
            [self.btb setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b3=@"YES";
        }
        else
        {
            self.b3=@"NO";
        }
        
        NSString *strb31=self.dataarray[11];
        if([strb31 isEqualToString:strb2])
        {
            [self.bb setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b4=@"YES";
        }
        else
        {
            self.b4=@"NO";
        }
        
        NSString *strb41=self.dataarray[12];
        if([strb41 isEqualToString:strb2])
        {
            [self.bm setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b5=@"YES";
        }
        else
        {
            self.b5=@"NO";
        }
        
        NSString *strb43=self.dataarray[15];
        if([strb43 isEqualToString:strb2])
        {
            [self.blhc setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b6=@"YES";
        }
        else
        {
            self.b6=@"NO";
        }
        
        NSString *strb45=self.dataarray[16];
        if([strb45 isEqualToString:strb2])
        {
            [self.bbu setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b7=@"YES";
        }
        else
        {
            self.b7=@"NO";
        }
        
        NSString *strb47=self.dataarray[17];
        if([strb47 isEqualToString:strb2])
        {
            [self.bat setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b8=@"YES";
        }
        else
        {
            self.b8=@"NO";
        }
        
        NSString *strb49=self.dataarray[18];
        if([strb49 isEqualToString:strb2])
        {
            [self.bocc setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b9=@"YES";
        }
        else
        {
            self.b9=@"NO";
        }
        
        NSString *strb51=self.dataarray[19];
        if([strb51 isEqualToString:strb2])
        {
            [self.bou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b10=@"YES";
        }
        else
        {
            self.b10=@"NO";
        }
        
        NSString *strb53=self.dataarray[20];
        if([strb53 isEqualToString:strb2])
        {
            [self.bnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b11=@"YES";
        }
        else
        {
            self.b11=@"NO";
        }
        
        NSString *strb55=self.dataarray[34];
        if([strb55 isEqualToString:strb2])
        {
            [self.bparsst setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b12=@"YES";
        }
        else
        {
            self.b12=@"NO";
        }
        
        NSString *strb57=self.dataarray[35];
        if([strb57 isEqualToString:strb2])
        {
            [self.bmede setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b13=@"YES";
        }
        else
        {
            self.b13=@"NO";
        }
        
        NSString *strb59=self.dataarray[36];
        if([strb59 isEqualToString:strb2])
        {
            [self.bets setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b14=@"YES";
        }
        else
        {
            self.b14=@"NO";
        }
        
        NSString *strb61=self.dataarray[40];
        if([strb61 isEqualToString:strb2])
        {
            [self.bdou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b15=@"YES";
        }
        else
        {
            self.b15=@"NO";
        }
        
        NSString *strb63=self.dataarray[41];
        if([strb63 isEqualToString:strb2])
        {
            [self.bdnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b16=@"YES";
        }
        else
        {
            self.b16=@"NO";
        }
        
        NSString *strb65=self.dataarray[43];
        if([strb65 isEqualToString:strb2])
        {
            [self.bfou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b17=@"YES";
        }
        else
        {
            self.b17=@"NO";
        }
        
        NSString *strb67=self.dataarray[44];
        if([strb67 isEqualToString:strb2])
        {
            [self.bfnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b18=@"YES";
        }
        else
        {
            self.b18=@"NO";
        }
        
        NSString *strb69=self.dataarray[47];
        if([strb69 isEqualToString:strb2])
        {
            [self.blavictra setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b19=@"YES";
        }
        else
        {
            self.b19=@"NO";
        }
        
        NSString *strb71=self.dataarray[50];
        if([strb71 isEqualToString:strb2])
        {
            [self.baffou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b20=@"YES";
        }
        else
        {
            self.b20=@"NO";
        }
        
        NSString *strb73=self.dataarray[51];
        if([strb73 isEqualToString:strb2])
        {
            [self.baffnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b21=@"YES";
        }
        else
        {
            self.b21=@"NO";
        }
        
        if (self.imagearray.count!=0)
        {
            NSString *datas1=self.imagearray[0];
            NSData *data=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image=[[UIImage alloc]init];
            image=[UIImage imageWithData:data];
            [self.img_Signature1 setImage:image];
        }
        if (self.imagearray1.count!=0)
        {
            NSString *datas2=self.imagearray1[0];
            NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image1=[[UIImage alloc]init];
            image1=[UIImage imageWithData:data2];
            [self.img_Signature2 setImage:image1];
        }
    }
    
        // Do any additional setup after loading the view.
    
    [scrollView setContentSize:(CGSizeMake(768, 3750))];
    
    self.doc_name.layer.borderColor=[[UIColor colorWithRed:0/255.00f green:149/255.00f blue:48/255.00f alpha:1.0f]CGColor];
    self.doc_name.layer.borderWidth=2.0;
    self.doc_name.layer.cornerRadius=5;
    self.doc_name.clipsToBounds=YES;
    self.doc_name.enabled=NO;
    
    self.badt.layer.borderWidth=1.0;
    self.badt.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.baslc.layer.borderWidth=1.0;
    self.baslc.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.employeurview.layer setBorderWidth:1.0];
    self.employeurview.layer.borderColor=[[UIColor colorWithRed:0/255.00f green:149/255.00f blue:48/255.00f alpha:1.0f]CGColor];
    
    [self.accidenteview.layer setBorderWidth:1.0];
    self.accidenteview.layer.borderColor=[[UIColor colorWithRed:0/255.00f green:149/255.00f blue:48/255.00f alpha:1.0f]CGColor];
    
    [self.img1view.layer setBorderWidth:1.0];
    [self.img2view.layer setBorderWidth:1.0];
    
    self.btb.layer.borderWidth=1.0;
    self.btb.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bb.layer.borderWidth=1.0;
    self.bb.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bm.layer.borderWidth=1.0;
    self.bm.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.accidentview.layer setBorderWidth:1.0];
    self.accidentview.layer.borderColor=[[UIColor colorWithRed:0/255.00f green:149/255.00f blue:48/255.00f alpha:1.0f]CGColor];
    
    self.blhc.layer.borderWidth=1.0;
    self.blhc.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bbu.layer.borderWidth=1.0;
    self.bbu.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bat.layer.borderWidth=1.0;
    self.bat.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bocc.layer.borderWidth=1.0;
    self.bocc.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bou.layer.borderWidth=1.0;
    self.bou.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bnon.layer.borderWidth=1.0;
    self.bnon.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.circonstancesview.layer setBorderWidth:1.0];
    self.circonstancesview.layer.borderColor=[[UIColor colorWithRed:0/255.00f green:149/255.00f blue:48/255.00f alpha:1.0f]CGColor];
    
    [self.textview1.layer setBorderWidth:1.0];
    self.textview1.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.textview2.layer setBorderWidth:1.0];
    self.textview2.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.textview3.layer setBorderWidth:1.0];
    self.textview3.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.textview4.layer setBorderWidth:1.0];
    self.textview4.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.premiersoinsview.layer setBorderWidth:1.0];
    self.premiersoinsview.layer.borderColor=[[UIColor colorWithRed:0/255.00f green:149/255.00f blue:48/255.00f alpha:1.0f]CGColor];
    
    self.bparsst.layer.borderWidth=1.0;
    self.bparsst.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bmede.layer.borderWidth=1.0;
    self.bmede.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bets.layer.borderWidth=1.0;
    self.bets.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bdou.layer.borderWidth=1.0;
    self.bdou.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bdnon.layer.borderWidth=1.0;
    self.bdnon.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bfou.layer.borderWidth=1.0;
    self.bfou.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.bfnon.layer.borderWidth=1.0;
    self.bfnon.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.consequencesview.layer setBorderWidth:1.0];
    self.consequencesview.layer.borderColor=[[UIColor colorWithRed:0/255.00f green:149/255.00f blue:48/255.00f alpha:1.0f]CGColor];
    
    [self.blavictra.layer setBorderWidth:1.0];
    self.blavictra.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.blavicint.layer setBorderWidth:1.0];
    self.blavicint.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.baffou.layer setBorderWidth:1.0];
    self.baffou.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.baffnon.layer setBorderWidth:1.0];
    self.baffnon.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.textview5.layer setBorderWidth:1.0];
    self.textview5.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.lineview1.layer setBorderWidth:1.0];
    self.lineview1.layer.borderColor=[[UIColor blackColor]CGColor];
    
    [self.lineview2.layer setBorderWidth:1.0];
    self.lineview2.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.img_Signature1.layer.borderWidth=1.0;
    self.img_Signature2.layer.borderWidth=1.0;
    
//    if (self.IsForUpdating==YES)
//    {
//        // ****************For Button
//        
//        NSString *strb1=(self.retrievedarray)[0] [@"accident_de_travail"];
//        NSString *strb2=@"YES";
//        if([strb1 isEqualToString:strb2])
//        {
//            [self.badt setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b1=@"YES";
//        }
//        else
//        {
//            self.b1=@"NO";
//        }
//        
//        NSString *strb11=(self.retrievedarray)[0] [@"accident_sur_le_travail"];
//        if([strb11 isEqualToString:strb2])
//        {
//            [self.baslc setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b2=@"YES";
//        }
//        else
//        {
//            self.b2=@"NO";
//        }
//        
//        NSString *strb21=(self.retrievedarray)[0] [@"acc_con_du_poste_tb"];
//        if([strb21 isEqualToString:strb2])
//        {
//            [self.btb setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b3=@"YES";
//        }
//        else
//        {
//            self.b3=@"NO";
//        }
//        
//        NSString *strb31=(self.retrievedarray)[0] [@"acc_con_du_poste_b"];
//        if([strb31 isEqualToString:strb2])
//        {
//            [self.bb setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b4=@"YES";
//        }
//        else
//        {
//            self.b4=@"NO";
//        }
//        
//        NSString *strb41=(self.retrievedarray)[0] [@"acc_con_du_poste_m"];
//        if([strb41 isEqualToString:strb2])
//        {
//            [self.bm setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b5=@"YES";
//        }
//        else
//        {
//            self.b5=@"NO";
//        }
//        
//        NSString *strb43=(self.retrievedarray)[0] [@"lieu_habituel_chantier"];
//        if([strb43 isEqualToString:strb2])
//        {
//            [self.blhc setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b6=@"YES";
//        }
//        else
//        {
//            self.b6=@"NO";
//        }
//        
//        NSString *strb45=(self.retrievedarray)[0] [@"bureau"];
//        if([strb45 isEqualToString:strb2])
//        {
//            [self.bbu setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b7=@"YES";
//        }
//        else
//        {
//            self.b7=@"NO";
//        }
//        
//        NSString *strb47=(self.retrievedarray)[0] [@"atelier"];
//        if([strb47 isEqualToString:strb2])
//        {
//            [self.bat setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b8=@"YES";
//        }
//        else
//        {
//            self.b8=@"NO";
//        }
//        
//        NSString *strb49=(self.retrievedarray)[0] [@"occasionel"];
//        if([strb49 isEqualToString:strb2])
//        {
//            [self.bocc setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b9=@"YES";
//        }
//        else
//        {
//            self.b9=@"NO";
//        }
//        
//        NSString *strb51=(self.retrievedarray)[0] [@"au_moment_de_habituelle_oui"];
//        if([strb51 isEqualToString:strb2])
//        {
//            [self.bou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b10=@"YES";
//        }
//        else
//        {
//            self.b10=@"NO";
//        }
//        
//        NSString *strb53=(self.retrievedarray)[0] [@"au_moment_de_habituelle_non"];
//        if([strb53 isEqualToString:strb2])
//        {
//            [self.bnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b11=@"YES";
//        }
//        else
//        {
//            self.b11=@"NO";
//        }
//        
//        NSString *strb55=(self.retrievedarray)[0] [@"donnesle_par_sst"];
//        if([strb55 isEqualToString:strb2])
//        {
//            [self.bparsst setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b12=@"YES";
//        }
//        else
//        {
//            self.b12=@"NO";
//        }
//        
//        NSString *strb57=(self.retrievedarray)[0] [@"donnesle_par_medecin"];
//        if([strb57 isEqualToString:strb2])
//        {
//            [self.bmede setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b13=@"YES";
//        }
//        else
//        {
//            self.b13=@"NO";
//        }
//        
//        NSString *strb59=(self.retrievedarray)[0] [@"donnesle_par_ets_hospitalier"];
//        if([strb59 isEqualToString:strb2])
//        {
//            [self.bets setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b14=@"YES";
//        }
//        else
//        {
//            self.b14=@"NO";
//        }
//        
//        NSString *strb61=(self.retrievedarray)[0] [@"donnees_concernant_oui1"];
//        if([strb61 isEqualToString:strb2])
//        {
//            [self.bdou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b15=@"YES";
//        }
//        else
//        {
//            self.b15=@"NO";
//        }
//        
//        NSString *strb63=(self.retrievedarray)[0] [@"donnees_concernant_non1"];
//        if([strb63 isEqualToString:strb2])
//        {
//            [self.bdnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b16=@"YES";
//        }
//        else
//        {
//            self.b16=@"NO";
//        }
//        
//        NSString *strb65=(self.retrievedarray)[0] [@"donnees_concernant_oui2"];
//        if([strb65 isEqualToString:strb2])
//        {
//            [self.bfou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b17=@"YES";
//        }
//        else
//        {
//            self.b17=@"NO";
//        }
//        
//        NSString *strb67=(self.retrievedarray)[0] [@"donnees_concernant_non2"];
//        if([strb67 isEqualToString:strb2])
//        {
//            [self.bfnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b18=@"YES";
//        }
//        else
//        {
//            self.b18=@"NO";
//        }
//        
//        NSString *strb69=(self.retrievedarray)[0] [@"conseq_la_victime_travail"];
//        if([strb69 isEqualToString:strb2])
//        {
//            [self.blavictra setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b19=@"YES";
//        }
//        else
//        {
//            self.b19=@"NO";
//        }
//        
//        NSString *strb71=(self.retrievedarray)[0] [@"afeectation_possible_oui"];
//        if([strb71 isEqualToString:strb2])
//        {
//            [self.baffou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b20=@"YES";
//        }
//        else
//        {
//            self.b20=@"NO";
//        }
//        
//        NSString *strb73=(self.retrievedarray)[0] [@"afeectation_possible_non"];
//        if([strb73 isEqualToString:strb2])
//        {
//            [self.baffnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//            self.b21=@"YES";
//        }
//        else
//        {
//            self.b21=@"NO";
//        }
//        
//        
//        // ************* For Signature Image
//        
//        NSString *datas1=(self.retrievedarray)[0][@"declarant_signature"];
//        NSData *data=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image=[[UIImage alloc]init];
//        image=[UIImage imageWithData:data];
//        [self.img_Signature1 setImage:image];
//        
//        NSString *datas2=(self.retrievedarray)[0][@"pris_sign"];
//        NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image1=[[UIImage alloc]init];
//        image1=[UIImage imageWithData:data2];
//        [self.img_Signature2 setImage:image1];
//        
//        // ************ For Text First Box
//        
//        self.empl.text=(self.retrievedarray)[0] [@"empl_nom"];
//        self.emp_n_rue_bp.text=(self.retrievedarray)[0] [@"emp_n_rue_bp"];
//        self.emp_code_postal.text=(self.retrievedarray)[0] [@"emp_code_postal"];
//        self.emp_commune.text=(self.retrievedarray)[0] [@"emp_commune"];
//        
//        self.accid.text=(self.retrievedarray)[0] [@"accid_nom"];
//        self.acc_fonction.text=(self.retrievedarray)[0] [@"acc_fonction"];
//        self.acc_anciennete_au_poste.text=(self.retrievedarray)[0] [@"acc_anciennete_au_poste"];
//        self.acc_qualification.text=(self.retrievedarray)[0] [@"acc_qualification"];
//        
//        self.acc_jour_de_laccident.text=(self.retrievedarray)[0] [@"acc_jour_de_laccident"];
//        self.dateacctf.text=(self.retrievedarray)[0] [@"acc_date"];
//        self.accident_excercait_elle.text=(self.retrievedarray)[0] [@"accident_excercait_elle"];
//        self.lieu_n_rue_bp.text=(self.retrievedarray)[0] [@"lieu_n_rue_bp"];
//        self.lieu_code_postal.text=(self.retrievedarray)[0] [@"lieu_code_postal"];
//        self.lieu_commune.text=(self.retrievedarray)[0] [@"lieu_commune"];
//        
//        self.temoin_immediat.text=(self.retrievedarray)[0] [@"temoin_immediat"];
//        self.premiere_prosonne_ayent.text=(self.retrievedarray)[0] [@"premiere_prosonne_ayent"];
//        self.textview1.text=(self.retrievedarray)[0] [@"precisez_lactivite"];
//        self.siege_des_lesions.text=(self.retrievedarray)[0] [@"siege_des_lesions"];
//        self.nature_des_lesions.text=(self.retrievedarray)[0] [@"nature_des_lesions"];
//        self.textview2.text=(self.retrievedarray)[0] [@"details_et_circonstance"];
//        self.textview3.text=(self.retrievedarray)[0] [@"comment_la_victime"];
//        self.textview4.text=(self.retrievedarray)[0] [@"quels_evenements_deviant"];
//        
//        self.donnes_le_date.text=(self.retrievedarray)[0] [@"donnes_le_date"];
//        self.premiers_N_rue_bp.text=(self.retrievedarray)[0] [@"premiers_N_rue_bp"];
//        self.premiers_code_postal.text=(self.retrievedarray)[0] [@"premiers_code_postal"];
//        self.premiers_commune.text=(self.retrievedarray)[0] [@"premiers_commune"];
//        self.donnees_si_non_preciser.text=(self.retrievedarray)[0] [@"donnees_si_non_preciser"];
//        self.premiers_excercait_elle.text=(self.retrievedarray)[0] [@"premiers_excercait_elle"];
//        self.donnees_concernant_mesure.text=(self.retrievedarray)[0] [@"donnees_concernant_mesure"];
//        self.vswtf.text=(self.retrievedarray)[0][@"la_victim_date"];
//        self.daystf.text=(self.retrievedarray)[0][@"la_victim_days"];
//        self.textview5.text=(self.retrievedarray)[0] [@"measure_prises_ou"];
//        
//        self.declarant_name.text=(self.retrievedarray)[0] [@"declarant_name"];
//        self.declarant_a.text=(self.retrievedarray)[0][@"declarant_a"];
//        self.decdatetf.text=(self.retrievedarray)[0] [@"declarant_date"];
//        self.information_du_chsct.text=(self.retrievedarray)[0][@"information_du_chsct"];
//        self.infdatetf.text=(self.retrievedarray)[0][@"information_date"];
//        self.annee.text=(self.retrievedarray)[0][@"annee"];
//        self.classement_no.text=(self.retrievedarray)[0][@"classement_no"];
//        self.pris_no.text=(self.retrievedarray)[0][@"pris_no"];
//        self.pris_a.text=(self.retrievedarray)[0][@"pris_a"];
//        self.prisdatetf.text=(self.retrievedarray)[0][@"pris_le"];
//        self.txt_consequences.text=(self.retrievedarray)[0] [@"consequences"];
//    }
    _premiers_N_rue_bp.delegate=self;
    _premiers_code_postal.delegate=self;
    _premiers_commune.delegate=self;
    
    _lieu_n_rue_bp.delegate=self;
   //self.lieu_code_postal.delegate=self;
    //self.lieu_commune.delegate=self;
    _accident_excercait_elle.delegate=self;
    _premiere_prosonne_ayent.delegate=self;
    
    _textview1.delegate=self;
    _textview2.delegate=self;
    _textview3.delegate=self;
    _textview4.delegate=self;
    _textview5.delegate=self;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    self.empl.enabled=FALSE;
    self.emp_n_rue_bp.enabled=FALSE;
    self.emp_code_postal.enabled=FALSE;
    self.emp_commune.enabled=FALSE;
    
    self.accid.enabled=FALSE;
    self.acc_fonction.enabled=FALSE;
    self.acc_anciennete_au_poste.enabled=FALSE;
    self.acc_qualification.enabled=FALSE;
    
    self.acc_jour_de_laccident.enabled=FALSE;
    self.dateacctf.enabled=FALSE;
    self.accident_excercait_elle.enabled=FALSE;
    self.lieu_n_rue_bp.enabled=FALSE;
    //self.lieu_code_postal.enabled=FALSE;
    self.lieu_commune.enabled=FALSE;
    
    self.temoin_immediat.enabled=FALSE;
    self.premiere_prosonne_ayent.enabled=FALSE;
    self.textview1.editable=FALSE;
    self.siege_des_lesions.enabled=FALSE;
    self.nature_des_lesions.enabled=FALSE;
    self.textview2.editable=FALSE;
    self.textview3.editable=FALSE;
    self.textview4.editable=FALSE;
    
    self.donnes_le_date.enabled=FALSE;
    self.premiers_N_rue_bp.enabled=FALSE;
    self.premiers_code_postal.enabled=FALSE;
    self.premiers_commune.enabled=FALSE;
    self.donnees_si_non_preciser.enabled=FALSE;
    self.premiers_excercait_elle.enabled=FALSE;
    self.donnees_concernant_mesure.enabled=FALSE;
    self.vswtf.enabled=FALSE;
    self.daystf.enabled=FALSE;
    self.textview5.editable=FALSE;
    self.declarant_name.enabled=FALSE;
    self.declarant_a.enabled=FALSE;
    self.decdatetf.enabled=FALSE;
    self.information_du_chsct.enabled=FALSE;
    self.infdatetf.enabled=FALSE;
    self.annee.enabled=FALSE;
    self.classement_no.enabled=FALSE;
    self.pris_no.enabled=FALSE;
    self.pris_a.enabled=FALSE;
    self.prisdatetf.enabled=FALSE;
    self.txt_consequences.enabled=FALSE;
    
    self.badt.userInteractionEnabled=FALSE;
    self.baslc.userInteractionEnabled=FALSE;
    
    self.btb.userInteractionEnabled=FALSE;
    self.bb.userInteractionEnabled=FALSE;
    self.bm.userInteractionEnabled=FALSE;
    
    self.blhc.userInteractionEnabled=FALSE;
    self.bbu.userInteractionEnabled=FALSE;
    self.bat.userInteractionEnabled=FALSE;
    self.bocc.userInteractionEnabled=FALSE;
    
    self.bou.userInteractionEnabled=FALSE;
    self.bnon.userInteractionEnabled=FALSE;
    self.bparsst.userInteractionEnabled=FALSE;
    self.bmede.userInteractionEnabled=FALSE;
    self.bets.userInteractionEnabled=FALSE;
    
    self.bdou.userInteractionEnabled=FALSE;
    self.bnon.userInteractionEnabled=FALSE;
    self.bfou.userInteractionEnabled=FALSE;
    self.bfnon.userInteractionEnabled=FALSE;
    self.blavictra.userInteractionEnabled=FALSE;
    self.baffou.userInteractionEnabled=FALSE;
    self.baffnon.userInteractionEnabled=FALSE;
    
    self.img_Signature1.userInteractionEnabled=FALSE;
    self.img_Signature2.userInteractionEnabled=FALSE;
    
    self.editbut1.userInteractionEnabled=FALSE;
    self.editbut2.userInteractionEnabled=FALSE;
    
}


#pragma mark UITextfield delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(self.premiers_N_rue_bp==textField)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1250;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(self.premiers_code_postal==textField)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1250;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(self.premiers_commune==textField)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1250;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(self.accident_excercait_elle==textField)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-2050;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(self.lieu_n_rue_bp==textField)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-2150;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
        
    }
    else if(self.lieu_code_postal==textField)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-2150;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(self.lieu_commune==textField)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-2150;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(self.premiers_commune==textField)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1250;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(self.premiere_prosonne_ayent==textField)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1750;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if(self.textview2==textView)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1450;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if(self.textview4==textView)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-1050;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
}

-(IBAction)editbutclicked:(id)sender
{
    UIButton *butt=(UIButton *)sender;
    if ( butt.tag == 400)
        currentImageView = self.img_Signature1 ;
    else if (butt.tag == 401)
        currentImageView = self.img_Signature2 ;
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
    svc.delegate=self;
    [self.navigationController pushViewController:svc animated:NO];
}

-(void)confirm:(UIBarButtonItem *)currentBarButton
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


-(void)saveToDataBase: ( UIBarButtonItem *) currentBarButton
{
    int  nnn;
    NSString * str_Sign1 = [ self encodeToBase64String:self.img_Signature1.image] ;
    NSString * str_Sign2 = [ self encodeToBase64String:self.img_Signature2.image] ;
    
    NSDateFormatter *forma=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [forma setDateFormat:@"dd-MM-YYYY"] ;
    NSString *datestring12 = [forma stringFromDate:now];
    
    if (self.IsForUpdating==YES )
    {
        if (self.retrievedarray!=nil)
        {
            NSLog(@"retrive:%@",self.retrievedarray);
            NSLog(@"retrive:%@",(self.retrievedarray)[0][@"accident_id"]);
            NSString *str=(self.retrievedarray)[0][@"accident_id"];
            nnn=[str intValue];
        }
        else
        {
            NSString * str_GetCount = @"SELECT accident_id FROM accident_immediate" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            nnn =  CurrentCount;
        }
        [self openPerPagePDF] ;
        str_DocumentName = [str_DocumentName stringByReplacingOccurrencesOfString:@"'"
                                                                       withString:@"''"];
        NSString *updateSQL = [NSString stringWithFormat:
                               @"update accident_immediate set doc_name='%@',accident_de_travail='%@',accident_sur_le_travail='%@',empl_nom='%@',emp_n_rue_bp='%@',emp_code_postal='%@',emp_commune='%@',accid_nom='%@',acc_fonction='%@',acc_anciennete_au_poste='%@',acc_qualification='%@',acc_con_du_poste_tb='%@',acc_con_du_poste_b='%@',acc_con_du_poste_m='%@',acc_jour_de_laccident='%@',acc_date='%@',lieu_habituel_chantier='%@',bureau='%@',atelier='%@',occasionel='%@',au_moment_de_habituelle_oui='%@',au_moment_de_habituelle_non='%@',accident_excercait_elle='%@',lieu_n_rue_bp='%@',temoin_immediat='%@',premiere_prosonne_ayent='%@',precisez_lactivite='%@',siege_des_lesions='%@',nature_des_lesions='%@',details_et_circonstance='%@',comment_la_victime='%@',quels_evenements_deviant='%@',donnes_le_date='%@',donnesle_par_sst='%@',donnesle_par_medecin='%@',donnesle_par_ets_hospitalier='%@',premiers_N_rue_bp='%@',premiers_code_postal='%@',premiers_commune='%@',donnees_concernant_oui1='%@',donnees_concernant_non1='%@',donnees_si_non_preciser='%@',donnees_concernant_oui2='%@',donnees_concernant_non2='%@',premiers_excercait_elle='%@',donnees_concernant_mesure='%@',conseq_la_victime_travail='%@',conseq_la_victime_a_interrompu='%@',la_victim_date='%@',la_victim_days='%@',afeectation_possible_oui='%@',afeectation_possible_non='%@',measure_prises_ou='%@',declarant_name='%@',declarant_a='%@',declarant_date='%@',declarant_signature='%@',information_du_chsct='%@',information_date='%@',annee='%@',classement_no='%@',pris_no='%@',pris_a='%@',pris_le='%@',pris_sign='%@',doc_modified_date='%@',consequences='%@' where accident_id='%ld'",str_DocumentName, self.b1,self.b2,self.empl.text,self.emp_n_rue_bp.text, self.emp_code_postal.text, self.emp_commune.text, self.accid.text,self.acc_fonction.text, self.acc_anciennete_au_poste.text, self.acc_qualification.text, self.b3, self.b4, self.b5,self.acc_jour_de_laccident.text, self.dateacctf.text, self.b6, self.b7,self.b8, self.b9, self.b10, self.b11, self.accident_excercait_elle.text, self.lieu_n_rue_bp.text, self.temoin_immediat.text, self.premiere_prosonne_ayent.text, self.textview1.text, self.siege_des_lesions.text, self.nature_des_lesions.text, self.textview2.text, self.textview3.text, self.textview4.text, self.donnes_le_date.text, self.b12, self.b13, self.b14, self.premiers_N_rue_bp.text, self.premiers_code_postal.text, self.premiers_commune.text, self.b15, self.b16, self.donnees_si_non_preciser.text, self.b17, self.b18, self.premiers_excercait_elle.text, self.donnees_concernant_mesure.text, self.b19, self.b20, self.vswtf.text, self.daystf.text, self.b21, self.b22, self.textview5.text, self.declarant_name.text, self.declarant_a.text, self.decdatetf.text, str_Sign1, self.information_du_chsct.text, self.infdatetf.text, self.annee.text, self.classement_no.text, self.pris_no.text, self.pris_a.text, self.prisdatetf.text, str_Sign2, datestring12,self.txt_consequences.text, (long)nnn];
        [[ DBSqlite dbManager] updateStatement:updateSQL];
    }
    else
    {
        if (saved_Into_DB==NO)
        {
            [self openPerPagePDF] ;
            NSString * str_Sign1 = [ self encodeToBase64String:self.img_Signature1.image] ;
            NSString * str_Sign2 = [ self encodeToBase64String:self.img_Signature2.image] ;
            NSString * str_GetCount = @"SELECT accident_id FROM accident_immediate" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSLog(@"Current count : %d", CurrentCount) ;
            NSString *strQuery = [NSString stringWithFormat:@"insert into accident_immediate(accident_id,doc_name,accident_de_travail,accident_sur_le_travail,empl_nom,emp_n_rue_bp,emp_code_postal,emp_commune,accid_nom,acc_fonction,acc_anciennete_au_poste,acc_qualification,acc_con_du_poste_tb,acc_con_du_poste_b,acc_con_du_poste_m,acc_jour_de_laccident,acc_date,lieu_habituel_chantier,bureau,atelier,occasionel,au_moment_de_habituelle_oui,au_moment_de_habituelle_non,accident_excercait_elle,lieu_n_rue_bp,temoin_immediat,premiere_prosonne_ayent,precisez_lactivite,siege_des_lesions,nature_des_lesions,details_et_circonstance,comment_la_victime,quels_evenements_deviant,donnes_le_date,donnesle_par_sst,donnesle_par_medecin,donnesle_par_ets_hospitalier,premiers_N_rue_bp,premiers_code_postal,premiers_commune,donnees_concernant_oui1,donnees_concernant_non1,donnees_si_non_preciser,donnees_concernant_oui2,donnees_concernant_non2,premiers_excercait_elle,donnees_concernant_mesure,conseq_la_victime_travail,conseq_la_victime_a_interrompu,la_victim_date,la_victim_days,afeectation_possible_oui,afeectation_possible_non,measure_prises_ou,declarant_name,declarant_a,declarant_date,declarant_signature,information_du_chsct,information_date,annee,classement_no,pris_no,pris_a,pris_le,pris_sign,doc_created_date,doc_modified_date,consequences) values (\"%d\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",++CurrentCount,str_DocumentName,self.b1,self.b2,self.empl.text,self.emp_n_rue_bp.text, self.emp_code_postal.text, self.emp_commune.text, self.accid.text,self.acc_fonction.text, self.acc_anciennete_au_poste.text, self.acc_qualification.text, self.b3, self.b4, self.b5,self.acc_jour_de_laccident.text, self.dateacctf.text, self.b6, self.b7,self.b8, self.b9, self.b10, self.b11, self.accident_excercait_elle.text, self.lieu_n_rue_bp.text, self.temoin_immediat.text, self.premiere_prosonne_ayent.text, self.textview1.text, self.siege_des_lesions.text, self.nature_des_lesions.text, self.textview2.text, self.textview3.text, self.textview4.text, self.donnes_le_date.text, self.b12, self.b13, self.b14, self.premiers_N_rue_bp.text, self.premiers_code_postal.text, self.premiers_commune.text, self.b15, self.b16, self.donnees_si_non_preciser.text, self.b17, self.b18, self.premiers_excercait_elle.text, self.donnees_concernant_mesure.text, self.b19, self.b20, self.vswtf.text, self.daystf.text, self.b21, self.b22, self.textview5.text, self.declarant_name.text, self.declarant_a.text, self.decdatetf.text, str_Sign1, self.information_du_chsct.text, self.infdatetf.text, self.annee.text, self.classement_no.text, self.pris_no.text, self.pris_a.text, self.prisdatetf.text, str_Sign2, str_CreatedDate, str_CreatedDate, self.txt_consequences.text];
            [[DBSqlite dbManager]insertStatement:strQuery];
            self.IsForUpdating=YES;
            saved_Into_DB=YES;
        }
        else if(saved_Into_DB==YES)
        {
            NSString * str_GetCount = @"SELECT accident_id FROM accident_immediate" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSLog(@"Correct way!!!!!!!!!!!!!!!!");
            NSString *updateSQL33 = [NSString stringWithFormat:
                                     @"update accident_immediate set accident_de_travail='%@',accident_sur_le_travail='%@',empl_nom='%@',emp_n_rue_bp='%@',emp_code_postal='%@',emp_commune='%@',accid_nom='%@',acc_fonction='%@',acc_anciennete_au_poste='%@',acc_qualification='%@',acc_con_du_poste_tb='%@',acc_con_du_poste_b='%@',acc_con_du_poste_m='%@',acc_jour_de_laccident='%@',acc_date='%@',lieu_habituel_chantier='%@',bureau='%@',atelier='%@',occasionel='%@',au_moment_de_habituelle_oui='%@',au_moment_de_habituelle_non='%@',accident_excercait_elle='%@',lieu_n_rue_bp='%@',lieu_code_postal='%@',lieu_commune='%@',temoin_immediat='%@',premiere_prosonne_ayent='%@',precisez_lactivite='%@',siege_des_lesions='%@',nature_des_lesions='%@',details_et_circonstance='%@',comment_la_victime='%@',quels_evenements_deviant='%@',donnes_le_date='%@',donnesle_par_sst='%@',donnesle_par_medecin='%@',donnesle_par_ets_hospitalier='%@',premiers_N_rue_bp='%@',premiers_code_postal='%@',premiers_commune='%@',donnees_concernant_oui1='%@',donnees_concernant_non1='%@',donnees_si_non_preciser='%@',donnees_concernant_oui2='%@',donnees_concernant_non2='%@',premiers_excercait_elle='%@',donnees_concernant_mesure='%@',conseq_la_victime_travail='%@',conseq_la_victime_a_interrompu='%@',la_victim_date='%@',la_victim_days='%@',afeectation_possible_oui='%@',afeectation_possible_non='%@',measure_prises_ou='%@',declarant_name='%@',declarant_a='%@',declarant_date='%@',declarant_signature='%@',information_du_chsct='%@',information_date='%@',annee='%@',classement_no='%@',pris_no='%@',pris_a='%@',pris_le='%@',pris_sign='%@',doc_modified_date='%@',consequences='%@' where accident_id='%d'", self.b1,self.b2,self.empl.text,self.emp_n_rue_bp.text, self.emp_code_postal.text, self.emp_commune.text, self.accid.text,self.acc_fonction.text, self.acc_anciennete_au_poste.text, self.acc_qualification.text, self.b3, self.b4, self.b5,self.acc_jour_de_laccident.text, self.dateacctf.text, self.b6, self.b7,self.b8, self.b9, self.b10, self.b11, self.accident_excercait_elle.text, self.lieu_n_rue_bp.text, self.lieu_code_postal.text, self.lieu_commune.text, self.temoin_immediat.text, self.premiere_prosonne_ayent.text, self.textview1.text, self.siege_des_lesions.text, self.nature_des_lesions.text, self.textview2.text, self.textview3.text, self.textview4.text, self.donnes_le_date.text, self.b12, self.b13, self.b14, self.premiers_N_rue_bp.text, self.premiers_code_postal.text, self.premiers_commune.text, self.b15, self.b16, self.donnees_si_non_preciser.text, self.b17, self.b18, self.premiers_excercait_elle.text, self.donnees_concernant_mesure.text, self.b19, self.b20, self.vswtf.text, self.daystf.text, self.b21, self.b22, self.textview5.text, self.declarant_name.text, self.declarant_a.text, self.decdatetf.text, str_Sign1, self.information_du_chsct.text, self.infdatetf.text, self.annee.text, self.classement_no.text, self.pris_no.text, self.pris_a.text, self.prisdatetf.text, str_Sign2, datestring12,self.txt_consequences.text, CurrentCount];
            [[ DBSqlite dbManager] updateStatement:updateSQL33];
            NSLog(@"Success!!!!!!!!!!!!!!!!");
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
-(void)viewWillAppear:(BOOL)animated
{
    
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
    
    str_DocumentName = [NSString stringWithFormat:@"Compte-rendu d'accident à chaud_%@.pdf", datestring1]  ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
    [pdfData writeToFile:path atomically:NO];
    NSLog(@"tmpDirectory: %@",path);
}


-(void)showEmail

{
    Class mailClass  =  (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass !=  nil)
        
    {
        // We must always check whether the current device is configured for sending emails
        
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
    
    // Email Content
    
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
    
    if ([extension isEqualToString:@"jpg"]) {
        
        mimeType  =  @"image/jpeg";
        
    } else if ([extension isEqualToString:@"png"]) {
        
        mimeType  =  @"image/png";
        
    } else if ([extension isEqualToString:@"doc"]) {
        
        mimeType  =  @"application/msword";
        
    } else if ([extension isEqualToString:@"ppt"]) {
        
        mimeType  =  @"application/vnd.ms-powerpoint";
        
    } else if ([extension isEqualToString:@"html"]) {
        
        mimeType  =  @"text/html";
        
    } else if ([extension isEqualToString:@"pdf"]) {
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (textField == self.dateacctf)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker];
        
        return NO;
        
    }
    else if (textField == self.decdatetf)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker2];
        
        return NO;
        
    }
    
    else if (textField == self.infdatetf)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker3];
        
        return NO;
        
    }
    
    else if (textField == self.prisdatetf)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker4];
        
        return NO;
        
    }
    
    else if (textField == self.vswtf)
    {
        [self.view endEditing:YES];
        
        [self showDatePicker5];
        
        return NO;
        
    }
    
    else if (textField == self.timetf)
    {
        [self.view endEditing:YES];
        
        [self showTimePicker];
        
        return NO;
        
    }
    
    else if (textField == self.donnes_le_date)
    {
        [self.view endEditing:YES];
        
        [self showDatePicker6];
        
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
    
    [self.dateacctf setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.dateacctf.frame inView:self.accidentview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.dateacctf.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.dateacctf.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void) timefield:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)self.timetf.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    
    
    
    [outputFormatter setDateFormat:@"HH:mm"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    self.timetf.text = [NSString stringWithFormat:@"%@",timeString];
    
}


-(void)showTimePicker

{
    
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(timefield:) forControlEvents:UIControlEventValueChanged];
    
    [self.timetf setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:self.timetf.frame inView:self.accidentview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}




-(void)showDatePicker2

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField2:) forControlEvents:UIControlEventValueChanged];
    
    [self.decdatetf setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.decdatetf.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField2:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.decdatetf.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.decdatetf.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker3

{
    
    UIDatePicker *datePicker3 = [[UIDatePicker alloc]init];
    
    [datePicker3 setDate:[NSDate date]];
    
    datePicker3.datePickerMode = UIDatePickerModeDate;
    
    [datePicker3 addTarget:self action:@selector(dateTextField3:) forControlEvents:UIControlEventValueChanged];
    
    [self.infdatetf setInputView:datePicker3];
    
    UIViewController* popoverContent3 = [[UIViewController alloc] init];
    
    UIView *popoverView3 = [[UIView alloc] init];
    
    popoverView3.backgroundColor = [UIColor clearColor];
    
    [popoverView3 addSubview:datePicker3];
    
    popoverContent3.view = popoverView3;
    
    UIPopoverController *popoverController3;
    
    popoverController3 = [[UIPopoverController alloc] initWithContentViewController:popoverContent3];
    
    popoverController3.delegate=self;
    
    [popoverController3 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController3 presentPopoverFromRect:self.infdatetf.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}



-(void)dateTextField3:(id)sender
{
    UIDatePicker *picker3=(UIDatePicker *)self.infdatetf.inputView;
    
    NSDateFormatter *dateFormat3=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate3=picker3.date;
    
    [dateFormat3 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString3= [dateFormat3 stringFromDate:eventDate3];
    
    self.infdatetf.text=[NSString stringWithFormat:@"%@", dateString3];
    
}

-(void)showDatePicker4

{
    
    UIDatePicker *datePicker4 = [[UIDatePicker alloc]init];
    
    [datePicker4 setDate:[NSDate date]];
    
    datePicker4.datePickerMode = UIDatePickerModeDate;
    
    [datePicker4 addTarget:self action:@selector(dateTextField4:) forControlEvents:UIControlEventValueChanged];
    
    [self.prisdatetf setInputView:datePicker4];
    
    
    UIViewController* popoverContent4 = [[UIViewController alloc] init];
    
    UIView *popoverView4 = [[UIView alloc] init];
    
    popoverView4.backgroundColor = [UIColor clearColor];
    
    [popoverView4 addSubview:datePicker4];
    
    popoverContent4.view = popoverView4;
    
    UIPopoverController *popoverController4;
    
    popoverController4 = [[UIPopoverController alloc] initWithContentViewController:popoverContent4];
    
    popoverController4.delegate=self;
    
    [popoverController4 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController4 presentPopoverFromRect:self.prisdatetf.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}



-(void)dateTextField4:(id)sender
{
    UIDatePicker *picker4=(UIDatePicker *)self.prisdatetf.inputView;
    
    NSDateFormatter *dateFormat4=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate4=picker4.date;
    
    [dateFormat4 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString4= [dateFormat4 stringFromDate:eventDate4];
    
    self.prisdatetf.text=[NSString stringWithFormat:@"%@", dateString4];
    
}

-(void)showDatePicker5

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField5:) forControlEvents:UIControlEventValueChanged];
    
    [self.vswtf setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.vswtf.frame inView:self.consequencesview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField5:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.vswtf.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    self.vswtf.font=[UIFont fontWithName:SYSTEM_CLOCK size:14.0];
    
    self.vswtf.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void)showDatePicker6

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField6:) forControlEvents:UIControlEventValueChanged];
    
    [self.donnes_le_date setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:self.donnes_le_date.frame inView:self.premiersoinsview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField6:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)self.donnes_le_date.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.donnes_le_date.text = [NSString stringWithFormat:@"%@",dateString];
}

- (IBAction)buttonclicked:(id)sender
{
    UIButton *but=(UIButton *)sender;
    
    if(but.tag==1)
    {
        if(self.badt.currentBackgroundImage==nil)
        {
            [self.badt setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b1=@"YES";
        }
        else if(self.badt.currentBackgroundImage!=nil)
        {
            [self.badt setBackgroundImage:nil forState:UIControlStateNormal];
            self.b1=@"NO";
        }
    }
    
    if(but.tag==2)
    {
        if(self.baslc.currentBackgroundImage==nil)
        {
            [self.baslc setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b2=@"YES";
        }
        else if(self.baslc.currentBackgroundImage!=nil)
        {
            [self.baslc setBackgroundImage:nil forState:UIControlStateNormal];
            self.b2=@"NO";
        }
    }
    
    if(but.tag==3)
    {
        if(self.btb.currentBackgroundImage==nil)
        {
            [self.btb setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b3=@"YES";
        }
        else if(self.btb.currentBackgroundImage!=nil)
        {
            [self.btb setBackgroundImage:nil forState:UIControlStateNormal];
            self.b3=@"NO";
        }
    }
    
    if(but.tag==4)
    {
        if(self.bb.currentBackgroundImage==nil)
        {
            [self.bb setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b4=@"YES";
        }
        else if(self.bb.currentBackgroundImage!=nil)
        {
            [self.bb setBackgroundImage:nil forState:UIControlStateNormal];
            self.b4=@"NO";
        }
    }
    
    if(but.tag==5)
    {
        if(self.bm.currentBackgroundImage==nil)
        {
            [self.bm setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b5=@"YES";
        }
        else if(self.bm.currentBackgroundImage!=nil)
        {
            [self.bm setBackgroundImage:nil forState:UIControlStateNormal];
            self.b5=@"NO";
        }
    }
    
    if(but.tag==6)
    {
        if(self.blhc.currentBackgroundImage==nil)
        {
            [self.blhc setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b6=@"YES";
        }
        else if(self.blhc.currentBackgroundImage!=nil)
        {
            [self.blhc setBackgroundImage:nil forState:UIControlStateNormal];
            self.b6=@"NO";
        }
    }
    
    if(but.tag==7)
    {
        if(self.bbu.currentBackgroundImage==nil)
        {
            [self.bbu setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b7=@"YES";
        }
        else if(self.bbu.currentBackgroundImage!=nil)
        {
            [self.bbu setBackgroundImage:nil forState:UIControlStateNormal];
            self.b7=@"NO";
        }
    }
    
    if(but.tag==8)
    {
        if(self.bat.currentBackgroundImage==nil)
        {
            [self.bat setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b8=@"YES";
        }
        else if(self.bat.currentBackgroundImage!=nil)
        {
            [self.bat setBackgroundImage:nil forState:UIControlStateNormal];
            self.b8=@"NO";
        }
    }
    
    if(but.tag==9)
    {
        if(self.bocc.currentBackgroundImage==nil)
        {
            [self.bocc setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b9=@"YES";
        }
        else if(self.bocc.currentBackgroundImage!=nil)
        {
            [self.bocc setBackgroundImage:nil forState:UIControlStateNormal];
            self.b9=@"NO";
        }
    }
    
    
    if(but.tag==10)
    {
        
        
        if(self.bou.currentBackgroundImage==nil)
        {
            [self.bou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b10=@"YES";
            
            [self.bnon setBackgroundImage:nil forState:UIControlStateNormal];
            
            self.b11=@"NO";
        }
        else if(self.bou.currentBackgroundImage!=nil)
        {
            [self.bou setBackgroundImage:nil forState:UIControlStateNormal];
            self.b10=@"NO";
        }
    }
    
    if(but.tag==11)
    {
        
        
        if(self.bnon.currentBackgroundImage==nil)
        {
            [self.bnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b11=@"YES";
            
            [self.bou setBackgroundImage:nil forState:UIControlStateNormal];
            self.b10=@"NO";
        }
        else if(self.bnon.currentBackgroundImage!=nil)
        {
            [self.bnon setBackgroundImage:nil forState:UIControlStateNormal];
            self.b11=@"NO";
        }
    }
    
    if(but.tag==12)
    {
        if(self.bparsst.currentBackgroundImage==nil)
        {
            [self.bparsst setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b12=@"YES";
        }
        else if(self.bparsst.currentBackgroundImage!=nil)
        {
            [self.bparsst setBackgroundImage:nil forState:UIControlStateNormal];
            self.b12=@"NO";
        }
    }
    
    if(but.tag==13)
    {
        
        if(self.bmede.currentBackgroundImage==nil)
        {
            [self.bmede setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b13=@"YES";
        }
        else if(self.bmede.currentBackgroundImage!=nil)
        {
            [self.bmede setBackgroundImage:nil forState:UIControlStateNormal];
            self.b13=@"NO";
        }
    }
    
    if(but.tag==14)
    {
        if(self.bets.currentBackgroundImage==nil)
        {
            [self.bets setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b14=@"YES";
        }
        else if(self.bets.currentBackgroundImage!=nil)
        {
            [self.bets setBackgroundImage:nil forState:UIControlStateNormal];
            self.b14=@"NO";
        }
    }
    
    if(but.tag==15)
    {
        
        
        if(self.bdou.currentBackgroundImage==nil)
        {
            [self.bdou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b15=@"YES";
            [self.bdnon setBackgroundImage:nil forState:UIControlStateNormal];
            self.b16=@"NO";
        }
        else if(self.bdou.currentBackgroundImage!=nil)
        {
            [self.bdou setBackgroundImage:nil forState:UIControlStateNormal];
            
            self.b15=@"NO";
        }
    }
    
    if(but.tag==16)
    {
        
        if(self.bdnon.currentBackgroundImage==nil)
        {
            [self.bdnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b16=@"YES";
            [self.bdou setBackgroundImage:nil forState:UIControlStateNormal];
            self.b15=@"NO";
        }
        else if(self.bdnon.currentBackgroundImage!=nil)
        {
            [self.bdnon setBackgroundImage:nil forState:UIControlStateNormal];
            self.b16=@"NO";
        }
    }
    
    if(but.tag==17)
    {
        
        
        if(self.bfou.currentBackgroundImage==nil)
        {
            [self.bfou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b17=@"YES";
            [self.bfnon setBackgroundImage:nil forState:UIControlStateNormal];
            self.b18=@"NO";
        }
        else if(self.bfou.currentBackgroundImage!=nil)
        {
            [self.bfou setBackgroundImage:nil forState:UIControlStateNormal];
            self.b17=@"NO";
        }
    }
    
    if(but.tag==18)
    {
        
        if(self.bfnon.currentBackgroundImage==nil)
        {
            [self.bfnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b18=@"YES";
            [self.bfou setBackgroundImage:nil forState:UIControlStateNormal];
            self.b17=@"NO";
            
            
        }
        else if(self.bfnon.currentBackgroundImage!=nil)
        {
            [self.bfnon setBackgroundImage:nil forState:UIControlStateNormal];
            self.b18=@"NO";
        }
    }
    
    if(but.tag==19)
    {
        if(self.blavictra.currentBackgroundImage==nil)
        {
            [self.blavictra setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b19=@"YES";
        }
        else if(self.blavictra.currentBackgroundImage!=nil)
        {
            [self.blavictra setBackgroundImage:nil forState:UIControlStateNormal];
            self.b19=@"NO";
        }
    }
    if(but.tag==20)
    {
        if(self.blavicint.currentBackgroundImage==nil)
        {
            [self.blavicint setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b20=@"YES";
        }
        else if(self.blavicint.currentBackgroundImage!=nil)
        {
            [self.blavicint setBackgroundImage:nil forState:UIControlStateNormal];
            self.b20=@"NO";
        }
    }
    
    if(but.tag==21)
    {
        if(self.baffou.currentBackgroundImage==nil)
        {
            [self.baffou setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b21=@"YES";
            [self.baffnon setBackgroundImage:nil forState:UIControlStateNormal];
            self.b22=@"NO";
        }
        else if(self.baffou.currentBackgroundImage!=nil)
        {
            [self.baffou setBackgroundImage:nil forState:UIControlStateNormal];
            self.b21=@"NO";
        }
    }
    
    if(but.tag==22)
    {
        if(self.baffnon.currentBackgroundImage==nil)
        {
            [self.baffnon setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
            self.b22=@"YES";
            [self.baffou setBackgroundImage:nil forState:UIControlStateNormal];
            self.b21=@"NO";
        }
        else if(self.baffnon.currentBackgroundImage!=nil)
        {
            [self.baffnon setBackgroundImage:nil forState:UIControlStateNormal];
            self.b22=@"NO";
        }
    }
}

#pragma mark Signature delegate

-(void)sendImgData:(UIImage *)image;
{
    UIImageView *imageView;
    NSLog(@"Image : %@", image) ;
    imageView = currentImageView ;
    imageView.image=image;
}

@end
