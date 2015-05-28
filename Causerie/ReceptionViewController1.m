//
//  ReceptionViewController1.m
//  Digitram
//
//  Created by Ravi on 27/05/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import "ReceptionViewController1.h"
#import <QuartzCore/QuartzCore.h>
#import "ScrollViewToPDF.h"
#import "SignaVC.h"

@import Foundation;

@interface ReceptionViewController1 ()<UIPopoverControllerDelegate, MFMailComposeViewControllerDelegate,SignaVCDelegate, UITextViewDelegate>

@end

@implementation ReceptionViewController1

- (void)viewDidLoad
{
    [super viewDidLoad];
    saved_Into_DB=NO;
    [self.scrollView setContentSize:(CGSizeMake(768, 4800))];
    [self.topScrollView setContentSize:(CGSizeMake(768,300))];
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    str_DocumentName = @"QU 434_4 Proces Verbal De Reception";
    self.title = str_DocumentName ;
    [self.btn_Sur0 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
    [ self.btn_Sur1 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    [ self.btn_Sur2 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    [ self.btn_Sur3 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    [ self.btn_Sur4 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    [ self.btn_Sur5 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    [ self.btn_Sur6 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    [ self.btn_Sur7 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    [ self.btn_Sur8 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    [ self.btn_Sur9 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    [ self.btn_Sur10 setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
    
    [self.btn_Sur0 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur1 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur2 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur3 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur4 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur5 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur6 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur7 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur8 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur9 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    [self.btn_Sur10 addTarget:self action:@selector(fun_RatingCheck:) forControlEvents:UIControlEventTouchUpOutside] ;
    array_Btns = [[ NSArray alloc] initWithObjects:self.btn_Sur0, self.btn_Sur1,self.btn_Sur2,self.btn_Sur3,self.btn_Sur4,self.btn_Sur5,self.btn_Sur6,self.btn_Sur7,self.btn_Sur8,self.btn_Sur9,self.btn_Sur10, nil];
    
    [ self.btn_Edit1 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit1.tag = 1 ;
    [ self.btn_Edit2 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit2.tag = 2 ;
    
    [ self.btn_Edit3 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit3.tag = 3 ;
    
    [ self.btn_Edit4 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit4.tag = 4 ;
    
    [ self.btn_Edit5 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit5.tag = 5 ;
    
    [ self.btn_Edit6 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit6.tag = 6 ;
    
    [ self.btn_Edit7 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit7.tag = 7 ;
    
    [ self.btn_Edit8 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit8.tag = 8 ;
    
    [ self.btn_Edit9 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit9.tag = 9 ;
    
    [ self.btn_Edit10 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit10.tag = 10 ;
    
    [ self.btn_Edit11 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit11.tag = 11 ;
    
    [ self.btn_Edit12 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit12.tag = 12 ;
    
    [ self.btn_Edit13 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit13.tag = 13 ;
    
    [ self.btn_Edit14 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit14.tag = 14 ;
    
    [ self.btn_Edit15 addTarget:self action:@selector(fun_Edit:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_Edit15.tag = 15 ;
    
    self.txt_Reserve1.text = @"" ;
    self.txt_Reserve2.text = @"" ;
    self.txt_Reserve3.text = @"" ;
    self.txt_Reserve4.text = @"" ;
    self.txt_Reserve5.text = @"" ;
    NSLog(@"Reserve : %@", self.txt_Reserve5.text) ;
    self.txt_Reserve6.text = @"" ;
    self.txt_Reserve7.text = @"" ;
    self.txt_Reserve8.text = @"" ;
    self.txt_Reserve9.text = @"" ;
    self.txt_Reserve10.text = @"" ;
    self.txt_Reserve11.text = @"" ;
    self.txt_Reserve12.text = @"" ;
    self.txt_Reserve13.text = @"" ;
    self.txt_Reserve14.text = @"" ;
    self.txt_Reserve15.text = @"" ;
    
    self.txt_Action1.text = @"" ;
    self.txt_Action2.text = @"" ;
    self.txt_Action3.text = @"" ;
    self.txt_Action4.text = @"" ;
    self.txt_Action5.text = @"" ;
    self.txt_Action6.text = @"" ;
    self.txt_Action7.text = @"" ;
    self.txt_Action8.text = @"" ;
    self.txt_Action9.text = @"" ;
    self.txt_Action10.text = @"" ;
    self.txt_Action11.text = @"" ;
    self.txt_Action12.text = @"" ;
    self.txt_Action13.text = @"" ;
    self.txt_Action14.text = @"" ;
    self.txt_Action15.text = @"" ;
    
    self.txt_Pilote1.text = @"" ;
    self.txt_Pilote2.text = @"" ;
    self.txt_Pilote3.text = @"" ;
    self.txt_Pilote4.text = @"" ;
    self.txt_Pilote5.text = @"" ;
    self.txt_Pilote6.text = @"" ;
    self.txt_Pilote7.text = @"" ;
    self.txt_Pilote8.text = @"" ;
    self.txt_Pilote9.text = @"" ;
    self.txt_Pilote10.text = @"" ;
    self.txt_Pilote11.text = @"" ;
    self.txt_Pilote12.text = @"" ;
    self.txt_Pilote13.text = @"" ;
    self.txt_Pilote14.text = @"" ;
    self.txt_Pilote15.text = @"" ;
    
    self.txt_Obj_Date1.text = @"" ;
    self.txt_Obj_Date2.text = @"" ;
    self.txt_Obj_Date3.text = @"" ;
    self.txt_Obj_Date4.text = @"" ;
    self.txt_Obj_Date5.text = @"" ;
    self.txt_Obj_Date6.text = @"" ;
    self.txt_Obj_Date7.text = @"" ;
    self.txt_Obj_Date8.text = @"" ;
    self.txt_Obj_Date9.text = @"" ;
    self.txt_Obj_Date10.text = @"" ;
    self.txt_Obj_Date11.text = @"" ;
    self.txt_Obj_Date12.text = @"" ;
    self.txt_Obj_Date13.text = @"" ;
    self.txt_Obj_Date14.text = @"" ;
    self.txt_Obj_Date15.text = @"" ;
    
    self.view1.layer.borderWidth=0.7;
    self.view1.layer.borderColor=[[UIColor blackColor]CGColor];
    
    self.view2.layer.borderWidth=0.7;
    self.view3.layer.borderWidth=0.7;
    self.view4.layer.borderWidth=0.7;
    self.view5.layer.borderWidth=0.7;
    self.view6.layer.borderWidth=0.7;
    self.view7.layer.borderWidth=0.7;
    self.view8.layer.borderWidth=0.7;
    self.view9.layer.borderWidth=0.7;
    self.view10.layer.borderWidth=0.7;
    self.view11.layer.borderWidth=0.7;
    self.view12.layer.borderWidth=0.7;
    self.view13.layer.borderWidth=0.7;
    self.view14.layer.borderWidth=0.7;
    self.view15.layer.borderWidth=0.7;
    self.view16.layer.borderWidth=0.7;
    self.view17.layer.borderWidth=0.7;
    self.view18.layer.borderWidth=0.7;
    self.view19.layer.borderWidth=0.7;
    self.view20.layer.borderWidth=0.7;
    self.view21.layer.borderWidth=0.7;
    self.view22.layer.borderWidth=0.7;
    self.view23.layer.borderWidth=0.7;
    self.view24.layer.borderWidth=0.7;
    self.view25.layer.borderWidth=0.7;
    self.view26.layer.borderWidth=0.7;
    self.view27.layer.borderWidth=0.7;
    self.view28.layer.borderWidth=0.7;
    self.view29.layer.borderWidth=0.7;
    self.view30.layer.borderWidth=0.7;
    self.view31.layer.borderWidth=0.7;
    self.view32.layer.borderWidth=0.7;
    self.view33.layer.borderWidth=0.7;
    self.view34.layer.borderWidth=0.7;
    self.view35.layer.borderWidth=0.7;
    self.view36.layer.borderWidth=0.7;
    self.view37.layer.borderWidth=0.7;
    self.view38.layer.borderWidth=0.7;
    self.view39.layer.borderWidth=0.7;
    self.view40.layer.borderWidth=0.7;
    self.view41.layer.borderWidth=0.7;
    self.view42.layer.borderWidth=0.7;
    self.view43.layer.borderWidth=0.7;
    self.view44.layer.borderWidth=0.7;
    self.view45.layer.borderWidth=0.7;
    self.view46.layer.borderWidth=0.7;
    self.view47.layer.borderWidth=0.7;
    self.view48.layer.borderWidth=0.7;
    self.view49.layer.borderWidth=0.7;
    self.view50.layer.borderWidth=0.7;
    self.view51.layer.borderWidth=0.7;
    self.view52.layer.borderWidth=0.7;
    self.view53.layer.borderWidth=0.7;
    self.view54.layer.borderWidth=0.7;
    self.view55.layer.borderWidth=0.7;
    self.view56.layer.borderWidth=0.7;
    self.view57.layer.borderWidth=0.7;
    self.view58.layer.borderWidth=0.7;
    self.view59.layer.borderWidth=0.7;
    self.view60.layer.borderWidth=0.7;
    self.view61.layer.borderWidth=0.7;
    self.view62.layer.borderWidth=0.7;
    self.view63.layer.borderWidth=0.7;
    self.view64.layer.borderWidth=0.7;
    self.view65.layer.borderWidth=0.7;
    self.view66.layer.borderWidth=0.7;
    self.view67.layer.borderWidth=0.7;
    self.view68.layer.borderWidth=0.7;
    self.view69.layer.borderWidth=0.7;
    self.view70.layer.borderWidth=0.7;
    self.view71.layer.borderWidth=0.7;
    self.view72.layer.borderWidth=0.7;
    self.view73.layer.borderWidth=0.7;
    self.view74.layer.borderWidth=0.7;
    self.view75.layer.borderWidth=0.7;
    self.view76.layer.borderWidth=0.7;
    self.view77.layer.borderWidth=0.7;
    self.view78.layer.borderWidth=0.7;
    self.view79.layer.borderWidth=0.7;
    self.view80.layer.borderWidth=0.7;
    self.view81.layer.borderWidth=0.7;
    self.view82.layer.borderWidth=0.7;
    self.view83.layer.borderWidth=0.7;
    self.view84.layer.borderWidth=0.7;
    self.view85.layer.borderWidth=0.7;
    self.view86.layer.borderWidth=0.7;
    self.view87.layer.borderWidth=0.7;
    self.view88.layer.borderWidth=0.7;
    self.view89.layer.borderWidth=0.7;
    self.view90.layer.borderWidth=0.7;
    self.view91.layer.borderWidth=0.7;
    self.view92.layer.borderWidth=0.7;
    self.view93.layer.borderWidth=0.7;
    self.view94.layer.borderWidth=0.7;
    self.view95.layer.borderWidth=0.7;
    self.view96.layer.borderWidth=0.7;
    self.view97.layer.borderWidth=0.7;
    self.view98.layer.borderWidth=0.7;
    self.view99.layer.borderWidth=0.7;
    
    self.partbut1.layer.borderWidth=1.0;
    self.partbut2.layer.borderWidth=1.0;
    self.partbut3.layer.borderWidth=1.0;
    self.partbut4.layer.borderWidth=1.0;
    self.partbut5.layer.borderWidth=1.0;
    self.difbut1.layer.borderWidth=1.0;
    self.difbut2.layer.borderWidth=1.0;
    self.difbut3.layer.borderWidth=1.0;
    self.difbut4.layer.borderWidth=1.0;
    self.difbut5.layer.borderWidth=1.0;
    
    self.btn_de_la_fin_du_montage.layer.borderWidth=1.0;
    self.btn_de_la_mise_sous_tension.layer.borderWidth=1.0;
    self.btn_de_la_mise_en_service.layer.borderWidth=1.0;
    self.btn_des_essais_plateforme.layer.borderWidth=1.0;
    
    [self.btn_du_materiel addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_des_prestations addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_du_logiciel addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_de_la_fin_du_montage addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_de_la_mise_en_service addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_de_la_mise_sous_tension addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_des_essais_plateforme addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_sauvegardes addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_Sans_Reserve addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_Nombre_de_reserves addTarget:self action:@selector(fun_OnCheckSelect:) forControlEvents:UIControlEventTouchUpInside] ;
    
    self.rating=@"0";
    
    if(self.confirmpdf==YES)
    {
        self.lbl_Emetteur.text=self.dataarray[0];
        datetf1.text=self.dataarray[1];
        self.lbl_Raison.text=self.dataarray[2];
        self.lbl_NProject.text=self.dataarray[3];
        self.lbl_Libelle.text=self.dataarray[4];
        self.lbl_Change_Affaires.text=self.dataarray[5];
        self.lbl_ChefdProj.text=self.dataarray[6];
        
        self.lbl_Liste_Nom1.text=self.dataarray[7];
        self.lbl_Liste_Nom2.text=self.dataarray[8];
        self.txt_Liste_Nom3.text=self.dataarray[9];
        self.txt_Liste_Nom4.text=self.dataarray[10];
        self.txt_Liste_Nom5.text=self.dataarray[11];
        self.lbl_Liste_Societe1.text=self.dataarray[12];
        self.lbl_Liste_Societe2.text=self.dataarray[13];
        self.lbl_Liste_Societe3.text=self.dataarray[14];
        self.lbl_Liste_Societe4.text=self.dataarray[15];
        self.lbl_Liste_Societe5.text=self.dataarray[16];
        self.lbl_Mail1.text=self.dataarray[27];
        self.lbl_Mail2.text=self.dataarray[28];
        self.txt_Mail3.text=self.dataarray[29];
        self.txt_Mail4.text=self.dataarray[30];
        self.txt_Mail5.text=self.dataarray[31];
        
        self.txt_Commande.text=self.dataarray[32];
        datetf2.text=self.dataarray[33];
        self.txt_Offre.text=self.dataarray[34];
        
        self.txt_Commande_Client.text=self.dataarray[35];
        self.txt_Commande_Fournisseur.text=self.dataarray[36];
        self.procedur_le.text=self.dataarray[40];
        
        self.txt_Les_prestations.text=self.dataarray[48];
        self.txt_Detail_des_realises.text=self.dataarray[49];
        
        self.txt_Nom_Sauvegarde1.text=self.dataarray[51];
        self.txt_Nom_Sauvegarde2.text=self.dataarray[52];
        self.txt_Nom_Sauvegarde3.text=self.dataarray[53];
        self.txt_Nom_Sauvegarde4.text=self.dataarray[54];
        self.txt_Nom_Sauvegarde5.text=self.dataarray[55];
        self.txt_Type1.text=self.dataarray[56];
        self.txt_Type2.text=self.dataarray[57];
        self.txt_Type3.text=self.dataarray[58];
        self.txt_Type4.text=self.dataarray[59];
        self.txt_Type5.text=self.dataarray[60];
        self.txt_Format1.text=self.dataarray[61];
        self.txt_Format2.text=self.dataarray[62];
        self.txt_Format3.text=self.dataarray[63];
        self.txt_Format4.text=self.dataarray[64];
        self.txt_Format5.text=self.dataarray[65];
        self.txt_Commentaire1.text=self.dataarray[66];
        self.txt_Commentaire2.text=self.dataarray[67];
        self.txt_Commentaire3.text=self.dataarray[68];
        self.txt_Commentaire4.text=self.dataarray[69];
        self.txt_Commentaire5.text=self.dataarray[70];
        
        self.txt_nombre.text=self.dataarray[73];
        
        self.txt_Nom1.text=self.dataarray[74];
        self.txt_Nom2.text=self.dataarray[75];
        self.txt_Nom3.text=self.dataarray[76];
        self.txt_Nom4.text=self.dataarray[77];
        self.txt_Societe1.text=self.dataarray[78];
        self.txt_Societe2.text=self.dataarray[79];
        self.txt_Societe3.text=self.dataarray[80];
        self.txt_Societe4.text=self.dataarray[81];
        self.txt_Fonction1.text=self.dataarray[82];
        self.txt_Fonction2.text=self.dataarray[83];
        self.txt_Fonction3.text=self.dataarray[84];
        self.txt_Fonction4.text=self.dataarray[85];
        self.txt_Date1.text=self.dataarray[86];
        self.txt_Date2.text=self.dataarray[87];
        self.txt_Date3.text=self.dataarray[88];
        self.txt_Date4.text=self.dataarray[89];
        self.txt_Visas1.text=self.dataarray[90];
        self.txt_Visas2.text=self.dataarray[91];
        self.txt_Visas3.text=self.dataarray[92];
        self.txt_Visas4.text=self.dataarray[93];
        
        self.txt_Vos_remarques.text=self.dataarray[95];
        
        self.txt_levee_Nom1.text=self.dataarray[96];
        self.txt_levee_Nom2.text=self.dataarray[97];
        self.txt_levee_Nom3.text=self.dataarray[98];
        self.txt_levee_Nom4.text=self.dataarray[99];
        self.txt_levee_Societe1.text=self.dataarray[100];
        self.txt_levee_Societe2.text=self.dataarray[101];
        self.txt_levee_Societe3.text=self.dataarray[102];
        self.txt_levee_Societe4.text=self.dataarray[103];
        self.txt_levee_Fonction1.text=self.dataarray[104];
        self.txt_levee_Fonction2.text=self.dataarray[105];
        self.txt_levee_Fonction3.text=self.dataarray[106];
        self.txt_levee_Fonction4.text=self.dataarray[107];
        self.txt_levee_Date1.text=self.dataarray[108];
        self.txt_levee_Date2.text=self.dataarray[109];
        self.txt_levee_Date3.text=self.dataarray[110];
        self.txt_levee_Date4.text=self.dataarray[111];
        self.txt_levee_Visas1.text=self.dataarray[112];
        self.txt_levee_Visas2.text=self.dataarray[113];
        self.txt_levee_Visas3.text=self.dataarray[114];
        self.txt_levee_Visas4.text=self.dataarray[115];
        
        self.txt_Reserve1.text=self.dataarray[116];
        self.txt_Reserve2.text=self.dataarray[117];
        self.txt_Reserve3.text=self.dataarray[118];
        self.txt_Reserve4.text=self.dataarray[119];
        self.txt_Reserve5.text=self.dataarray[120];
        self.txt_Reserve6.text=self.dataarray[121];
        self.txt_Reserve7.text=self.dataarray[122];
        self.txt_Reserve8.text=self.dataarray[123];
        self.txt_Reserve9.text=self.dataarray[124];
        self.txt_Reserve10.text=self.dataarray[125];
        self.txt_Reserve11.text=self.dataarray[126];
        self.txt_Reserve12.text=self.dataarray[127];
        self.txt_Reserve13.text=self.dataarray[128];
        self.txt_Reserve14.text=self.dataarray[129];
        self.txt_Reserve15.text=self.dataarray[130];
        
        self.txt_Action1.text=self.dataarray[131];
        self.txt_Action2.text=self.dataarray[132];
        self.txt_Action3.text=self.dataarray[133];
        self.txt_Action4.text=self.dataarray[134];
        self.txt_Action5.text=self.dataarray[135];
        self.txt_Action6.text=self.dataarray[136];
        self.txt_Action7.text=self.dataarray[137];
        self.txt_Action8.text=self.dataarray[138];
        self.txt_Action9.text=self.dataarray[139];
        self.txt_Action10.text=self.dataarray[140];
        self.txt_Action11.text=self.dataarray[141];
        self.txt_Action12.text=self.dataarray[142];
        self.txt_Action13.text=self.dataarray[143];
        self.txt_Action14.text=self.dataarray[144];
        self.txt_Action15.text=self.dataarray[145];
        
        self.txt_Pilote1.text=self.dataarray[146];
        self.txt_Pilote2.text=self.dataarray[147];
        self.txt_Pilote3.text=self.dataarray[148];
        self.txt_Pilote4.text=self.dataarray[149];
        self.txt_Pilote5.text=self.dataarray[150];
        self.txt_Pilote6.text=self.dataarray[151];
        self.txt_Pilote7.text=self.dataarray[152];
        self.txt_Pilote8.text=self.dataarray[153];
        self.txt_Pilote9.text=self.dataarray[154];
        self.txt_Pilote10.text=self.dataarray[155];
        self.txt_Pilote11.text=self.dataarray[156];
        self.txt_Pilote12.text=self.dataarray[157];
        self.txt_Pilote13.text=self.dataarray[158];
        self.txt_Pilote14.text=self.dataarray[159];
        self.txt_Pilote15.text=self.dataarray[160];
        
        self.txt_Obj_Date1.text=self.dataarray[161];
        self.txt_Obj_Date2.text=self.dataarray[162];
        self.txt_Obj_Date3.text=self.dataarray[163];
        self.txt_Obj_Date4.text=self.dataarray[164];
        self.txt_Obj_Date5.text=self.dataarray[165];
        self.txt_Obj_Date6.text=self.dataarray[166];
        self.txt_Obj_Date7.text=self.dataarray[167];
        self.txt_Obj_Date8.text=self.dataarray[168];
        self.txt_Obj_Date9.text=self.dataarray[169];
        self.txt_Obj_Date10.text=self.dataarray[170];
        self.txt_Obj_Date11.text=self.dataarray[171];
        self.txt_Obj_Date12.text=self.dataarray[172];
        self.txt_Obj_Date13.text=self.dataarray[173];
        self.txt_Obj_Date14.text=self.dataarray[174];
        self.txt_Obj_Date15.text=self.dataarray[175];
        
        //For Buttons
        
        NSString *strb1=self.dataarray[17];
        NSString *strb2=@"Yes";
        if([strb1 isEqualToString:strb2])
        {
            [self.partbut1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb3=self.dataarray[18];
        if([strb3 isEqualToString:strb2])
        {
            [self.partbut2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb5=self.dataarray[19];
        if([strb5 isEqualToString:strb2])
        {
            [self.partbut3 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb7=self.dataarray[20];
        if([strb7 isEqualToString:strb2])
        {
            [self.partbut4 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb9=self.dataarray[21];
        if([strb9 isEqualToString:strb2])
        {
            [self.partbut5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb11=self.dataarray[22];
        if([strb11 isEqualToString:strb2])
        {
            [self.difbut1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb13=self.dataarray[23];
        if([strb13 isEqualToString:strb2])
        {
            [self.difbut2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb15=self.dataarray[24];
        if([strb15 isEqualToString:strb2])
        {
            [self.difbut3 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb17=self.dataarray[25];
        if([strb17 isEqualToString:strb2])
        {
            [self.difbut4 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb19=self.dataarray[26];
        if([strb19 isEqualToString:strb2])
        {
            [self.difbut5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb21=self.dataarray[37];
        if([strb21 isEqualToString:strb2])
        {
            [self.btn_Plate_forme setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb23=self.dataarray[38];
        if([strb23 isEqualToString:strb2])
        {
            [self.btn_Fournisseur setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb25=self.dataarray[39];
        if([strb25 isEqualToString:strb2])
        {
            [self.btn_Site_Client setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb27=self.dataarray[41];
        if([strb27 isEqualToString:strb2])
        {
            [self.btn_du_materiel setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb29=self.dataarray[42];
        if([strb29 isEqualToString:strb2])
        {
            [self.btn_des_prestations setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb31=self.dataarray[43];
        if([strb31 isEqualToString:strb2])
        {
            [self.btn_du_logiciel setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb33=self.dataarray[44];
        if([strb33 isEqualToString:strb2])
        {
            [self.btn_de_la_fin_du_montage setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb35=self.dataarray[45];
        if([strb35 isEqualToString:strb2])
        {
            [self.btn_de_la_mise_sous_tension setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb37=self.dataarray[46];
        if([strb37 isEqualToString:strb2])
        {
            [self.btn_de_la_mise_en_service setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb39=self.dataarray[47];
        if([strb39 isEqualToString:strb2])
        {
            [self.btn_des_essais_plateforme setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb41=self.dataarray[50];
        if([strb41 isEqualToString:strb2])
        {
            [self.btn_sauvegardes setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb43=self.dataarray[71];
        if([strb43 isEqualToString:strb2])
        {
            [self.btn_Sans_Reserve setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb45=self.dataarray[72];
        if([strb45 isEqualToString:strb2])
        {
            [self.btn_Nombre_de_reserves setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        NSString *strb48=self.dataarray[94];
        NSString *rat_st=strb48;
        self.rating = rat_st ;
        NSString *st0=@"0";
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

        if([rat_st isEqualToString:st0])
        {
            [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        }
        else if([rat_st isEqualToString:st1])
        {
            [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
            
        }
        else if([rat_st isEqualToString:st2])
        {
            [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
            
        }
        else if([rat_st isEqualToString:st3])
        {
            [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        }
        
        else if([rat_st isEqualToString:st4])
        {
            [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
            
        }
        else if([rat_st isEqualToString:st5])
        {
            [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
            
        }
        else if([rat_st isEqualToString:st6])
        {
            [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
            
        }
        else if([rat_st isEqualToString:st7])
        {
            [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
            
        }
        else if([rat_st isEqualToString:st8])
        {
            [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
            
        }
        else if([rat_st isEqualToString:st9])
        {
            [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
            
        }
        else if([rat_st isEqualToString:st10])
        {
            [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
            
        }
        
        //For Signature
        
        if (self.arrayimage1.count!=0)
        {
            NSString *datas1=self.arrayimage1[0];
            NSData *data=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image=[[UIImage alloc]init];
            image=[UIImage imageWithData:data];
            [self.img_Solde1 setImage:image];
        }
        if (self.arrayimage2.count!=0)
        {
        NSString *datas2=self.arrayimage2[0];
        NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image1=[[UIImage alloc]init];
        image1=[UIImage imageWithData:data2];
        [self.img_Solde2 setImage:image1];
        }
        if (self.arrayimage3.count!=0)
        {
        NSString *datas3=self.arrayimage3[0];
        NSData *data3=[[NSData alloc]initWithBase64EncodedData:datas3 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image3=[[UIImage alloc]init];
        image3=[UIImage imageWithData:data3];
        [self.img_Solde3 setImage:image3];
        }
        if (self.arrayimage4.count!=0)
        {
        NSString *datas4=self.arrayimage4[0];
        NSData *data4=[[NSData alloc]initWithBase64EncodedData:datas4 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image4=[[UIImage alloc]init];
        image4=[UIImage imageWithData:data4];
        [self.img_Solde4 setImage:image4];
        }
        if (self.arrayimage5.count!=0)
        {
        NSString *datas5=self.arrayimage5[0];
        NSData *data5=[[NSData alloc]initWithBase64EncodedData:datas5 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image5=[[UIImage alloc]init];
        image5=[UIImage imageWithData:data5];
        [self.img_Solde5 setImage:image5];
        }
        if (self.arrayimage6.count!=0)
        {
        NSString *datas6=self.arrayimage6[0];
        NSData *data6=[[NSData alloc]initWithBase64EncodedData:datas6 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image6=[[UIImage alloc]init];
        image6=[UIImage imageWithData:data6];
        [self.img_Solde6 setImage:image6];
        }
        if (self.arrayimage7.count!=0)
        {
        NSString *datas7=self.arrayimage7[0];
        NSData *data7=[[NSData alloc]initWithBase64EncodedData:datas7 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image7=[[UIImage alloc]init];
        image7=[UIImage imageWithData:data7];
        [self.img_Solde7 setImage:image7];
        }
        if (self.arrayimage8.count!=0)
        {
        NSString *datas8=self.arrayimage8[0];
        NSData *data8=[[NSData alloc]initWithBase64EncodedData:datas8 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image8=[[UIImage alloc]init];
        image8=[UIImage imageWithData:data8];
        [self.img_Solde8 setImage:image8];
        }
        if (self.arrayimage9.count!=0)
        {
        NSString *datas9=self.arrayimage9[0];
        NSData *data9=[[NSData alloc]initWithBase64EncodedData:datas9 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image9=[[UIImage alloc]init];
        image9=[UIImage imageWithData:data9];
        [self.img_Solde9 setImage:image9];
        }
        if (self.arrayimage10.count!=0)
        {
        NSString *datas10=self.arrayimage10[0];
        NSData *data10=[[NSData alloc]initWithBase64EncodedData:datas10 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image10=[[UIImage alloc]init];
        image10=[UIImage imageWithData:data10];
        [self.img_Solde10 setImage:image10];
        }
        if (self.arrayimage11.count!=0)
        {
        NSString *datas11=self.arrayimage11[0];
        NSData *data11=[[NSData alloc]initWithBase64EncodedData:datas11 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image11=[[UIImage alloc]init];
        image11=[UIImage imageWithData:data11];
        [self.img_Solde11 setImage:image11];
        }
        if (self.arrayimage12.count!=0)
        {
        NSString *datas12=self.arrayimage12[0];
        NSData *data12=[[NSData alloc]initWithBase64EncodedData:datas12 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image12=[[UIImage alloc]init];
        image12=[UIImage imageWithData:data12];
        [self.img_Solde12 setImage:image12];
        }
        if (self.arrayimage13.count!=0)
        {
        NSString *datas13=self.arrayimage13[0];
        NSData *data13=[[NSData alloc]initWithBase64EncodedData:datas13 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image13=[[UIImage alloc]init];
        image13=[UIImage imageWithData:data13];
        [self.img_Solde13 setImage:image13];
        }
        if (self.arrayimage14.count!=0)
        {
        NSString *datas14=self.arrayimage14[0];
        NSData *data14=[[NSData alloc]initWithBase64EncodedData:datas14 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image14=[[UIImage alloc]init];
        image14=[UIImage imageWithData:data14];
        [self.img_Solde14 setImage:image14];
        }
        if (self.arrayimage15.count!=0)
        {
        NSString *datas15=self.arrayimage15[0];
        NSData *data15=[[NSData alloc]initWithBase64EncodedData:datas15 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image15=[[UIImage alloc]init];
        image15=[UIImage imageWithData:data15];
        [self.img_Solde15 setImage:image15];
        }
    }
    
//    if(self.IsForUpdating==YES)
//    {
//        //For Text items
//        
//        self.txt_nombre.text=(self.retrievedarray)[0][@"nombre_de_reserves"];
//        self.lbl_Emetteur.text=(self.retrievedarray)[0][@"emetteur"];
//        datetf1.text=(self.retrievedarray)[0][@"date"];
//        self.lbl_Raison.text=(self.retrievedarray)[0][@"raison"];
//        self.lbl_NProject.text=(self.retrievedarray)[0][@"project_avenant"];
//        self.lbl_Libelle.text=(self.retrievedarray)[0][@"libelle"];
//        self.lbl_Change_Affaires.text=(self.retrievedarray)[0][@"affaires"];
//        self.lbl_ChefdProj.text=(self.retrievedarray)[0][@"chef_de_projet"];
//        
//        self.lbl_Liste_Nom1.text=(self.retrievedarray)[0][@"noms_1"];
//        self.lbl_Liste_Nom2.text=(self.retrievedarray)[0][@"noms_2"];
//        self.txt_Liste_Nom3.text=(self.retrievedarray)[0][@"noms_3"];
//        self.txt_Liste_Nom4.text=(self.retrievedarray)[0][@"noms_4"];
//        self.txt_Liste_Nom5.text=(self.retrievedarray)[0][@"noms_5"];
//        self.lbl_Liste_Societe1.text=(self.retrievedarray)[0][@"societe_1"];
//        self.lbl_Liste_Societe2.text=(self.retrievedarray)[0][@"societe_2"];
//        self.lbl_Liste_Societe3.text=(self.retrievedarray)[0][@"societe_3"];
//        self.lbl_Liste_Societe4.text=(self.retrievedarray)[0][@"societe_4"];
//        self.lbl_Liste_Societe5.text=(self.retrievedarray)[0][@"societe_5"];
//        self.lbl_Mail1.text=(self.retrievedarray)[0][@"mail_1"];
//        self.lbl_Mail2.text=(self.retrievedarray)[0][@"mail_2"];
//        self.txt_Mail3.text=(self.retrievedarray)[0][@"mail_3"];
//        self.txt_Mail4.text=(self.retrievedarray)[0][@"mail_4"];
//        self.txt_Mail5.text=(self.retrievedarray)[0][@"mail_5"];
//        
//        self.txt_Commande.text=(self.retrievedarray)[0][@"commande_n"];
//        datetf2.text=(self.retrievedarray)[0][@"commande_du"];
//        self.txt_Offre.text=(self.retrievedarray)[0][@"offre_n"];
//        
//        self.txt_Commande_Client.text=(self.retrievedarray)[0][@"no_commande_client"];
//        self.txt_Commande_Fournisseur.text=(self.retrievedarray)[0][@"commande_fournisseur"];
//        self.procedur_le.text=(self.retrievedarray)[0][@"procedure_le"];
//        
//        self.txt_Les_prestations.text=(self.retrievedarray)[0][@"les_prestations"];
//        self.txt_Detail_des_realises.text=(self.retrievedarray)[0][@"detail_des"];
//        
//        self.txt_Nom_Sauvegarde1.text=(self.retrievedarray)[0][@"nom_sauvegardes_1"];
//        self.txt_Nom_Sauvegarde2.text=(self.retrievedarray)[0][@"nom_sauvegardes_2"];
//        self.txt_Nom_Sauvegarde3.text=(self.retrievedarray)[0][@"nom_sauvegardes_3"];
//        self.txt_Nom_Sauvegarde4.text=(self.retrievedarray)[0][@"nom_sauvegardes_4"];
//        self.txt_Nom_Sauvegarde5.text=(self.retrievedarray)[0][@"nom_sauvegardes_5"];
//        self.txt_Type1.text=(self.retrievedarray)[0][@"type_1"];
//        self.txt_Type2.text=(self.retrievedarray)[0][@"type_2"];
//        self.txt_Type3.text=(self.retrievedarray)[0][@"type_3"];
//        self.txt_Type4.text=(self.retrievedarray)[0][@"type_4"];
//        self.txt_Type5.text=(self.retrievedarray)[0][@"type_5"];
//        self.txt_Format1.text=(self.retrievedarray)[0][@"format_1"];
//        self.txt_Format2.text=(self.retrievedarray)[0][@"format_2"];
//        self.txt_Format3.text=(self.retrievedarray)[0][@"format_3"];
//        self.txt_Format4.text=(self.retrievedarray)[0][@"format_4"];
//        self.txt_Format5.text=(self.retrievedarray)[0][@"format_5"];
//        self.txt_Commentaire1.text=(self.retrievedarray)[0][@"commentaire_1"];
//        self.txt_Commentaire2.text=(self.retrievedarray)[0][@"commentaire_2"];
//        self.txt_Commentaire3.text=(self.retrievedarray)[0][@"commentaire_3"];
//        self.txt_Commentaire4.text=(self.retrievedarray)[0][@"commentaire_4"];
//        self.txt_Commentaire5.text=(self.retrievedarray)[0][@"commentaire_5"];
//        
//        self.txt_Nom1.text=(self.retrievedarray)[0][@"jour_nom1"];
//        self.txt_Nom2.text=(self.retrievedarray)[0][@"jour_nom2"];
//        self.txt_Nom3.text=(self.retrievedarray)[0][@"jour_nom3"];
//        self.txt_Nom4.text=(self.retrievedarray)[0][@"jour_nom4"];
//        self.txt_Societe1.text=(self.retrievedarray)[0][@"societe1"];
//        self.txt_Societe2.text=(self.retrievedarray)[0][@"societe2"];
//        self.txt_Societe3.text=(self.retrievedarray)[0][@"societe3"];
//        self.txt_Societe4.text=(self.retrievedarray)[0][@"societe4"];
//        self.txt_Fonction1.text=(self.retrievedarray)[0][@"fonction1"];
//        self.txt_Fonction2.text=(self.retrievedarray)[0][@"fonction2"];
//        self.txt_Fonction3.text=(self.retrievedarray)[0][@"fonction3"];
//        self.txt_Fonction4.text=(self.retrievedarray)[0][@"fonction4"];
//        self.txt_Date1.text=(self.retrievedarray)[0][@"jour_date1"];
//        self.txt_Date2.text=(self.retrievedarray)[0][@"jour_date2"];
//        self.txt_Date3.text=(self.retrievedarray)[0][@"jour_date3"];
//        self.txt_Date4.text=(self.retrievedarray)[0][@"jour_date4"];
//        self.txt_Visas1.text=(self.retrievedarray)[0][@"visas1"];
//        self.txt_Visas2.text=(self.retrievedarray)[0][@"visas2"];
//        self.txt_Visas3.text=(self.retrievedarray)[0][@"visas3"];
//        self.txt_Visas4.text=(self.retrievedarray)[0][@"visas4"];
//        
//        self.txt_Vos_remarques.text=(self.retrievedarray)[0][@"vos_remarques"];
//        
//        self.txt_levee_Nom1.text=(self.retrievedarray)[0][@"levee_nom1"];
//        self.txt_levee_Nom2.text=(self.retrievedarray)[0][@"levee_nom2"];
//        self.txt_levee_Nom3.text=(self.retrievedarray)[0][@"levee_nom3"];
//        self.txt_levee_Nom4.text=(self.retrievedarray)[0][@"levee_nom4"];
//        self.txt_levee_Societe1.text=(self.retrievedarray)[0][@"levee_societe1"];
//        self.txt_levee_Societe2.text=(self.retrievedarray)[0][@"levee_societe2"];
//        self.txt_levee_Societe3.text=(self.retrievedarray)[0][@"levee_societe3"];
//        self.txt_levee_Societe4.text=(self.retrievedarray)[0][@"levee_societe4"];
//        self.txt_levee_Fonction1.text=(self.retrievedarray)[0][@"levee_fonction1"];
//        self.txt_levee_Fonction2.text=(self.retrievedarray)[0][@"levee_fonction2"];
//        self.txt_levee_Fonction3.text=(self.retrievedarray)[0][@"levee_fonction3"];
//        self.txt_levee_Fonction4.text=(self.retrievedarray)[0][@"levee_fonction4"];
//        self.txt_levee_Date1.text=(self.retrievedarray)[0][@"levee_date1"];
//        self.txt_levee_Date2.text=(self.retrievedarray)[0][@"levee_date2"];
//        self.txt_levee_Date3.text=(self.retrievedarray)[0][@"levee_date3"];
//        self.txt_levee_Date4.text=(self.retrievedarray)[0][@"levee_date4"];
//        self.txt_levee_Visas1.text=(self.retrievedarray)[0][@"levee_visas1"];
//        self.txt_levee_Visas2.text=(self.retrievedarray)[0][@"levee_visas2"];
//        self.txt_levee_Visas3.text=(self.retrievedarray)[0][@"levee_visas3"];
//        self.txt_levee_Visas4.text=(self.retrievedarray)[0][@"levee_visas4"];
//        
//        self.txt_Reserve1.text=(self.retrievedarray)[0][@"reserve_1"];
//        self.txt_Reserve2.text=(self.retrievedarray)[0][@"reserve_2"];
//        self.txt_Reserve3.text=(self.retrievedarray)[0][@"reserve_3"];
//        self.txt_Reserve4.text=(self.retrievedarray)[0][@"reserve_four"];
//        self.txt_Reserve5.text=(self.retrievedarray)[0][@"reserve_5"];
//        self.txt_Reserve6.text=(self.retrievedarray)[0][@"reserve_6"];
//        self.txt_Reserve7.text=(self.retrievedarray)[0][@"reserve_7"];
//        self.txt_Reserve8.text=(self.retrievedarray)[0][@"reserve_8"];
//        self.txt_Reserve9.text=(self.retrievedarray)[0][@"reserve_9"];
//        self.txt_Reserve10.text=(self.retrievedarray)[0][@"reserve_10"];
//        self.txt_Reserve11.text=(self.retrievedarray)[0][@"reserve_11"];
//        self.txt_Reserve12.text=(self.retrievedarray)[0][@"reserve_12"];
//        self.txt_Reserve13.text=(self.retrievedarray)[0][@"reserve_13"];
//        self.txt_Reserve14.text=(self.retrievedarray)[0][@"reserve_14"];
//        self.txt_Reserve15.text=(self.retrievedarray)[0][@"reserve_15"];
//        
//        self.txt_Action1.text=(self.retrievedarray)[0][@"actions_1"];
//        self.txt_Action2.text=(self.retrievedarray)[0][@"actions_2"];
//        self.txt_Action3.text=(self.retrievedarray)[0][@"actions_3"];
//        self.txt_Action4.text=(self.retrievedarray)[0][@"actions_4"];
//        self.txt_Action5.text=(self.retrievedarray)[0][@"actions_5"];
//        self.txt_Action6.text=(self.retrievedarray)[0][@"actions_6"];
//        self.txt_Action7.text=(self.retrievedarray)[0][@"actions_7"];
//        self.txt_Action8.text=(self.retrievedarray)[0][@"actions_8"];
//        self.txt_Action9.text=(self.retrievedarray)[0][@"actions_9"];
//        self.txt_Action10.text=(self.retrievedarray)[0][@"actions_10"];
//        self.txt_Action11.text=(self.retrievedarray)[0][@"actions_11"];
//        self.txt_Action12.text=(self.retrievedarray)[0][@"actions_12"];
//        self.txt_Action13.text=(self.retrievedarray)[0][@"actions_13"];
//        self.txt_Action14.text=(self.retrievedarray)[0][@"actions_14"];
//        self.txt_Action15.text=(self.retrievedarray)[0][@"actions_15"];
//        
//        self.txt_Pilote1.text=(self.retrievedarray)[0][@"pilote_1"];
//        self.txt_Pilote2.text=(self.retrievedarray)[0][@"pilote_2"];
//        self.txt_Pilote3.text=(self.retrievedarray)[0][@"pilote_3"];
//        self.txt_Pilote4.text=(self.retrievedarray)[0][@"pilote_4"];
//        self.txt_Pilote5.text=(self.retrievedarray)[0][@"pilote_5"];
//        self.txt_Pilote6.text=(self.retrievedarray)[0][@"pilote_6"];
//        self.txt_Pilote7.text=(self.retrievedarray)[0][@"pilote_7"];
//        self.txt_Pilote8.text=(self.retrievedarray)[0][@"pilote_8"];
//        self.txt_Pilote9.text=(self.retrievedarray)[0][@"pilote_9"];
//        self.txt_Pilote10.text=(self.retrievedarray)[0][@"pilote_10"];
//        self.txt_Pilote11.text=(self.retrievedarray)[0][@"pilote_11"];
//        self.txt_Pilote12.text=(self.retrievedarray)[0][@"pilote_12"];
//        self.txt_Pilote13.text=(self.retrievedarray)[0][@"pilote_13"];
//        self.txt_Pilote14.text=(self.retrievedarray)[0][@"pilote_14"];
//        self.txt_Pilote15.text=(self.retrievedarray)[0][@"pilote_15"];
//        
//        self.txt_Obj_Date1.text=(self.retrievedarray)[0][@"objectif_1"];
//        self.txt_Obj_Date2.text=(self.retrievedarray)[0][@"objectif_2"];
//        self.txt_Obj_Date3.text=(self.retrievedarray)[0][@"objectif_3"];
//        self.txt_Obj_Date4.text=(self.retrievedarray)[0][@"objectif_4"];
//        self.txt_Obj_Date5.text=(self.retrievedarray)[0][@"objectif_5"];
//        self.txt_Obj_Date6.text=(self.retrievedarray)[0][@"objectif_6"];
//        self.txt_Obj_Date7.text=(self.retrievedarray)[0][@"objectif_7"];
//        self.txt_Obj_Date8.text=(self.retrievedarray)[0][@"objectif_8"];
//        self.txt_Obj_Date9.text=(self.retrievedarray)[0][@"objectif_9"];
//        self.txt_Obj_Date10.text=(self.retrievedarray)[0][@"objectif_10"];
//        self.txt_Obj_Date11.text=(self.retrievedarray)[0][@"objectif_11"];
//        self.txt_Obj_Date12.text=(self.retrievedarray)[0][@"objectif_12"];
//        self.txt_Obj_Date13.text=(self.retrievedarray)[0][@"objectif_13"];
//        self.txt_Obj_Date14.text=(self.retrievedarray)[0][@"objectif_14"];
//        self.txt_Obj_Date15.text=(self.retrievedarray)[0][@"objectif_15"];
//        
//        
//        //For Button items
//        
//        NSString *strb1=(self.retrievedarray)[0] [@"participant_1"];
//        NSString *strb2=@"Yes";
//        if([strb1 isEqualToString:strb2])
//        {
//            [self.partbut1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb3=(self.retrievedarray)[0] [@"participant_2"];
//        if([strb3 isEqualToString:strb2])
//        {
//            [self.partbut2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb5=(self.retrievedarray)[0] [@"participant_3"];
//        if([strb5 isEqualToString:strb2])
//        {
//            [self.partbut3 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb7=(self.retrievedarray)[0] [@"participant_4"];
//        if([strb7 isEqualToString:strb2])
//        {
//            [self.partbut4 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb9=(self.retrievedarray)[0] [@"participant_5"];
//        if([strb9 isEqualToString:strb2])
//        {
//            [self.partbut5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb11=(self.retrievedarray)[0] [@"diffusion_1"];
//        if([strb11 isEqualToString:strb2])
//        {
//            [self.difbut1 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb13=(self.retrievedarray)[0] [@"diffusion_2"];
//        if([strb13 isEqualToString:strb2])
//        {
//            [self.difbut2 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb15=(self.retrievedarray)[0] [@"diffusion_3"];
//        if([strb15 isEqualToString:strb2])
//        {
//            [self.difbut3 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb17=(self.retrievedarray)[0] [@"diffusion_4"];
//        if([strb17 isEqualToString:strb2])
//        {
//            [self.difbut4 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb19=(self.retrievedarray)[0] [@"diffusion_5"];
//        if([strb19 isEqualToString:strb2])
//        {
//            [self.difbut5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb21=(self.retrievedarray)[0] [@"plate_forme"];
//        if([strb21 isEqualToString:strb2])
//        {
//            [self.btn_Plate_forme setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb23=(self.retrievedarray)[0] [@"fournisseur"];
//        if([strb23 isEqualToString:strb2])
//        {
//            [self.btn_Fournisseur setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb25=(self.retrievedarray)[0] [@"site_client"];
//        if([strb25 isEqualToString:strb2])
//        {
//            [self.btn_Site_Client setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb27=(self.retrievedarray)[0] [@"du_material"];
//        if([strb27 isEqualToString:strb2])
//        {
//            [self.btn_du_materiel setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb29=(self.retrievedarray)[0] [@"des_prestations"];
//        if([strb29 isEqualToString:strb2])
//        {
//            [self.btn_des_prestations setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb31=(self.retrievedarray)[0] [@"du_logiciel"];
//        if([strb31 isEqualToString:strb2])
//        {
//            [self.btn_du_logiciel setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb33=(self.retrievedarray)[0] [@"de_la_montage"];
//        if([strb33 isEqualToString:strb2])
//        {
//            [self.btn_de_la_fin_du_montage setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb35=(self.retrievedarray)[0] [@"de_la_tension"];
//        if([strb35 isEqualToString:strb2])
//        {
//            [self.btn_de_la_mise_sous_tension setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb37=(self.retrievedarray)[0] [@"de_la_service"];
//        if([strb37 isEqualToString:strb2])
//        {
//            [self.btn_de_la_mise_en_service setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb39=(self.retrievedarray)[0] [@"des_essais_plateforme"];
//        if([strb39 isEqualToString:strb2])
//        {
//            [self.btn_des_essais_plateforme setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb41=(self.retrievedarray)[0] [@"sauvegardes"];
//        if([strb41 isEqualToString:strb2])
//        {
//            [self.btn_sauvegardes setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb43=(self.retrievedarray)[0] [@"sans_reserve"];
//        if([strb43 isEqualToString:strb2])
//        {
//            [self.btn_Sans_Reserve setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSString *strb45=(self.retrievedarray)[0] [@"nomre_de_reserves"];
//        if([strb45 isEqualToString:strb2])
//        {
//            [self.btn_Nombre_de_reserves setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
//        }
//        
//        NSNumber *strb48=(self.retrievedarray)[0] [@"votsat_rating"];
//        NSString *rat_st=[strb48 stringValue];
//        self.rating = rat_st ;
//        NSString *st0=@"0";
//        NSString *st1=@"1";
//        NSString *st2=@"2";
//        NSString *st3=@"3";
//        NSString *st4=@"4";
//        NSString *st5=@"5";
//        NSString *st6=@"6";
//        NSString *st7=@"7";
//        NSString *st8=@"8";
//        NSString *st9=@"9";
//        NSString *st10=@"10";
//        
//        if([rat_st isEqualToString:st0])
//        {
//            [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        else if([rat_st isEqualToString:st1])
//        {
//            [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        else if([rat_st isEqualToString:st2])
//        {
//            [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        else if([rat_st isEqualToString:st3])
//        {
//            [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        
//        else if([rat_st isEqualToString:st4])
//        {
//            [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        else if([rat_st isEqualToString:st5])
//        {
//            [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        else if([rat_st isEqualToString:st6])
//        {
//            [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        else if([rat_st isEqualToString:st7])
//        {
//            [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        else if([rat_st isEqualToString:st8])
//        {
//            [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        else if([rat_st isEqualToString:st9])
//        {
//            [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        else if([rat_st isEqualToString:st10])
//        {
//            [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
//            
//        }
//        
//        // For Signature
//        
//        
//        NSString *datas1=(self.retrievedarray)[0][@"solde_1"];
//        NSData *data=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image=[[UIImage alloc]init];
//        image=[UIImage imageWithData:data];
//        [self.img_Solde1 setImage:image];
//        
//        NSString *datas2=(self.retrievedarray)[0][@"solde_2"];
//        NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image1=[[UIImage alloc]init];
//        image1=[UIImage imageWithData:data2];
//        [self.img_Solde2 setImage:image1];
//        
//        NSString *datas3=(self.retrievedarray)[0][@"solde_3"];
//        NSData *data3=[[NSData alloc]initWithBase64EncodedData:datas3 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image3=[[UIImage alloc]init];
//        image3=[UIImage imageWithData:data3];
//        [self.img_Solde3 setImage:image3];
//        
//        NSString *datas4=(self.retrievedarray)[0][@"solde_4"];
//        NSData *data4=[[NSData alloc]initWithBase64EncodedData:datas4 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image4=[[UIImage alloc]init];
//        image4=[UIImage imageWithData:data4];
//        [self.img_Solde4 setImage:image4];
//        
//        NSString *datas5=(self.retrievedarray)[0][@"solde_5"];
//        NSData *data5=[[NSData alloc]initWithBase64EncodedData:datas5 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image5=[[UIImage alloc]init];
//        image5=[UIImage imageWithData:data5];
//        [self.img_Solde5 setImage:image5];
//        
//        NSString *datas6=(self.retrievedarray)[0][@"solde_6"];
//        NSData *data6=[[NSData alloc]initWithBase64EncodedData:datas6 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image6=[[UIImage alloc]init];
//        image6=[UIImage imageWithData:data6];
//        [self.img_Solde6 setImage:image6];
//        
//        NSString *datas7=(self.retrievedarray)[0][@"solde_7"];
//        NSData *data7=[[NSData alloc]initWithBase64EncodedData:datas7 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image7=[[UIImage alloc]init];
//        image7=[UIImage imageWithData:data7];
//        [self.img_Solde7 setImage:image7];
//        
//        NSString *datas8=(self.retrievedarray)[0][@"solde_8"];
//        NSData *data8=[[NSData alloc]initWithBase64EncodedData:datas8 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image8=[[UIImage alloc]init];
//        image8=[UIImage imageWithData:data8];
//        [self.img_Solde8 setImage:image8];
//        
//        NSString *datas9=(self.retrievedarray)[0][@"solde_9"];
//        NSData *data9=[[NSData alloc]initWithBase64EncodedData:datas9 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image9=[[UIImage alloc]init];
//        image9=[UIImage imageWithData:data9];
//        [self.img_Solde9 setImage:image9];
//        
//        NSString *datas10=(self.retrievedarray)[0][@"solde_10"];
//        NSData *data10=[[NSData alloc]initWithBase64EncodedData:datas10 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image10=[[UIImage alloc]init];
//        image10=[UIImage imageWithData:data10];
//        [self.img_Solde10 setImage:image10];
//        
//        NSString *datas11=(self.retrievedarray)[0][@"solde_11"];
//        NSData *data11=[[NSData alloc]initWithBase64EncodedData:datas11 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image11=[[UIImage alloc]init];
//        image11=[UIImage imageWithData:data11];
//        [self.img_Solde11 setImage:image11];
//        
//        NSString *datas12=(self.retrievedarray)[0][@"solde_12"];
//        NSData *data12=[[NSData alloc]initWithBase64EncodedData:datas12 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image12=[[UIImage alloc]init];
//        image12=[UIImage imageWithData:data12];
//        [self.img_Solde12 setImage:image12];
//        
//        NSString *datas13=(self.retrievedarray)[0][@"solde_13"];
//        NSData *data13=[[NSData alloc]initWithBase64EncodedData:datas13 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image13=[[UIImage alloc]init];
//        image13=[UIImage imageWithData:data13];
//        [self.img_Solde13 setImage:image13];
//        
//        NSString *datas14=(self.retrievedarray)[0][@"solde_14"];
//        NSData *data14=[[NSData alloc]initWithBase64EncodedData:datas14 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image14=[[UIImage alloc]init];
//        image14=[UIImage imageWithData:data14];
//        [self.img_Solde14 setImage:image14];
//        
//        NSString *datas15=(self.retrievedarray)[0][@"solde_15"];
//        NSData *data15=[[NSData alloc]initWithBase64EncodedData:datas15 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//        UIImage *image15=[[UIImage alloc]init];
//        image15=[UIImage imageWithData:data15];
//        [self.img_Solde15 setImage:image15];
//    }
    
    self.txt_Reserve14.delegate=self;
    self.txt_Action14.delegate=self;
    self.txt_Pilote14.delegate=self;
    self.txt_Obj_Date14.delegate=self;
    
    self.txt_Reserve15.delegate=self;
    self.txt_Action15.delegate=self;
    self.txt_Pilote15.delegate=self;
    self.txt_Obj_Date15.delegate=self;
    
}


-(void)viewDidAppear:(BOOL)animated
{
    self.lbl_Emetteur.userInteractionEnabled=FALSE;
    datetf1.userInteractionEnabled=FALSE;
    self.lbl_Raison.userInteractionEnabled=FALSE;
    self.lbl_NProject.userInteractionEnabled=FALSE;
    self.lbl_Libelle.userInteractionEnabled=FALSE;
    self.lbl_Change_Affaires.userInteractionEnabled=FALSE;
    self.lbl_ChefdProj.userInteractionEnabled=FALSE;
    
    self.lbl_Liste_Nom1.userInteractionEnabled=FALSE;
    self.lbl_Liste_Nom2.userInteractionEnabled=FALSE;
    self.txt_Liste_Nom3.userInteractionEnabled=FALSE;
    self.txt_Liste_Nom4.userInteractionEnabled=FALSE;
    self.txt_Liste_Nom5.userInteractionEnabled=FALSE;
    self.lbl_Liste_Societe1.userInteractionEnabled=FALSE;
    self.lbl_Liste_Societe2.userInteractionEnabled=FALSE;
    self.lbl_Liste_Societe3.userInteractionEnabled=FALSE;
    self.lbl_Liste_Societe4.userInteractionEnabled=FALSE;
    self.lbl_Liste_Societe5.userInteractionEnabled=FALSE;
    self.lbl_Mail1.userInteractionEnabled=FALSE;
    self.lbl_Mail2.userInteractionEnabled=FALSE;
    self.txt_Mail3.userInteractionEnabled=FALSE;
    self.txt_Mail4.userInteractionEnabled=FALSE;
    self.txt_Mail5.userInteractionEnabled=FALSE;
    
    self.txt_Commande.userInteractionEnabled=FALSE;
    datetf2.userInteractionEnabled=FALSE;
    self.txt_Offre.userInteractionEnabled=FALSE;
    
    self.txt_Commande_Client.userInteractionEnabled=FALSE;
    self.txt_Commande_Fournisseur.userInteractionEnabled=FALSE;
    self.procedur_le.userInteractionEnabled=FALSE;
    
    self.txt_Les_prestations.userInteractionEnabled=FALSE;
    self.txt_Detail_des_realises.userInteractionEnabled=FALSE;
    
    self.txt_Nom_Sauvegarde1.userInteractionEnabled=FALSE;
    self.txt_Nom_Sauvegarde2.userInteractionEnabled=FALSE;
    self.txt_Nom_Sauvegarde3.userInteractionEnabled=FALSE;
    self.txt_Nom_Sauvegarde4.userInteractionEnabled=FALSE;
    self.txt_Nom_Sauvegarde5.userInteractionEnabled=FALSE;
    self.txt_Type1.userInteractionEnabled=FALSE;
    self.txt_Type2.userInteractionEnabled=FALSE;
    self.txt_Type3.userInteractionEnabled=FALSE;
    self.txt_Type4.userInteractionEnabled=FALSE;
    self.txt_Type5.userInteractionEnabled=FALSE;
    self.txt_Format1.userInteractionEnabled=FALSE;
    self.txt_Format2.userInteractionEnabled=FALSE;
    self.txt_Format3.userInteractionEnabled=FALSE;
    self.txt_Format4.userInteractionEnabled=FALSE;
    self.txt_Format5.userInteractionEnabled=FALSE;
    self.txt_Commentaire1.userInteractionEnabled=FALSE;
    self.txt_Commentaire2.userInteractionEnabled=FALSE;
    self.txt_Commentaire3.userInteractionEnabled=FALSE;
    self.txt_Commentaire4.userInteractionEnabled=FALSE;
    self.txt_Commentaire5.userInteractionEnabled=FALSE;
    
    self.txt_nombre.userInteractionEnabled=FALSE;
    
    self.txt_Nom1.userInteractionEnabled=FALSE;
    self.txt_Nom2.userInteractionEnabled=FALSE;
    self.txt_Nom3.userInteractionEnabled=FALSE;
    self.txt_Nom4.userInteractionEnabled=FALSE;
    self.txt_Societe1.userInteractionEnabled=FALSE;
    self.txt_Societe2.userInteractionEnabled=FALSE;
    self.txt_Societe3.userInteractionEnabled=FALSE;
    self.txt_Societe4.userInteractionEnabled=FALSE;
    self.txt_Fonction1.userInteractionEnabled=FALSE;
    self.txt_Fonction2.userInteractionEnabled=FALSE;
    self.txt_Fonction3.userInteractionEnabled=FALSE;
    self.txt_Fonction4.userInteractionEnabled=FALSE;
    self.txt_Date1.userInteractionEnabled=FALSE;
    self.txt_Date2.userInteractionEnabled=FALSE;
    self.txt_Date3.userInteractionEnabled=FALSE;
    self.txt_Date4.userInteractionEnabled=FALSE;
    self.txt_Visas1.userInteractionEnabled=FALSE;
    self.txt_Visas2.userInteractionEnabled=FALSE;
    self.txt_Visas3.userInteractionEnabled=FALSE;
    self.txt_Visas4.userInteractionEnabled=FALSE;
    
    self.txt_Vos_remarques.userInteractionEnabled=FALSE;
    
    self.txt_levee_Nom1.userInteractionEnabled=FALSE;;
    self.txt_levee_Nom2.userInteractionEnabled=FALSE;
    self.txt_levee_Nom3.userInteractionEnabled=FALSE;
    self.txt_levee_Nom4.userInteractionEnabled=FALSE;
    self.txt_levee_Societe1.userInteractionEnabled=FALSE;
    self.txt_levee_Societe2.userInteractionEnabled=FALSE;
    self.txt_levee_Societe3.userInteractionEnabled=FALSE;
    self.txt_levee_Societe4.userInteractionEnabled=FALSE;
    self.txt_levee_Fonction1.userInteractionEnabled=FALSE;
    self.txt_levee_Fonction2.userInteractionEnabled=FALSE;
    self.txt_levee_Fonction3.userInteractionEnabled=FALSE;
    self.txt_levee_Fonction4.userInteractionEnabled=FALSE;
    self.txt_levee_Date1.userInteractionEnabled=FALSE;
    self.txt_levee_Date2.userInteractionEnabled=FALSE;
    self.txt_levee_Date3.userInteractionEnabled=FALSE;
    self.txt_levee_Date4.userInteractionEnabled=FALSE;
    self.txt_levee_Visas1.userInteractionEnabled=FALSE;
    self.txt_levee_Visas2.userInteractionEnabled=FALSE;
    self.txt_levee_Visas3.userInteractionEnabled=FALSE;
    self.txt_levee_Visas4.userInteractionEnabled=FALSE;
    
    self.txt_Reserve1.userInteractionEnabled=FALSE;
    self.txt_Reserve2.userInteractionEnabled=FALSE;
    self.txt_Reserve3.userInteractionEnabled=FALSE;
    self.txt_Reserve4.userInteractionEnabled=FALSE;
    self.txt_Reserve5.userInteractionEnabled=FALSE;
    self.txt_Reserve6.userInteractionEnabled=FALSE;
    self.txt_Reserve7.userInteractionEnabled=FALSE;
    self.txt_Reserve8.userInteractionEnabled=FALSE;
    self.txt_Reserve9.userInteractionEnabled=FALSE;
    self.txt_Reserve10.userInteractionEnabled=FALSE;
    self.txt_Reserve11.userInteractionEnabled=FALSE;
    self.txt_Reserve12.userInteractionEnabled=FALSE;
    self.txt_Reserve13.userInteractionEnabled=FALSE;
    self.txt_Reserve14.userInteractionEnabled=FALSE;
    self.txt_Reserve15.userInteractionEnabled=FALSE;
    
    self.txt_Action1.userInteractionEnabled=FALSE;
    self.txt_Action2.userInteractionEnabled=FALSE;
    self.txt_Action3.userInteractionEnabled=FALSE;
    self.txt_Action4.userInteractionEnabled=FALSE;
    self.txt_Action5.userInteractionEnabled=FALSE;
    self.txt_Action6.userInteractionEnabled=FALSE;
    self.txt_Action7.userInteractionEnabled=FALSE;
    self.txt_Action8.userInteractionEnabled=FALSE;
    self.txt_Action9.userInteractionEnabled=FALSE;
    self.txt_Action10.userInteractionEnabled=FALSE;
    self.txt_Action11.userInteractionEnabled=FALSE;
    self.txt_Action12.userInteractionEnabled=FALSE;
    self.txt_Action13.userInteractionEnabled=FALSE;
    self.txt_Action14.userInteractionEnabled=FALSE;
    self.txt_Action15.userInteractionEnabled=FALSE;
    
    self.txt_Pilote1.userInteractionEnabled=FALSE;
    self.txt_Pilote2.userInteractionEnabled=FALSE;
    self.txt_Pilote3.userInteractionEnabled=FALSE;
    self.txt_Pilote4.userInteractionEnabled=FALSE;
    self.txt_Pilote5.userInteractionEnabled=FALSE;
    self.txt_Pilote6.userInteractionEnabled=FALSE;
    self.txt_Pilote7.userInteractionEnabled=FALSE;
    self.txt_Pilote8.userInteractionEnabled=FALSE;
    self.txt_Pilote9.userInteractionEnabled=FALSE;
    self.txt_Pilote10.userInteractionEnabled=FALSE;
    self.txt_Pilote11.userInteractionEnabled=FALSE;
    self.txt_Pilote12.userInteractionEnabled=FALSE;
    self.txt_Pilote13.userInteractionEnabled=FALSE;
    self.txt_Pilote14.userInteractionEnabled=FALSE;
    self.txt_Pilote15.userInteractionEnabled=FALSE;
    
    self.txt_Obj_Date1.userInteractionEnabled=FALSE;
    self.txt_Obj_Date2.userInteractionEnabled=FALSE;
    self.txt_Obj_Date3.userInteractionEnabled=FALSE;
    self.txt_Obj_Date4.userInteractionEnabled=FALSE;
    self.txt_Obj_Date5.userInteractionEnabled=FALSE;
    self.txt_Obj_Date6.userInteractionEnabled=FALSE;
    self.txt_Obj_Date7.userInteractionEnabled=FALSE;
    self.txt_Obj_Date8.userInteractionEnabled=FALSE;
    self.txt_Obj_Date9.userInteractionEnabled=FALSE;
    self.txt_Obj_Date10.userInteractionEnabled=FALSE;
    self.txt_Obj_Date11.userInteractionEnabled=FALSE;
    self.txt_Obj_Date12.userInteractionEnabled=FALSE;
    self.txt_Obj_Date13.userInteractionEnabled=FALSE;
    self.txt_Obj_Date14.userInteractionEnabled=FALSE;
    self.txt_Obj_Date15.userInteractionEnabled=FALSE;
    
    // For buttons
    
    self.partbut1.userInteractionEnabled=FALSE;
    self.partbut2.userInteractionEnabled=FALSE;
    self.partbut3.userInteractionEnabled=FALSE;
    self.partbut4.userInteractionEnabled=FALSE;
    self.partbut5.userInteractionEnabled=FALSE;
    self.difbut1.userInteractionEnabled=FALSE;
    self.difbut2.userInteractionEnabled=FALSE;
    self.difbut3.userInteractionEnabled=FALSE;
    self.difbut4.userInteractionEnabled=FALSE;
    self.difbut5.userInteractionEnabled=FALSE;

    self.btn_Plate_forme.userInteractionEnabled=FALSE;
    self.btn_Fournisseur.userInteractionEnabled=FALSE;
    self.btn_Site_Client.userInteractionEnabled=FALSE;
    
    self.btn_du_materiel.userInteractionEnabled=FALSE;
    self.btn_des_prestations.userInteractionEnabled=FALSE;
    self.btn_du_logiciel.userInteractionEnabled=FALSE;
    self.btn_de_la_fin_du_montage.userInteractionEnabled=FALSE;
    self.btn_de_la_mise_sous_tension.userInteractionEnabled=FALSE;
    self.btn_de_la_mise_en_service.userInteractionEnabled=FALSE;
    self.btn_des_essais_plateforme.userInteractionEnabled=FALSE;
    
    self.btn_sauvegardes.userInteractionEnabled=FALSE;
    self.btn_Sans_Reserve.userInteractionEnabled=FALSE;
    
    self.btn_Nombre_de_reserves.userInteractionEnabled=FALSE;
    
    self.btn_Sur0.userInteractionEnabled=FALSE;
    self.btn_Sur1.userInteractionEnabled=FALSE;
    self.btn_Sur2.userInteractionEnabled=FALSE;
    self.btn_Sur3.userInteractionEnabled=FALSE;
    self.btn_Sur4.userInteractionEnabled=FALSE;
    self.btn_Sur5.userInteractionEnabled=FALSE;
    self.btn_Sur6.userInteractionEnabled=FALSE;
    self.btn_Sur7.userInteractionEnabled=FALSE;
    self.btn_Sur8.userInteractionEnabled=FALSE;
    self.btn_Sur9.userInteractionEnabled=FALSE;
    self.btn_Sur10.userInteractionEnabled=FALSE;
    
    self.btn_Edit1.userInteractionEnabled=FALSE;
    self.btn_Edit2.userInteractionEnabled=FALSE;
    self.btn_Edit3.userInteractionEnabled=FALSE;
    self.btn_Edit4.userInteractionEnabled=FALSE;
    self.btn_Edit5.userInteractionEnabled=FALSE;
    self.btn_Edit6.userInteractionEnabled=FALSE;
    self.btn_Edit7.userInteractionEnabled=FALSE;
    self.btn_Edit8.userInteractionEnabled=FALSE;
    self.btn_Edit9.userInteractionEnabled=FALSE;
    self.btn_Edit10.userInteractionEnabled=FALSE;
    self.btn_Edit11.userInteractionEnabled=FALSE;
    self.btn_Edit12.userInteractionEnabled=FALSE;
    self.btn_Edit13.userInteractionEnabled=FALSE;
    self.btn_Edit14.userInteractionEnabled=FALSE;
    self.btn_Edit15.userInteractionEnabled=FALSE;
}


-(IBAction)buttonclicked:(id)sender
{
    UIButton *but=(UIButton *)sender;
    if (but.tag==9)
    {
        if(self.partbut5.currentBackgroundImage==nil)
        {
            [self.partbut5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        else if(self.partbut5.currentBackgroundImage!=nil)
        {
            [self.partbut5 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
    else if (but.tag==10)
    {
        if(self.difbut5.currentBackgroundImage==nil)
        {
            [self.difbut5 setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        else if(self.difbut5.currentBackgroundImage!=nil)
        {
            [self.difbut5 setBackgroundImage:nil forState:UIControlStateNormal];
        }
    }
}

- ( IBAction)fun_OnCheckSelect:(id)sender
{
    NSLog(@"On check select ") ;
    UIButton * currentButton = (UIButton *) sender ;
    currentButton.currentBackgroundImage == nil ? [currentButton setBackgroundImage:[ UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal] : [ currentButton setBackgroundImage:nil forState:UIControlStateNormal] ;
}
- ( IBAction)fun_RatingCheck:(id)sender
{
    NSLog(@"Rating") ;
    UIButton * currentButton = (UIButton *) sender ;
    for (UIButton * btn in array_Btns)
    {
        if (currentButton != btn)
        {
            [btn setBackgroundImage:[ UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal] ;
        }
        else if (currentButton ==  btn)
        {
            NSLog(@"Entry") ;
            NSLog(@"%@", currentButton.currentBackgroundImage) ;
            [currentButton setBackgroundImage: [ UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal] ;
        }
    }
}

- ( void) fun_Edit : ( UIButton *) currentButton
{
    switch (currentButton.tag)
    {
        case 1:
            currentImageView = self.img_Solde1 ;
            break;
        case 2:
            currentImageView = self.img_Solde2 ;
            break;
        case 3:
            currentImageView = self.img_Solde3 ;
            break;
        case 4:
            currentImageView = self.img_Solde4 ;
            break;
        case 5:
            currentImageView = self.img_Solde5 ;
            break;
        case 6:
            currentImageView = self.img_Solde6 ;
            break;
        case 7:
            currentImageView = self.img_Solde7 ;
            break;
        case 8:
            currentImageView = self.img_Solde8 ;
            break;
        case 9:
            currentImageView = self.img_Solde9 ;
            break;
        case 10:
            currentImageView = self.img_Solde10 ;
            break;
        case 11:
            currentImageView = self.img_Solde11 ;
            break;
        case 12:
            currentImageView = self.img_Solde12 ;
            break;
        case 13:
            currentImageView = self.img_Solde13 ;
            break;
        case 14:
            currentImageView = self.img_Solde14 ;
            break;
        case 15:
            currentImageView = self.img_Solde15 ;
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
    NSLog(@"Image : %@", image) ;
    imageView = currentImageView ;
    imageView.image=image;
}



- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
{
    
    
    return YES;
}


# pragma mark For Date


-(void)showDatePicker21

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField21:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date1 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date1.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField21:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date1.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date1.text=[NSString stringWithFormat:@"%@", dateString2];
    
}


-(void)showDatePicker22

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField22:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date2 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date2.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField22:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date2.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date2.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker23

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField23:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date3 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date3.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField23:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date3.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date3.text=[NSString stringWithFormat:@"%@", dateString2];
    
}


-(void)showDatePicker24

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField24:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date4 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date4.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField24:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date4.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date4.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker25

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField25:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date5 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date5.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField25:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date5.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date5.text=[NSString stringWithFormat:@"%@", dateString2];
    
}


-(void)showDatePicker26

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField26:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date6 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date6.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField26:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date6.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date6.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker27

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField27:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date7 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date7.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField27:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date7.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date7.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker28

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField28:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date8 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date8.frame inView:self.mainview5   permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField28:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date8.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date8.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker29

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField29:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date9 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date9.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField29:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date9.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date9.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker30

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField30:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date10 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date10.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField30:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date10.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date10.text=[NSString stringWithFormat:@"%@", dateString2];
    
}


-(void)showDatePicker31

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField31:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date11 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date11.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField31:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date11.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date11.text=[NSString stringWithFormat:@"%@", dateString2];
    
}


-(void)showDatePicker32

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField32:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date12 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date12.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField32:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date12.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date12.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker33

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField33:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date13 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date13.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField33:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date13.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date13.text=[NSString stringWithFormat:@"%@", dateString2];
    
}


-(void)showDatePicker34

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField34:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date14 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date14.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField34:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date14.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date14.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker35

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField35:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Obj_Date15 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Obj_Date15.frame inView:self.mainview5 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField35:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Obj_Date15.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Obj_Date15.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker36

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField36:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Date1 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Date1.frame inView:self.mainview3 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField36:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Date1.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Date1.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker37

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField37:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Date2 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Date2.frame inView:self.mainview3 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField37:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Date2.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Date2.text=[NSString stringWithFormat:@"%@", dateString2];
    
}

-(void)showDatePicker38

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField38:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Date3 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Date3.frame inView:self.mainview3 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField38:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Date3.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Date3.text=[NSString stringWithFormat:@"%@", dateString2];
    
}


-(void)showDatePicker39

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField39:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_Date4 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_Date4.frame inView:self.mainview3 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField39:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_Date4.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_Date4.text=[NSString stringWithFormat:@"%@", dateString2];
    
}


-(void)showDatePicker40

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField40:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_levee_Date1 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_levee_Date1.frame inView:self.view85 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField40:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_levee_Date1.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_levee_Date1.text=[NSString stringWithFormat:@"%@", dateString2];
}

-(void)showDatePicker41

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField41:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_levee_Date2 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_levee_Date2.frame inView:self.view86 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField41:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_levee_Date2.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_levee_Date2.text=[NSString stringWithFormat:@"%@", dateString2];
}

-(void)showDatePicker42

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField42:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_levee_Date3 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_levee_Date3.frame inView:self.view87 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField42:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_levee_Date3.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_levee_Date3.text=[NSString stringWithFormat:@"%@", dateString2];
}

-(void)showDatePicker43

{
    
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    
    [datePicker2 setDate:[NSDate date]];
    
    datePicker2.datePickerMode = UIDatePickerModeDate;
    
    [datePicker2 addTarget:self action:@selector(dateTextField43:) forControlEvents:UIControlEventValueChanged];
    
    [self.txt_levee_Date4 setInputView:datePicker2];
    
    UIViewController* popoverContent2 = [[UIViewController alloc] init];
    
    UIView *popoverView2 = [[UIView alloc] init];
    
    popoverView2.backgroundColor = [UIColor clearColor];
    
    [popoverView2 addSubview:datePicker2];
    
    popoverContent2.view = popoverView2;
    
    UIPopoverController *popoverController2;
    
    popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent2];
    
    popoverController2.delegate=self;
    
    [popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController2 presentPopoverFromRect:self.txt_levee_Date4.frame inView:self.view88 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void)dateTextField43:(id)sender
{
    UIDatePicker *picker2=(UIDatePicker *)self.txt_levee_Date4.inputView;
    
    NSDateFormatter *dateFormat2=[[NSDateFormatter alloc]init];
    
    NSDate *eventDate2=picker2.date;
    
    [dateFormat2 setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString2= [dateFormat2 stringFromDate:eventDate2];
    
    self.txt_levee_Date4.text=[NSString stringWithFormat:@"%@", dateString2];
}





-(void)viewWillAppear:(BOOL)animated
{
    
    [ super viewWillAppear:YES] ;
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(fun_saveToDataBase:)] ;
    
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
        [self fun_saveToDataBase :self.bbbbb];
    }
    else if(buttonIndex==1)
    {
        [alertView removeFromSuperview];
    }
    
}

-(IBAction)radbutclicked:(id)sender;
{
    UIButton *but=(UIButton *)sender;
    
    if (but.tag==60)
    {
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        
        self.rating=@"0";
    }
    
    else if (but.tag==61)
    {
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"1";
    }
    
    else if (but.tag==62)
    {
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"2";
    }
    
    else if (but.tag==63)
    {
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"3";
    }
    
    else if (but.tag==64)
    {
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"4";
    }
    
    else if (but.tag==65)
    {
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"5";
    }
    
    else if (but.tag==66)
    {
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"6";
    }
    
    else if (but.tag==67)
    {
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"7";
    }
    
    else if (but.tag==68)
    {
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"8";
    }
    
    else if (but.tag==69)
    {
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"9";
    }
    else if (but.tag==70)
    {
        [self.btn_Sur10 setBackgroundImage:[UIImage imageNamed:@"radio-button-on.png"] forState:UIControlStateNormal];
        
        [self.btn_Sur0 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur1 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur2 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur3 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur4 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur5 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur6 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur7 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur8 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        [self.btn_Sur9 setBackgroundImage:[UIImage imageNamed:@"radio-button-off.png"] forState:UIControlStateNormal];
        self.rating=@"10";
    }
}

- ( void) fun_saveToDataBase : ( UIBarButtonItem *) currentBarButton
{
    int  nnn;
    NSDateFormatter *forma=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [ forma setDateFormat:@"dd-MM-YYYY"] ;
    NSString *datestring12 = [forma stringFromDate:now];
    
    NSString * str_Sign1 = [ self encodeToBase64String:self.img_Solde1.image] ;
    NSString * str_Sign2 = [ self encodeToBase64String:self.img_Solde2.image] ;
    NSString * str_Sign3 = [ self encodeToBase64String:self.img_Solde3.image] ;
    NSString * str_Sign4 = [ self encodeToBase64String:self.img_Solde4.image] ;
    NSString * str_Sign5 = [ self encodeToBase64String:self.img_Solde5.image] ;
    NSString * str_Sign6 = [ self encodeToBase64String:self.img_Solde6.image] ;
    NSString * str_Sign7 = [ self encodeToBase64String:self.img_Solde7.image] ;
    NSString * str_Sign8 = [ self encodeToBase64String:self.img_Solde8.image] ;
    NSString * str_Sign9 = [ self encodeToBase64String:self.img_Solde9.image] ;
    NSString * str_Sign10 = [ self encodeToBase64String:self.img_Solde10.image] ;
    NSString * str_Sign11 = [ self encodeToBase64String:self.img_Solde11.image] ;
    NSString * str_Sign12 = [ self encodeToBase64String:self.img_Solde12.image] ;
    NSString * str_Sign13 = [ self encodeToBase64String:self.img_Solde13.image] ;
    NSString * str_Sign14 = [ self encodeToBase64String:self.img_Solde14.image] ;
    NSString * str_Sign15 = [ self encodeToBase64String:self.img_Solde15.image] ;
    
    if(self.IsForUpdating==YES)
    {
        if (self.retrievedarray!=nil)
        {
            NSLog(@"retrive:%@",self.retrievedarray);
            NSLog(@"retrive:%@",(self.retrievedarray)[0][@"verbal_id"]);
            NSString *str=(self.retrievedarray)[0][@"verbal_id"];
            nnn=[str intValue];
        }
        else
        {
            NSString * str_GetCount = @"SELECT verbal_id FROM verbal_de_reception";
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount];
            nnn =  CurrentCount;
        }
        
        [self openPerPagePDF] ;
        NSString *updatesq=[NSString stringWithFormat:@"update verbal_de_reception set doc_name='%@',emetteur='%@',date='%@',raison='%@', project_avenant='%@', libelle='%@',affaires='%@',chef_de_projet='%@',noms_1='%@',noms_2='%@',noms_3='%@',noms_4='%@',noms_5='%@',societe_1='%@',societe_2='%@',societe_3='%@',societe_4='%@',societe_5='%@',participant_1='%@',participant_2='%@',participant_3='%@',participant_4='%@',participant_5='%@',diffusion_1='%@',diffusion_2='%@',diffusion_3='%@',diffusion_4='%@',diffusion_5='%@',mail_1='%@',mail_2='%@',mail_3='%@',mail_4='%@',mail_5='%@',commande_n='%@',commande_du='%@',offre_n='%@',no_commande_client='%@',commande_fournisseur='%@',plate_forme='%@',fournisseur='%@',site_client='%@',procedure_le='%@',du_material='%@',des_prestations='%@',du_logiciel='%@',de_la_montage='%@',de_la_tension='%@',de_la_service='%@',des_essais_plateforme='%@',les_prestations='%@',detail_des='%@',sauvegardes='%@',nom_sauvegardes_1='%@',nom_sauvegardes_2='%@',nom_sauvegardes_3='%@',nom_sauvegardes_4='%@',nom_sauvegardes_5='%@',type_1='%@',type_2='%@',type_3='%@',type_4='%@',type_5='%@',format_1='%@',format_2='%@',format_3='%@',format_4='%@',format_5='%@',commentaire_1='%@',commentaire_2='%@',commentaire_3='%@',commentaire_4='%@',commentaire_5='%@',sans_reserve='%@',nomre_de_reserves='%@',jour_nom1='%@',jour_nom2='%@',jour_nom3='%@',jour_nom4='%@',societe1='%@',societe2='%@',societe3='%@',societe4='%@',fonction1='%@',fonction2='%@',fonction3='%@',fonction4='%@',jour_date1='%@',jour_date2='%@',jour_date3='%@',jour_date4='%@',visas1='%@',visas2='%@',visas3='%@',visas4='%@',votsat_rating='%@',vos_remarques='%@',levee_nom1='%@',levee_nom2='%@',levee_nom3='%@',levee_nom4='%@',levee_societe1='%@',levee_societe2='%@',levee_societe3='%@',levee_societe4='%@',levee_fonction1='%@',levee_fonction2='%@',levee_fonction3='%@',levee_fonction4='%@',levee_date1='%@',levee_date2='%@',levee_date3='%@',levee_date4='%@',levee_visas1='%@',levee_visas2='%@',levee_visas3='%@',levee_visas4='%@',reserve_1='%@',reserve_2='%@',reserve_3='%@', doc_modified_date='%@' where verbal_id='%ld'", str_DocumentName, self.lbl_Emetteur.text,datetf1.text,self.lbl_Raison.text,self.lbl_NProject.text,self.lbl_Libelle.text,self.lbl_Change_Affaires.text,self.lbl_ChefdProj.text,self.lbl_Liste_Nom1.text,self.lbl_Liste_Nom2.text,self.txt_Liste_Nom3.text,self.txt_Liste_Nom4.text,self.txt_Liste_Nom5.text,self.lbl_Liste_Societe1.text,self.lbl_Liste_Societe2.text,self.lbl_Liste_Societe3.text,self.lbl_Liste_Societe4.text,self.lbl_Liste_Societe5.text, (self.partbut1.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut2.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut3.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut4.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut5.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut1.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut2.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut3.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut4.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut5.currentBackgroundImage != nil ? @"Yes" :@"NO"),self.lbl_Mail1.text,self.lbl_Mail2.text,self.txt_Mail3.text,self.txt_Mail4.text,self.txt_Mail5.text,self.txt_Commande.text,datetf2.text,self.txt_Offre.text,self.txt_Commande_Client.text,self.txt_Commande_Fournisseur.text,(self.btn_Plate_forme.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.btn_Fournisseur.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.btn_Site_Client.currentBackgroundImage != nil ? @"Yes" :@"NO"),self.procedur_le.text,(self.btn_du_materiel.currentBackgroundImage != nil ? @"Yes" : @"No"), (self.btn_des_prestations.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_du_logiciel.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_de_la_fin_du_montage.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_de_la_mise_sous_tension.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_de_la_mise_en_service.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_des_essais_plateforme.currentBackgroundImage != nil ? @"Yes" : @"No"),self.txt_Les_prestations.text,self.txt_Detail_des_realises.text,(self.btn_sauvegardes.currentBackgroundImage != nil ? @"Yes" : @"No"),self.txt_Nom_Sauvegarde1.text,self.txt_Nom_Sauvegarde2.text,self.txt_Nom_Sauvegarde3.text,self.txt_Nom_Sauvegarde4.text,self.txt_Nom_Sauvegarde5.text,self.txt_Type1.text,self.txt_Type2.text,self.txt_Type3.text,self.txt_Type4.text,self.txt_Type5.text,self.txt_Format1.text,self.txt_Format2.text,self.txt_Format3.text,self.txt_Format4.text,self.txt_Format5.text,self.txt_Commentaire1.text,self.txt_Commentaire2.text,self.txt_Commentaire3.text,self.txt_Commentaire4.text,self.txt_Commentaire5.text,(self.btn_Sans_Reserve.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_Nombre_de_reserves.currentBackgroundImage != nil ? @"Yes" : @"No"),self.txt_Nom1.text,self.txt_Nom2.text,self.txt_Nom3.text,self.txt_Nom4.text,self.txt_Societe1.text,self.txt_Societe2.text,self.txt_Societe3.text,self.txt_Societe4.text,self.txt_Fonction1.text,self.txt_Fonction2.text,self.txt_Fonction3.text,self.txt_Fonction4.text,self.txt_Date1.text,self.txt_Date2.text,self.txt_Date3.text,self.txt_Date4.text,self.txt_Visas1.text,self.txt_Visas2.text,self.txt_Visas3.text,self.txt_Visas4.text,self.rating,self.txt_Vos_remarques.text,self.txt_levee_Nom1.text,self.txt_levee_Nom2.text,self.txt_levee_Nom3.text,self.txt_levee_Nom4.text,self.txt_levee_Societe1.text,self.txt_levee_Societe2.text,self.txt_levee_Societe3.text,self.txt_levee_Societe4.text,self.txt_levee_Fonction1.text,self.txt_levee_Fonction2.text,self.txt_levee_Fonction3.text,self.txt_levee_Fonction4.text,self.txt_levee_Date1.text,self.txt_levee_Date2.text,self.txt_levee_Date3.text,self.txt_levee_Date4.text,self.txt_levee_Visas1.text,self.txt_levee_Visas2.text,self.txt_levee_Visas3.text,self.txt_levee_Visas4.text,self.txt_Reserve1.text,self.txt_Reserve2.text,self.txt_Reserve3.text,datestring12, (long)nnn];
        
        
        NSString *updateSQL3 = [NSString stringWithFormat:
                                @"update verbal_de_reception set reserve_four = '%@' ,reserve_5 = '%@' ,reserve_6 = '%@', reserve_7 = '%@', reserve_8 = '%@' ,reserve_9 = '%@', reserve_10 = '%@' ,reserve_11 = '%@' ,reserve_12 = '%@' ,reserve_13 = '%@', reserve_14 = '%@' ,reserve_15 = '%@',actions_1 = '%@', actions_2 = '%@', actions_3 = '%@', actions_4 = '%@', actions_5 = '%@', actions_6 = '%@', actions_7 = '%@', actions_8 = '%@', actions_9 = '%@', actions_10 = '%@', actions_11 = '%@', actions_12 = '%@', actions_13 = '%@', actions_14 = '%@', actions_15 = '%@', pilote_1 = '%@',pilote_2 = '%@',pilote_3 = '%@',pilote_4 = '%@',pilote_5 = '%@',pilote_6 = '%@',pilote_7 = '%@',pilote_8 = '%@',pilote_9 = '%@',pilote_10 = '%@',pilote_11 = '%@',pilote_12 = '%@',pilote_13 = '%@',pilote_14 = '%@',pilote_15 = '%@', objectif_1 = '%@',objectif_2= '%@' ,objectif_3 = '%@',objectif_4= '%@' ,objectif_5= '%@' ,objectif_6 = '%@',objectif_7= '%@' ,objectif_8 = '%@',objectif_9 = '%@',objectif_10= '%@' ,objectif_11= '%@' ,objectif_12= '%@' ,objectif_13= '%@' ,objectif_14= '%@' ,objectif_15= '%@',solde_1= '%@',solde_2 = '%@' ,solde_3 = '%@' ,solde_4 = '%@' ,solde_5 = '%@' ,solde_6 = '%@' ,solde_7 = '%@' ,solde_8 = '%@' ,solde_9 = '%@' ,solde_10 = '%@' ,solde_11 = '%@' ,solde_12 = '%@' ,solde_13 = '%@' ,solde_14 = '%@' ,solde_15 = '%@',nombre_de_reserves = '%@' WHERE verbal_id = '%ld'" ,
                                self.txt_Reserve4.text,self.txt_Reserve5.text,self.txt_Reserve6.text,self.txt_Reserve7.text,self.txt_Reserve8.text,self.txt_Reserve9.text,self.txt_Reserve10.text,self.txt_Reserve11.text,self.txt_Reserve12.text,self.txt_Reserve13.text,self.txt_Reserve14.text,self.txt_Reserve15.text,self.txt_Action1.text,self.txt_Action2.text,self.txt_Action3.text,self.txt_Action4.text,self.txt_Action5.text,self.txt_Action6.text,self.txt_Action7.text,self.txt_Action8.text,self.txt_Action9.text,self.txt_Action10.text,self.txt_Action11.text,self.txt_Action12.text,self.txt_Action13.text,self.txt_Action14.text,self.txt_Action15.text,self.txt_Pilote1.text,self.txt_Pilote2.text,self.txt_Pilote3.text,self.txt_Pilote4.text,self.txt_Pilote5.text,self.txt_Pilote6.text,self.txt_Pilote7.text,self.txt_Pilote8.text,self.txt_Pilote9.text,self.txt_Pilote10.text,self.txt_Pilote11.text,self.txt_Pilote12.text,self.txt_Pilote13.text,self.txt_Pilote14.text,self.txt_Pilote15.text,self.txt_Obj_Date1.text,self.txt_Obj_Date2.text,self.txt_Obj_Date3.text,self.txt_Obj_Date4.text,self.txt_Obj_Date5.text,self.txt_Obj_Date6.text,self.txt_Obj_Date7.text,self.txt_Obj_Date8.text,self.txt_Obj_Date9.text,self.txt_Obj_Date10.text,self.txt_Obj_Date11.text,self.txt_Obj_Date12.text,self.txt_Obj_Date13.text,self.txt_Obj_Date14.text,self.txt_Obj_Date15.text,str_Sign1,str_Sign2,str_Sign3,str_Sign4,str_Sign5,str_Sign6,str_Sign7,str_Sign8,str_Sign9,str_Sign10,str_Sign11,str_Sign12,str_Sign13,str_Sign14,str_Sign15,self.txt_nombre.text,(long)nnn];
        
        [[ DBSqlite dbManager] updateStatement:updatesq];
        [[ DBSqlite dbManager] updateStatement:updateSQL3];
    }
    else
    {
        if (saved_Into_DB==NO)
        {
            NSMutableArray * array_ButtonChecked = [[ NSMutableArray alloc] init] ;
            for (UIButton * btn in array_Btns)
            {
                NSString * strAns ;
                if (btn.currentBackgroundImage == [ UIImage imageNamed:@"radio-button-off.png"])
                {
                    strAns = @"No" ;
                }
                else
                {
                    strAns = @"Yes" ;
                }
                
                [array_ButtonChecked addObject:strAns] ;
            }
            NSLog(@"Array Button clicked : %@", array_ButtonChecked) ;
            [ self openPerPagePDF] ;
            NSString * str_GetCount = @"SELECT verbal_id FROM verbal_de_reception" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount];
            NSString *strQuery1 = [NSString stringWithFormat:@"insert into verbal_de_reception(verbal_id,doc_name,emetteur,date,raison,project_avenant,libelle,affaires,chef_de_projet,noms_1,noms_2,noms_3,noms_4,noms_5,societe_1,societe_2,societe_3,societe_4,societe_5,participant_1,participant_2,participant_3,participant_4,participant_5,diffusion_1,diffusion_2,diffusion_3,diffusion_4,diffusion_5,mail_1,mail_2,mail_3,mail_4,mail_5,commande_n,commande_du,offre_n,no_commande_client,commande_fournisseur,plate_forme,fournisseur,site_client,procedure_le,du_material,des_prestations,du_logiciel,de_la_montage,de_la_tension,de_la_service,des_essais_plateforme,les_prestations,detail_des,sauvegardes,nom_sauvegardes_1,nom_sauvegardes_2,nom_sauvegardes_3,nom_sauvegardes_4,nom_sauvegardes_5,type_1,type_2,type_3,type_4,type_5,format_1,format_2,format_3,format_4,format_5,commentaire_1,commentaire_2,commentaire_3,commentaire_4,commentaire_5,sans_reserve,nomre_de_reserves,jour_nom1,jour_nom2,jour_nom3,jour_nom4,societe1,societe2,societe3,societe4,fonction1,fonction2,fonction3,fonction4,jour_date1,jour_date2,jour_date3,jour_date4,visas1,visas2,visas3,visas4,votsat_rating,vos_remarques,levee_nom1,levee_nom2,levee_nom3,levee_nom4,levee_societe1,levee_societe2,levee_societe3,levee_societe4,levee_fonction1,levee_fonction2,levee_fonction3,levee_fonction4,levee_date1,levee_date2,levee_date3,levee_date4,levee_visas1,levee_visas2,levee_visas3,levee_visas4,doc_created_date,doc_modified_date,reserve_1,reserve_2,reserve_3,nombre_de_reserves) values (\"%d\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")", ++CurrentCount,str_DocumentName,self.lbl_Emetteur.text,datetf1.text,self.lbl_Raison.text,self.lbl_NProject.text,self.lbl_Libelle.text,self.lbl_Change_Affaires.text,self.lbl_ChefdProj.text,self.lbl_Liste_Nom1.text,self.lbl_Liste_Nom2.text,self.txt_Liste_Nom3.text,self.txt_Liste_Nom4.text,self.txt_Liste_Nom5.text,self.lbl_Liste_Societe1.text,self.lbl_Liste_Societe2.text,self.lbl_Liste_Societe3.text,self.lbl_Liste_Societe4.text,self.lbl_Liste_Societe5.text, (self.partbut1.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut2.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut3.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut4.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut5.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut1.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut2.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut3.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut4.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut5.currentBackgroundImage != nil ? @"Yes" :@"NO"),self.lbl_Mail1.text,self.lbl_Mail2.text,self.txt_Mail3.text,self.txt_Mail4.text,self.txt_Mail5.text,self.txt_Commande.text,datetf2.text,self.txt_Offre.text,self.txt_Commande_Client.text,self.txt_Commande_Fournisseur.text,(self.btn_Plate_forme.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.btn_Fournisseur.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.btn_Site_Client.currentBackgroundImage != nil ? @"Yes" :@"NO"),self.procedur_le.text,(self.btn_du_materiel.currentBackgroundImage != nil ? @"Yes" : @"No"), (self.btn_des_prestations.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_du_logiciel.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_de_la_fin_du_montage.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_de_la_mise_sous_tension.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_de_la_mise_en_service.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_des_essais_plateforme.currentBackgroundImage != nil ? @"Yes" : @"No"),self.txt_Les_prestations.text,self.txt_Detail_des_realises.text,(self.btn_sauvegardes.currentBackgroundImage != nil ? @"Yes" : @"No"),self.txt_Nom_Sauvegarde1.text,self.txt_Nom_Sauvegarde2.text,self.txt_Nom_Sauvegarde3.text,self.txt_Nom_Sauvegarde4.text,self.txt_Nom_Sauvegarde5.text,self.txt_Type1.text,self.txt_Type2.text,self.txt_Type3.text,self.txt_Type4.text,self.txt_Type5.text,self.txt_Format1.text,self.txt_Format2.text,self.txt_Format3.text,self.txt_Format4.text,self.txt_Format5.text,self.txt_Commentaire1.text,self.txt_Commentaire2.text,self.txt_Commentaire3.text,self.txt_Commentaire4.text,self.txt_Commentaire5.text,(self.btn_Sans_Reserve.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_Nombre_de_reserves.currentBackgroundImage != nil ? @"Yes" : @"No"),self.txt_Nom1.text,self.txt_Nom2.text,self.txt_Nom3.text,self.txt_Nom4.text,self.txt_Societe1.text,self.txt_Societe2.text,self.txt_Societe3.text,self.txt_Societe4.text,self.txt_Fonction1.text,self.txt_Fonction2.text,self.txt_Fonction3.text,self.txt_Fonction4.text,self.txt_Date1.text,self.txt_Date2.text,self.txt_Date3.text,self.txt_Date4.text,self.txt_Visas1.text,self.txt_Visas2.text,self.txt_Visas3.text,self.txt_Visas4.text,self.rating,self.txt_Vos_remarques.text,self.txt_levee_Nom1.text,self.txt_levee_Nom2.text,self.txt_levee_Nom3.text,self.txt_levee_Nom4.text,self.txt_levee_Societe1.text,self.txt_levee_Societe2.text,self.txt_levee_Societe3.text,self.txt_levee_Societe4.text,self.txt_levee_Fonction1.text,self.txt_levee_Fonction2.text,self.txt_levee_Fonction3.text,self.txt_levee_Fonction4.text,self.txt_levee_Date1.text,self.txt_levee_Date2.text,self.txt_levee_Date3.text,self.txt_levee_Date4.text,self.txt_levee_Visas1.text,self.txt_levee_Visas2.text,self.txt_levee_Visas3.text,self.txt_levee_Visas4.text,str_CreatedDate,str_CreatedDate,self.txt_Reserve1.text,self.txt_Reserve2.text,self.txt_Reserve3.text,self.txt_nombre.text];
            
            NSLog(@"String : %@", strQuery1) ;
            [[DBSqlite dbManager] insertStatement:strQuery1] ;
            NSLog(@"Current count : %d", CurrentCount) ;
            
            NSString *updateSQL = [NSString stringWithFormat:
                                   @"update verbal_de_reception set reserve_four = '%@' ,reserve_5 = '%@' ,reserve_6 = '%@', reserve_7 = '%@', reserve_8 = '%@' ,reserve_9 = '%@', reserve_10 = '%@' ,reserve_11 = '%@' ,reserve_12 = '%@' ,reserve_13 = '%@', reserve_14 = '%@' ,reserve_15 = '%@',actions_1 = '%@', actions_2 = '%@', actions_3 = '%@', actions_4 = '%@', actions_5 = '%@', actions_6 = '%@', actions_7 = '%@', actions_8 = '%@', actions_9 = '%@', actions_10 = '%@', actions_11 = '%@', actions_12 = '%@', actions_13 = '%@', actions_14 = '%@', actions_15 = '%@', pilote_1 = '%@',pilote_2 = '%@',pilote_3 = '%@',pilote_4 = '%@',pilote_5 = '%@',pilote_6 = '%@',pilote_7 = '%@',pilote_8 = '%@',pilote_9 = '%@',pilote_10 = '%@',pilote_11 = '%@',pilote_12 = '%@',pilote_13 = '%@',pilote_14 = '%@',pilote_15 = '%@', objectif_1 = '%@',objectif_2= '%@' ,objectif_3 = '%@',objectif_4= '%@' ,objectif_5= '%@' ,objectif_6 = '%@',objectif_7= '%@' ,objectif_8 = '%@',objectif_9 = '%@',objectif_10= '%@' ,objectif_11= '%@' ,objectif_12= '%@' ,objectif_13= '%@' ,objectif_14= '%@' ,objectif_15= '%@',solde_1= '%@',solde_2 = '%@' ,solde_3 = '%@' ,solde_4 = '%@' ,solde_5 = '%@' ,solde_6 = '%@' ,solde_7 = '%@' ,solde_8 = '%@' ,solde_9 = '%@' ,solde_10 = '%@' ,solde_11 = '%@' ,solde_12 = '%@' ,solde_13 = '%@' ,solde_14 = '%@' ,solde_15 = '%@' WHERE verbal_id = '%d'" ,
                                   self.txt_Reserve4.text,self.txt_Reserve5.text,self.txt_Reserve6.text,self.txt_Reserve7.text,self.txt_Reserve8.text,self.txt_Reserve9.text,self.txt_Reserve10.text,self.txt_Reserve11.text,self.txt_Reserve12.text,self.txt_Reserve13.text,self.txt_Reserve14.text,self.txt_Reserve15.text,self.txt_Action1.text,self.txt_Action2.text,self.txt_Action3.text,self.txt_Action4.text,self.txt_Action5.text,self.txt_Action6.text,self.txt_Action7.text,self.txt_Action8.text,self.txt_Action9.text,self.txt_Action10.text,self.txt_Action11.text,self.txt_Action12.text,self.txt_Action13.text,self.txt_Action14.text,self.txt_Action15.text,self.txt_Pilote1.text,self.txt_Pilote2.text,self.txt_Pilote3.text,self.txt_Pilote4.text,self.txt_Pilote5.text,self.txt_Pilote6.text,self.txt_Pilote7.text,self.txt_Pilote8.text,self.txt_Pilote9.text,self.txt_Pilote10.text,self.txt_Pilote11.text,self.txt_Pilote12.text,self.txt_Pilote13.text,self.txt_Pilote14.text,self.txt_Pilote15.text,self.txt_Obj_Date1.text,self.txt_Obj_Date2.text,self.txt_Obj_Date3.text,self.txt_Obj_Date4.text,self.txt_Obj_Date5.text,self.txt_Obj_Date6.text,self.txt_Obj_Date7.text,self.txt_Obj_Date8.text,self.txt_Obj_Date9.text,self.txt_Obj_Date10.text,self.txt_Obj_Date11.text,self.txt_Obj_Date12.text,self.txt_Obj_Date13.text,self.txt_Obj_Date14.text,self.txt_Obj_Date15.text,str_Sign1,str_Sign2,str_Sign3,str_Sign4,str_Sign5,str_Sign6,str_Sign7,str_Sign8,str_Sign9,str_Sign10,str_Sign11,str_Sign12,str_Sign13,str_Sign14,str_Sign15,CurrentCount];
            NSLog(@"Update Sql : %@", updateSQL) ;
            [[ DBSqlite dbManager] updateStatement:updateSQL];
            self.IsForUpdating=YES;
            saved_Into_DB=YES;
        }
        else if(saved_Into_DB==YES)
        {
            NSString * str_GetCount = @"SELECT verbal_id FROM verbal_de_reception" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount];
            NSString *updatesq=[NSString stringWithFormat:@"update verbal_de_reception set doc_name='%@',emetteur='%@',date='%@',raison='%@', project_avenant='%@', libelle='%@',affaires='%@',chef_de_projet='%@',noms_1='%@',noms_2='%@',noms_3='%@',noms_4='%@',noms_5='%@',societe_1='%@',societe_2='%@',societe_3='%@',societe_4='%@',societe_5='%@',participant_1='%@',participant_2='%@',participant_3='%@',participant_4='%@',participant_5='%@',diffusion_1='%@',diffusion_2='%@',diffusion_3='%@',diffusion_4='%@',diffusion_5='%@',mail_1='%@',mail_2='%@',mail_3='%@',mail_4='%@',mail_5='%@',commande_n='%@',commande_du='%@',offre_n='%@',no_commande_client='%@',commande_fournisseur='%@',plate_forme='%@',fournisseur='%@',site_client='%@',procedure_le='%@',du_material='%@',des_prestations='%@',du_logiciel='%@',de_la_montage='%@',de_la_tension='%@',de_la_service='%@',des_essais_plateforme='%@',les_prestations='%@',detail_des='%@',sauvegardes='%@',nom_sauvegardes_1='%@',nom_sauvegardes_2='%@',nom_sauvegardes_3='%@',nom_sauvegardes_4='%@',nom_sauvegardes_5='%@',type_1='%@',type_2='%@',type_3='%@',type_4='%@',type_5='%@',format_1='%@',format_2='%@',format_3='%@',format_4='%@',format_5='%@',commentaire_1='%@',commentaire_2='%@',commentaire_3='%@',commentaire_4='%@',commentaire_5='%@',sans_reserve='%@',nomre_de_reserves='%@',jour_nom1='%@',jour_nom2='%@',jour_nom3='%@',jour_nom4='%@',societe1='%@',societe2='%@',societe3='%@',societe4='%@',fonction1='%@',fonction2='%@',fonction3='%@',fonction4='%@',jour_date1='%@',jour_date2='%@',jour_date3='%@',jour_date4='%@',visas1='%@',visas2='%@',visas3='%@',visas4='%@',votsat_rating='%@',vos_remarques='%@',levee_nom1='%@',levee_nom2='%@',levee_nom3='%@',levee_nom4='%@',levee_societe1='%@',levee_societe2='%@',levee_societe3='%@',levee_societe4='%@',levee_fonction1='%@',levee_fonction2='%@',levee_fonction3='%@',levee_fonction4='%@',levee_date1='%@',levee_date2='%@',levee_date3='%@',levee_date4='%@',levee_visas1='%@',levee_visas2='%@',levee_visas3='%@',levee_visas4='%@',reserve_1='%@',reserve_2='%@',reserve_3='%@', doc_modified_date='%@' where verbal_id='%d'", str_DocumentName, self.lbl_Emetteur.text,datetf1.text,self.lbl_Raison.text,self.lbl_NProject.text,self.lbl_Libelle.text,self.lbl_Change_Affaires.text,self.lbl_ChefdProj.text,self.lbl_Liste_Nom1.text,self.lbl_Liste_Nom2.text,self.txt_Liste_Nom3.text,self.txt_Liste_Nom4.text,self.txt_Liste_Nom5.text,self.lbl_Liste_Societe1.text,self.lbl_Liste_Societe2.text,self.lbl_Liste_Societe3.text,self.lbl_Liste_Societe4.text,self.lbl_Liste_Societe5.text, (self.partbut1.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut2.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut3.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut4.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.partbut5.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut1.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut2.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut3.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut4.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.difbut5.currentBackgroundImage != nil ? @"Yes" :@"NO"),self.lbl_Mail1.text,self.lbl_Mail2.text,self.txt_Mail3.text,self.txt_Mail4.text,self.txt_Mail5.text,self.txt_Commande.text,datetf2.text,self.txt_Offre.text,self.txt_Commande_Client.text,self.txt_Commande_Fournisseur.text,(self.btn_Plate_forme.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.btn_Fournisseur.currentBackgroundImage != nil ? @"Yes" :@"NO"),(self.btn_Site_Client.currentBackgroundImage != nil ? @"Yes" :@"NO"),self.procedur_le.text,(self.btn_du_materiel.currentBackgroundImage != nil ? @"Yes" : @"No"), (self.btn_des_prestations.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_du_logiciel.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_de_la_fin_du_montage.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_de_la_mise_sous_tension.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_de_la_mise_en_service.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_des_essais_plateforme.currentBackgroundImage != nil ? @"Yes" : @"No"),self.txt_Les_prestations.text,self.txt_Detail_des_realises.text,(self.btn_sauvegardes.currentBackgroundImage != nil ? @"Yes" : @"No"),self.txt_Nom_Sauvegarde1.text,self.txt_Nom_Sauvegarde2.text,self.txt_Nom_Sauvegarde3.text,self.txt_Nom_Sauvegarde4.text,self.txt_Nom_Sauvegarde5.text,self.txt_Type1.text,self.txt_Type2.text,self.txt_Type3.text,self.txt_Type4.text,self.txt_Type5.text,self.txt_Format1.text,self.txt_Format2.text,self.txt_Format3.text,self.txt_Format4.text,self.txt_Format5.text,self.txt_Commentaire1.text,self.txt_Commentaire2.text,self.txt_Commentaire3.text,self.txt_Commentaire4.text,self.txt_Commentaire5.text,(self.btn_Sans_Reserve.currentBackgroundImage != nil ? @"Yes" : @"No"),(self.btn_Nombre_de_reserves.currentBackgroundImage != nil ? @"Yes" : @"No"),self.txt_Nom1.text,self.txt_Nom2.text,self.txt_Nom3.text,self.txt_Nom4.text,self.txt_Societe1.text,self.txt_Societe2.text,self.txt_Societe3.text,self.txt_Societe4.text,self.txt_Fonction1.text,self.txt_Fonction2.text,self.txt_Fonction3.text,self.txt_Fonction4.text,self.txt_Date1.text,self.txt_Date2.text,self.txt_Date3.text,self.txt_Date4.text,self.txt_Visas1.text,self.txt_Visas2.text,self.txt_Visas3.text,self.txt_Visas4.text,self.rating,self.txt_Vos_remarques.text,self.txt_levee_Nom1.text,self.txt_levee_Nom2.text,self.txt_levee_Nom3.text,self.txt_levee_Nom4.text,self.txt_levee_Societe1.text,self.txt_levee_Societe2.text,self.txt_levee_Societe3.text,self.txt_levee_Societe4.text,self.txt_levee_Fonction1.text,self.txt_levee_Fonction2.text,self.txt_levee_Fonction3.text,self.txt_levee_Fonction4.text,self.txt_levee_Date1.text,self.txt_levee_Date2.text,self.txt_levee_Date3.text,self.txt_levee_Date4.text,self.txt_levee_Visas1.text,self.txt_levee_Visas2.text,self.txt_levee_Visas3.text,self.txt_levee_Visas4.text,self.txt_Reserve1.text,self.txt_Reserve2.text,self.txt_Reserve3.text,datestring12, CurrentCount];
            
            NSString *updateSQL3 = [NSString stringWithFormat:
                                    @"update verbal_de_reception set reserve_four = '%@' ,reserve_5 = '%@' ,reserve_6 = '%@', reserve_7 = '%@', reserve_8 = '%@' ,reserve_9 = '%@', reserve_10 = '%@' ,reserve_11 = '%@' ,reserve_12 = '%@' ,reserve_13 = '%@', reserve_14 = '%@' ,reserve_15 = '%@',actions_1 = '%@', actions_2 = '%@', actions_3 = '%@', actions_4 = '%@', actions_5 = '%@', actions_6 = '%@', actions_7 = '%@', actions_8 = '%@', actions_9 = '%@', actions_10 = '%@', actions_11 = '%@', actions_12 = '%@', actions_13 = '%@', actions_14 = '%@', actions_15 = '%@', pilote_1 = '%@',pilote_2 = '%@',pilote_3 = '%@',pilote_4 = '%@',pilote_5 = '%@',pilote_6 = '%@',pilote_7 = '%@',pilote_8 = '%@',pilote_9 = '%@',pilote_10 = '%@',pilote_11 = '%@',pilote_12 = '%@',pilote_13 = '%@',pilote_14 = '%@',pilote_15 = '%@', objectif_1 = '%@',objectif_2= '%@' ,objectif_3 = '%@',objectif_4= '%@' ,objectif_5= '%@' ,objectif_6 = '%@',objectif_7= '%@' ,objectif_8 = '%@',objectif_9 = '%@',objectif_10= '%@' ,objectif_11= '%@' ,objectif_12= '%@' ,objectif_13= '%@' ,objectif_14= '%@' ,objectif_15= '%@',solde_1= '%@',solde_2 = '%@' ,solde_3 = '%@' ,solde_4 = '%@' ,solde_5 = '%@' ,solde_6 = '%@' ,solde_7 = '%@' ,solde_8 = '%@' ,solde_9 = '%@' ,solde_10 = '%@' ,solde_11 = '%@' ,solde_12 = '%@' ,solde_13 = '%@' ,solde_14 = '%@' ,solde_15 = '%@',nombre_de_reserves = '%@' WHERE verbal_id = '%d'",self.txt_Reserve4.text,self.txt_Reserve5.text,self.txt_Reserve6.text,self.txt_Reserve7.text,self.txt_Reserve8.text,self.txt_Reserve9.text,self.txt_Reserve10.text,self.txt_Reserve11.text,self.txt_Reserve12.text,self.txt_Reserve13.text,self.txt_Reserve14.text,self.txt_Reserve15.text,self.txt_Action1.text,self.txt_Action2.text,self.txt_Action3.text,self.txt_Action4.text,self.txt_Action5.text,self.txt_Action6.text,self.txt_Action7.text,self.txt_Action8.text,self.txt_Action9.text,self.txt_Action10.text,self.txt_Action11.text,self.txt_Action12.text,self.txt_Action13.text,self.txt_Action14.text,self.txt_Action15.text,self.txt_Pilote1.text,self.txt_Pilote2.text,self.txt_Pilote3.text,self.txt_Pilote4.text,self.txt_Pilote5.text,self.txt_Pilote6.text,self.txt_Pilote7.text,self.txt_Pilote8.text,self.txt_Pilote9.text,self.txt_Pilote10.text,self.txt_Pilote11.text,self.txt_Pilote12.text,self.txt_Pilote13.text,self.txt_Pilote14.text,self.txt_Pilote15.text,self.txt_Obj_Date1.text,self.txt_Obj_Date2.text,self.txt_Obj_Date3.text,self.txt_Obj_Date4.text,self.txt_Obj_Date5.text,self.txt_Obj_Date6.text,self.txt_Obj_Date7.text,self.txt_Obj_Date8.text,self.txt_Obj_Date9.text,self.txt_Obj_Date10.text,self.txt_Obj_Date11.text,self.txt_Obj_Date12.text,self.txt_Obj_Date13.text,self.txt_Obj_Date14.text,self.txt_Obj_Date15.text,str_Sign1,str_Sign2,str_Sign3,str_Sign4,str_Sign5,str_Sign6,str_Sign7,str_Sign8,str_Sign9,str_Sign10,str_Sign11,str_Sign12,str_Sign13,str_Sign14,str_Sign15,self.txt_nombre.text,CurrentCount];
            [[ DBSqlite dbManager] updateStatement:updatesq];
            [[ DBSqlite dbManager] updateStatement:updateSQL3];
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
    
    
    
    if (textField == datetf1)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker];
        
        return NO;
        
    }
    else if (textField == datetf2)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker2];
        
        return NO;
        
    }
    
    else if(textField == self.txt_Obj_Date1)
    {
        [self.view endEditing:YES];
        
        NSLog(@"text field clicked");
        
        [self showDatePicker21];
        
        return NO;
        
    }
    else if (textField == self.txt_Obj_Date2)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker22];
        
        return NO;
        
    }
    
    else if (textField == self.txt_Obj_Date3)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker23];
        
        return NO;
        
    }
    else if (textField == self.txt_Obj_Date4)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker24];
        
        return NO;
        
    }
    
    else if (textField == self.txt_Obj_Date5)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker25];
        
        return NO;
        
    }
    else if (textField == self.txt_Obj_Date6)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker26];
        
        return NO;
        
    }
    
    else if (textField == self.txt_Obj_Date7)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker27];
        
        return NO;
        
    }
    else if (textField == self.txt_Obj_Date8)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker28];
        
        return NO;
        
    }
    
    else if (textField == self.txt_Obj_Date9)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker29];
        
        return NO;
        
    }
    else if (textField == self.txt_Obj_Date10)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker30];
        
        return NO;
        
    }
    
    else if (textField == self.txt_Obj_Date11)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker31];
        
        return NO;
        
    }
    else if (textField == self.txt_Obj_Date12)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker32];
        
        return NO;
        
    }
    
    else if (textField == self.txt_Obj_Date13)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker33];
        
        return NO;
        
    }
    else if (textField == self.txt_Obj_Date14)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker34];
        
        return NO;
        
    }
    
    else if (textField == self.txt_Obj_Date15)
        
    {
        [self.view endEditing:YES];
        [self showDatePicker35];
        return NO;
    }
    
    else if (textField == self.txt_Date1)
        
    {
        [self.view endEditing:YES];
        [self showDatePicker36];
        return NO;
    }
    
    else if (textField == self.txt_Date2)
        
    {
        [self.view endEditing:YES];
        [self showDatePicker37];
        return NO;
    }
    
    else if (textField == self.txt_Date3)
        
    {
        [self.view endEditing:YES];
        [self showDatePicker38];
        return NO;
    }
    
    else if (textField == self.txt_Date4)
        
    {
        [self.view endEditing:YES];
        [self showDatePicker39];
        return NO;
    }
    
    else if (textField == self.txt_levee_Date1)
        
    {
        [self.view endEditing:YES];
        [self showDatePicker40];
        return NO;
    }
    
    else if (textField == self.txt_levee_Date2)
        
    {
        [self.view endEditing:YES];
        [self showDatePicker41];
        return NO;
    }
    
    else if (textField == self.txt_levee_Date3)
        
    {
        [self.view endEditing:YES];
        [self showDatePicker42];
        return NO;
    }
    
    else if (textField == self.txt_levee_Date4)
        
    {
        [self.view endEditing:YES];
        [self showDatePicker43];
        return NO;
    }
    
    
    
    
    return YES;
}

#pragma mark Date picker Functionality

-(void)showDatePicker

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    
    [datetf1 setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:datetf1.frame inView:datetf1 permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)datetf1.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    datetf1.text = [NSString stringWithFormat:@"%@",dateString];
    
}

-(void)showDatePicker2

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField2:) forControlEvents:UIControlEventValueChanged];
    
    [datetf2 setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:datetf2.frame inView:self.scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

-(void) dateTextField2:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)datetf2.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    datetf2.text = [NSString stringWithFormat:@"%@",dateString];
}


#pragma mark - PDF Creation

//- (void)openPerPagePDF
//{
//    NSData *pdfData1 = [ScrollViewToPDF pdfDataOfScrollView:self.scrollView];
//    NSData *pdfData2 = [ScrollViewToPDF pdfDataOfView:self.view];
//
//    NSMutableData *muta=[pdfData1 mutableCopy];
//    [muta appendData:pdfData2];
//    NSLog(@"The combine data %@", muta);
//
//    //************* By Converting into strings and combining and coverting into data ************
//
//    NSString *firstData = [pdfData1 base64EncodedStringWithOptions:NSUTF8StringEncoding];
//    NSString *secondData = [pdfData2 base64EncodedStringWithOptions:NSUTF8StringEncoding];
//    firstData=[firstData stringByAppendingString:secondData];
//
//
//
//    NSMutableData *pdfData=[[NSMutableData alloc]init];
//    [pdfData appendData:pdfData2];
//    [pdfData appendData:pdfData1];
//
//    //NSString *conver=[[NSString alloc] initWithData:pdfData encoding:NSASCIIStringEncoding];
//    //NSData *datapdf= [conver dataUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"The combined data is %@",pdfData);
//
//    NSDateFormatter *format=[[NSDateFormatter alloc]init];
//    NSDate *now=[NSDate date];
//    NSLog(@"Now : %@", now);
//    [ format setDateFormat:@"dd-MM-YYYY_hhmmss"];
//    NSString * datestring = [format stringFromDate:now];
//
//    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *docpath = [ary objectAtIndex:0];
//    str_DocumentName = [NSString stringWithFormat:@"Proces Verbal De Reception_%@_1.pdf", datestring];
//    path = [docpath stringByAppendingPathComponent:str_DocumentName];
//
//    NSString *str_DocumentName1 = [NSString stringWithFormat:@"Proces Verbal De Reception_%@_2.pdf", datestring];
//    path1 = [docpath stringByAppendingPathComponent:str_DocumentName1];
//
//    [pdfData2 writeToFile:path atomically:NO];
//    [pdfData1 writeToFile:path1 atomically:NO];
//
//
//    NSString *str_DocumentName2 = [NSString stringWithFormat:@"Proces Verbal De Reception_%@_final.pdf", datestring];
//
//
//    NSString *pdfPathOutput = [docpath stringByAppendingPathComponent:str_DocumentName2];
//
//    // File URLs - bridge casting for ARC
//    CFURLRef pdfURL1 = (__bridge_retained CFURLRef)[[NSURL alloc] initFileURLWithPath:(NSString *)path];//(CFURLRef) NSURL
//    CFURLRef pdfURL2 = (__bridge_retained CFURLRef)[[NSURL alloc] initFileURLWithPath:(NSString *)path1];//(CFURLRef)
//    CFURLRef pdfURLOutput =(__bridge_retained CFURLRef) [[NSURL alloc] initFileURLWithPath:(NSString *)pdfPathOutput];//(CFURLRef)
//
//    // File references
//    CGPDFDocumentRef pdfRef1 = CGPDFDocumentCreateWithURL((CFURLRef) pdfURL1);
//    CGPDFDocumentRef pdfRef2 = CGPDFDocumentCreateWithURL((CFURLRef) pdfURL2);
//
//    // Number of pages
//    NSInteger numberOfPages1 = CGPDFDocumentGetNumberOfPages(pdfRef1);
//    NSInteger numberOfPages2 = CGPDFDocumentGetNumberOfPages(pdfRef2);
//
//    // Create the output context
//    CGContextRef writeContext = CGPDFContextCreateWithURL(pdfURLOutput, NULL, NULL);
//
//    // Loop variables
//    CGPDFPageRef page;
//    CGRect mediaBox;
//
//    // Read the first PDF and generate the output pages
//    NSLog(@"GENERATING PAGES FROM PDF 1 (%li)...", (long)numberOfPages1);
//    for (int i=1; i<=numberOfPages1; i++)
//    {
//        page = CGPDFDocumentGetPage(pdfRef1, i);
//        mediaBox = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
//        CGContextBeginPage(writeContext, &mediaBox);
//        CGContextDrawPDFPage(writeContext, page);
//        CGContextEndPage(writeContext);
//    }
//
//    // Read the second PDF and generate the output pages
//    NSLog(@"GENERATING PAGES FROM PDF 2 (%li)...", (long)numberOfPages2);
//    for (int i=1; i<=numberOfPages2; i++) {
//        page = CGPDFDocumentGetPage(pdfRef2, i);
//        mediaBox = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
//        CGContextBeginPage(writeContext, &mediaBox);
//        CGContextDrawPDFPage(writeContext, page);
//        CGContextEndPage(writeContext);
//    }
//    NSLog(@"DONE!");
//
//    // Finalize the output file
//    CGPDFContextClose(writeContext);
//
//    // Release from memory
//    CFRelease(pdfURL1);
//    CFRelease(pdfURL2);
//    CFRelease(pdfURLOutput);
//    CGPDFDocumentRelease(pdfRef1);
//    CGPDFDocumentRelease(pdfRef2);
//    CGContextRelease(writeContext);


// ************* Merging Two pdf files *******************

//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];

// File paths
//    NSString *pdfPathOutput = [documentsDirectory stringByAppendingPathComponent:@"out.pdf"];
//    NSMutableData *pd1data=[NSData dataWithContentsOfFile:path];
//    NSMutableData *pd2data=[NSData dataWithContentsOfFile:path1];
//
//    NSMutableData *data=[[NSMutableData alloc]init];
//    CGRect paperSize=CGRectMake(0,0,768,5000);
//    UIGraphicsBeginPDFContextToData(pd2data, paperSize, nil);
//    UIGraphicsBeginPDFContextToData(pd1data, paperSize, nil);
//
//    NSString *str_DocumentName2 = [NSString stringWithFormat:@"Proces Verbal De Reception_%@_Final.pdf", datestring];
//    path2=[docpath stringByAppendingPathComponent:str_DocumentName2];
//    //NSURL *pdfUrl = [[NSURL fileURLWithPath:path2] retain];
//    UIGraphicsBeginPDFPageWithInfo(paperSize, nil);
//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(currentContext, 0, paperSize.size.height);
//    CGContextScaleCTM(currentContext, 1.0, -1.0);
//    UIGraphicsEndPDFContext();
//    [data writeToFile:path2 atomically:NO];
//
//    NSLog(@"tmpDirectory: %@",path);

//
//    // File URLs
//    CFURLRef pdfURL1 = (__bridge CFURLRef)[[NSURL alloc] initFileURLWithPath:path];
//    CFURLRef pdfURL2 = (__bridge CFURLRef)[[NSURL alloc] initFileURLWithPath:path1];
//    CFURLRef pdfURLOutput = (__bridge CFURLRef)[[NSURL alloc] initFileURLWithPath:pdfPathOutput];
//
//    // File references
//    CGPDFDocumentRef pdfRef1 = CGPDFDocumentCreateWithURL((CFURLRef) pdfURL1);
//    CGPDFDocumentRef pdfRef2 = CGPDFDocumentCreateWithURL((CFURLRef) pdfURL2);
//
//    // Number of pages
//    NSInteger numberOfPages1 = CGPDFDocumentGetNumberOfPages(pdfRef1);
//    NSInteger numberOfPages2 = CGPDFDocumentGetNumberOfPages(pdfRef2);
//
//    // Create the output context
//    CGContextRef writeContext = CGPDFContextCreateWithURL(pdfURLOutput, NULL, NULL);
//
//    // Loop variables
//    CGPDFPageRef page;
//    CGRect mediaBox;
//
//    // Read the first PDF and generate the output pages
//    NSLog(@"GENERATING PAGES FROM PDF 1 (%li)...", (long)numberOfPages1);
//    for (int i=1; i<=numberOfPages1; i++)
//    {
//        page = CGPDFDocumentGetPage(pdfRef1, i);
//        mediaBox = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
//        CGContextBeginPage(writeContext, &mediaBox);
//        CGContextDrawPDFPage(writeContext, page);
//        CGContextEndPage(writeContext);
//    }
//
//    // Read the second PDF and generate the output pages
//    NSLog(@"GENERATING PAGES FROM PDF 2 (%li)...", (long)numberOfPages2);
//    for (int i=1; i<=numberOfPages2; i++) {
//        page = CGPDFDocumentGetPage(pdfRef2, i);
//        mediaBox = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
//        CGContextBeginPage(writeContext, &mediaBox);
//        CGContextDrawPDFPage(writeContext, page);
//        CGContextEndPage(writeContext);
//    }
//    NSLog(@"DONE!");
//
//    // Finalize the output file
//    CGPDFContextClose(writeContext);
//
//    // Release from memory
//    CFRelease(pdfURL1);
//    CFRelease(pdfURL2);
//    CFRelease(pdfURLOutput);
//    CGPDFDocumentRelease(pdfRef1);
//    CGPDFDocumentRelease(pdfRef2);
//    CGContextRelease(writeContext);

//    NSFileHandle *fileHandle=[NSFileHandle fileHandleForUpdatingAtPath:path];
//    [fileHandle seekToEndOfFile];
//    [fileHandle writeData:pdfData1];
//    [fileHandle closeFile];

//    NSString *filePath = path; // get the file //
//    //NSUInteger insertionPoint = 500; // get the insertion point //
//    // make sure the file exists, if it does, do the following //
//    //NSData *oldData = [NSData dataWithContentsOfFile:filePath];
//    // error checking would be nice... if (oldData) ... blah //
//    NSOutputStream *stream = [[NSOutputStream alloc] initToFileAtPath:filePath append:YES];
//    [stream open];
//    [stream write:(uint8_t *)[pdfData1 bytes] maxLength:[pdfData1 length]]; // write the new data //
//    [stream close];

//    NSOutputStream *stream = [[NSOutputStream alloc] initToFileAtPath:path append:YES];
//    [stream open];
//    [stream write:(uint8_t *)[pdfData1 bytes] maxLength:[pdfData1 length]];
//    [stream close];


//}


- (void)openPerPagePDF
{
    NSData *pdfData1 = [ScrollViewToPDF pdfDataOfScrollView:self.scrollView];
    //NSData *pdfData2 = [ScrollViewToPDF pdfDataOfView:self.view];
    NSData *pdfData2 = [ScrollViewToPDF pdfDataOfScrollView1:self.topScrollView];
    
    NSMutableData *muta=[pdfData1 mutableCopy];
    [muta appendData:pdfData2];
    NSLog(@"The combine data %@", muta);
    
    //************* By Converting into strings and combining and coverting into data ************
    
    NSString *firstData = [pdfData1 base64EncodedStringWithOptions:NSUTF8StringEncoding];
    NSString *secondData = [pdfData2 base64EncodedStringWithOptions:NSUTF8StringEncoding];
    firstData=[firstData stringByAppendingString:secondData];
    
    
    
    NSMutableData *pdfData=[[NSMutableData alloc]init];
    [pdfData appendData:pdfData2];
    [pdfData appendData:pdfData1];
    
    //NSString *conver=[[NSString alloc] initWithData:pdfData encoding:NSASCIIStringEncoding];
    //NSData *datapdf= [conver dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"The combined data is %@",pdfData);
    
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    NSLog(@"Now : %@", now);
    [ format setDateFormat:@"dd-MM-YYYY_hhmmss"];
    NSString * datestring = [format stringFromDate:now];
    
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    
    NSString *str_DocumentName2 = [NSString stringWithFormat:@"Proces Verbal De Reception_%@_1.pdf", datestring];
    path2 = [docpath stringByAppendingPathComponent:str_DocumentName2];
    
    NSString *str_DocumentName1 = [NSString stringWithFormat:@"Proces Verbal De Reception_%@_2.pdf", datestring];
    path1 = [docpath stringByAppendingPathComponent:str_DocumentName1];
    
    [pdfData2 writeToFile:path2 atomically:NO];
    [pdfData1 writeToFile:path1 atomically:NO];
    
    str_DocumentName = [NSString stringWithFormat:@"Proces Verbal De Reception_%@.pdf", datestring];
    path=[docpath stringByAppendingPathComponent:str_DocumentName];
    
    //NSString *pdfPathOutput = [docpath stringByAppendingPathComponent:str_DocumentName2];
    
    // File URLs - bridge casting for ARC
    CFURLRef pdfURL1 = (__bridge_retained CFURLRef)[[NSURL alloc] initFileURLWithPath:(NSString *)path2];//(CFURLRef) NSURL
    CFURLRef pdfURL2 = (__bridge_retained CFURLRef)[[NSURL alloc] initFileURLWithPath:(NSString *)path1];//(CFURLRef)
    CFURLRef pdfURLOutput =(__bridge_retained CFURLRef) [[NSURL alloc] initFileURLWithPath:(NSString *)path];//(CFURLRef)
    
    // File references
    CGPDFDocumentRef pdfRef1 = CGPDFDocumentCreateWithURL((CFURLRef) pdfURL1);
    CGPDFDocumentRef pdfRef2 = CGPDFDocumentCreateWithURL((CFURLRef) pdfURL2);
    
    // Number of pages
    NSInteger numberOfPages1 = CGPDFDocumentGetNumberOfPages(pdfRef1);
    NSInteger numberOfPages2 = CGPDFDocumentGetNumberOfPages(pdfRef2);
    
    // Create the output context
    CGContextRef writeContext = CGPDFContextCreateWithURL(pdfURLOutput, NULL, NULL);
    
    // Loop variables
    CGPDFPageRef page;
    CGRect mediaBox;
    
    // Read the first PDF and generate the output pages
    NSLog(@"GENERATING PAGES FROM PDF 1 (%li)...", (long)numberOfPages1);
    for (int i=1; i<=numberOfPages1; i++)
    {
        page = CGPDFDocumentGetPage(pdfRef1, i);
        mediaBox = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
        CGContextBeginPage(writeContext, &mediaBox);
        CGContextDrawPDFPage(writeContext, page);
        CGContextEndPage(writeContext);
    }
    
    // Read the second PDF and generate the output pages
    NSLog(@"GENERATING PAGES FROM PDF 2 (%li)...", (long)numberOfPages2);
    for (int i=1; i<=numberOfPages2; i++) {
        page = CGPDFDocumentGetPage(pdfRef2, i);
        mediaBox = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
        CGContextBeginPage(writeContext, &mediaBox);
        CGContextDrawPDFPage(writeContext, page);
        CGContextEndPage(writeContext);
    }
    NSLog(@"DONE!");
    
    // Finalize the output file
    CGPDFContextClose(writeContext);
    
    NSFileManager *fmanager=[[NSFileManager alloc]init];
    [fmanager removeItemAtPath:path2 error:NULL];
    [fmanager removeItemAtPath:path1 error:NULL];
    
    
    // Release from memory
    CFRelease(pdfURL1);
    CFRelease(pdfURL2);
    CFRelease(pdfURLOutput);
    CGPDFDocumentRelease(pdfRef1);
    CGPDFDocumentRelease(pdfRef2);
    CGContextRelease(writeContext);
}





#pragma mark UITextView delegate

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if(self.txt_Reserve14==textView || self.txt_Action14==textView || self.txt_Pilote14==textView)
    {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 3600)
                                 animated:YES];
    }
    else if(self.txt_Reserve15==textView || self.txt_Action15==textView || self.txt_Pilote15==textView)
    {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 3600)
                                 animated:YES];
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    if(self.txt_Reserve14==textView || self.txt_Action14==textView || self.txt_Pilote14==textView)
    {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 3476)
                                 animated:YES];
    }
    else if(self.txt_Reserve15==textView || self.txt_Action15==textView || self.txt_Pilote15==textView)
    {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 3476)
                                 animated:YES];
    }
}

@end
