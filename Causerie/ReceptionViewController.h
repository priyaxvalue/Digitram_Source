//
//  ReceptionViewController.h
//  Digitram
//
//  Created by Saravana on 06/04/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "DBSqlite.h"

@interface ReceptionViewController : UIViewController<UIAlertViewDelegate, UITextViewDelegate, UITextFieldDelegate>
{
    //IBOutlet UIScrollView *scrollView;
    
    NSString *str_DocumentName, * path, *path1, *path2, *str_CreatedDate;
    
    UIBarButtonItem * saveButton , * pdfButton, *savebut ;
    
    IBOutlet UITextField *datetf1, *datetf2;
    
    bool bool_SavedTofile, saved_Into_DB;
    
    UIImageView * currentImageView ;
    
    UITextView * currentTextView ;
    
    NSArray * array_Btns ;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView, *topScrollView;

@property(nonatomic, retain)IBOutlet UIView *view1, *view2, *view3, *view4, *view5, *view6, *view7, *view8, *view9, *view10, *view11, *view12, *view13, *view14, *view15, *view16, *view17, *view18, *view19, *view20, *view21, *view22, *view23, *view24, *view25, *view26, *view27, *view28, *view29, *view30, *view31, *view32, *view33, *view34, *view35, *view36, *view37, *view38, *view39, *view40, *view41, *view42, *view43, *view44, *view45, *view46, *view47, *view48, *view49, *view50, *view51, *view52, *view53, *view54, *view55, *view56, *view57, *view58, *view59, *view60, *view61, *view62, *view63, *view64, *view65, *view66, *view67, *view68, *view69, *view70, *view71, *view72, *view73, *view74, *view75, *view76, *view77, *view78, *view79, *view80, *view81, *view82, *view83, *view84, *view85, *view86, *view87, *view88, *view89, *view90, *view91, *view92, *view93, *view94, *view95, *view96, *view97, *view98, *view99;

@property(nonatomic,retain)IBOutlet UIView *mainview5, *mainview4, *mainview3;


@property(nonatomic, retain) NSString *rating;

@property (nonatomic, retain)IBOutlet UIButton *partbut1, *partbut2, *partbut3, *partbut4, *partbut5, *difbut1, *difbut2, *difbut3, *difbut4, *difbut5;

@property (nonatomic,retain) IBOutlet UIView *votsatvw, *listdeview;

@property(nonatomic, retain)IBOutlet UIBarButtonItem *bbbbb;

-(IBAction)buttonclicked:(id)sender;

-(IBAction)radbutclicked:(id)sender;



@property (strong, nonatomic) IBOutlet UITextField *txt_nombre;

@property (strong, nonatomic) IBOutlet UITextField *lbl_Emetteur;
@property (strong, nonatomic) IBOutlet UITextField *lbl_Raison;
@property (strong, nonatomic) IBOutlet UITextField *lbl_NProject;
@property (strong, nonatomic) IBOutlet UITextField *lbl_Libelle;
@property (strong, nonatomic) IBOutlet UITextField *lbl_Change_Affaires;
@property (strong, nonatomic) IBOutlet UITextField *lbl_ChefdProj;

@property (strong, nonatomic) IBOutlet UITextField *lbl_Liste_Nom1;
@property (strong, nonatomic) IBOutlet UITextField *lbl_Liste_Nom2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Liste_Nom3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Liste_Nom4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Liste_Nom5;

@property (strong, nonatomic) IBOutlet UITextField *lbl_Liste_Societe1;
@property (strong, nonatomic) IBOutlet UITextField *lbl_Liste_Societe2;
@property (strong, nonatomic) IBOutlet UITextField *lbl_Liste_Societe3;
@property (strong, nonatomic) IBOutlet UITextField *lbl_Liste_Societe4;
@property (strong, nonatomic) IBOutlet UITextField *lbl_Liste_Societe5;

@property (strong, nonatomic) IBOutlet UITextField *lbl_Mail1;
@property (strong, nonatomic) IBOutlet UITextField *lbl_Mail2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Mail3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Mail4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Mail5;

@property (strong, nonatomic) IBOutlet UITextField *txt_Commande;
@property (strong, nonatomic) IBOutlet UITextField *txt_Offre;
@property (strong, nonatomic) IBOutlet UITextField *txt_Commande_Client;
@property (strong, nonatomic) IBOutlet UITextField *txt_Commande_Fournisseur;
@property (strong, nonatomic) IBOutlet UIButton *btn_Plate_forme;
@property (strong, nonatomic) IBOutlet UIButton *btn_Fournisseur;
@property (strong, nonatomic) IBOutlet UIButton *btn_Site_Client;
@property (strong, nonatomic) IBOutlet UIButton *btn_du_materiel;
@property (strong, nonatomic) IBOutlet UIButton *btn_des_prestations;
@property (strong, nonatomic) IBOutlet UIButton *btn_du_logiciel;
@property (strong, nonatomic) IBOutlet UIButton *btn_de_la_fin_du_montage;
@property (strong, nonatomic) IBOutlet UIButton *btn_de_la_mise_sous_tension;
@property (strong, nonatomic) IBOutlet UIButton *btn_de_la_mise_en_service;
@property (strong, nonatomic) IBOutlet UIButton *btn_des_essais_plateforme;
@property (strong, nonatomic) IBOutlet UITextView *txt_Les_prestations;
@property (strong, nonatomic) IBOutlet UITextView *txt_Detail_des_realises;
@property (strong, nonatomic) IBOutlet UIButton *btn_sauvegardes;


@property (strong, nonatomic) IBOutlet UITextField *txt_Nom_Sauvegarde1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nom_Sauvegarde2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nom_Sauvegarde3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nom_Sauvegarde4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nom_Sauvegarde5;

@property (strong, nonatomic) IBOutlet UITextField *txt_Type1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Type2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Type3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Type4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Type5;

@property (strong, nonatomic) IBOutlet UITextField *txt_Format1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Format2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Format3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Format4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Format5;


@property (strong, nonatomic) IBOutlet UITextField *txt_Commentaire1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Commentaire2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Commentaire3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Commentaire4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Commentaire5;

@property (strong, nonatomic) IBOutlet UIButton *btn_Sans_Reserve;
@property (strong, nonatomic) IBOutlet UIButton *btn_Nombre_de_reserves;



@property (strong, nonatomic) IBOutlet UITextField *txt_Nom1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nom2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nom3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nom4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Societe1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Societe2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Societe3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Societe4;


@property (strong, nonatomic) IBOutlet UITextField *txt_Fonction1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Fonction2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Fonction3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Fonction4;


@property (strong, nonatomic) IBOutlet UITextField *txt_Date1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date4;


@property (strong, nonatomic) IBOutlet UITextView *txt_Visas1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Visas2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Visas3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Visas4;


@property (strong, nonatomic) IBOutlet UITextField *txt_sur0;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur1;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur2;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur3;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur4;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur5;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur6;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur7;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur8;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur9;
@property (strong, nonatomic) IBOutlet UITextField *txt_sur10;

@property (strong, nonatomic) IBOutlet UITextView *txt_Vos_remarques;

@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Nom1;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Nom2;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Nom3;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Nom4;

@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Societe1;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Societe2;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Societe3;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Societe4;


@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Fonction1;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Fonction2;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Fonction3;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Fonction4;


@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Date1;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Date2;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Date3;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Date4;

@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Visas1;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Visas2;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Visas3;
@property (strong, nonatomic) IBOutlet UITextField *txt_levee_Visas4;

@property(nonatomic,retain) IBOutlet UITextField *procedur_le;


@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve6;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve7;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve8;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve9;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve10;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve11;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve12;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve13;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve14;
@property (strong, nonatomic) IBOutlet UITextView *txt_Reserve15;


@property (strong, nonatomic) IBOutlet UITextView *txt_Action1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action6;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action7;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action8;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action9;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action10;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action11;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action12;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action13;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action14;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action15;



@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote6;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote7;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote8;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote9;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote10;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote11;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote12;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote13;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote14;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote15;

@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date5;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date6;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date7;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date8;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date9;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date10;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date11;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date12;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date13;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date14;
@property (strong, nonatomic) IBOutlet UITextField *txt_Obj_Date15;


@property (strong, nonatomic) IBOutlet UIImageView *img_Solde1;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde2;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde3;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde4;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde5;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde6;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde7;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde8;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde9;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde10;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde11;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde12;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde13;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde14;
@property (strong, nonatomic) IBOutlet UIImageView *img_Solde15;

@property (strong, nonatomic) IBOutlet UIButton *btn_Edit1;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit2;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit3;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit4;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit5;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit6;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit7;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit8;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit9;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit10;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit11;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit12;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit13;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit14;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit15;


@property (strong, nonatomic) IBOutlet UIButton *btn_Sur0;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur1;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur2;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur3;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur4;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur5;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur6;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur7;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur8;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur9;
@property (strong, nonatomic) IBOutlet UIButton *btn_Sur10;

@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;


@end
