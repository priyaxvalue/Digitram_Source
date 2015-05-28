//
//  Intervention.h
//  Digitram
//
//  Created by Balladonia iTechnologies on 02/04/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface Intervention : UIViewController<MFMailComposeViewControllerDelegate>
{
    NSString *path;
    UIBarButtonItem * saveButton , * pdfButton ;
    BOOL  bool_SavedTofile ;
    NSString * str_CreatedDate , * str_DocumentName;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrl_view;


@property (strong, nonatomic) IBOutlet UITextField *txt_N_dossier;
@property (strong, nonatomic) IBOutlet UITextField *txt_N_contrat;
@property (strong, nonatomic) IBOutlet UITextField *txt_passeur_ordre;
@property (strong, nonatomic) IBOutlet UITextField *txt_passeur_Adresse;
@property (strong, nonatomic) IBOutlet UITextField *txt_Client_Final;
@property (strong, nonatomic) IBOutlet UITextField *txt_Client_Adresse;
@property (strong, nonatomic) IBOutlet UIView *view_Nature_Contrat;
@property (strong, nonatomic) IBOutlet UIView *txt_Maintenance;
@property (strong, nonatomic) IBOutlet UIView *txt_Depannage_hors;
@property (strong, nonatomic) IBOutlet UIView *view_Depannage_sous;
@property (strong, nonatomic) IBOutlet UIView *view_Mise;
@property (strong, nonatomic) IBOutlet UIView *view_Renovation;
@property (strong, nonatomic) IBOutlet UIView *view_Autres;

@property (strong, nonatomic) IBOutlet UITextField *txt_Numero_semaine;

@property (strong, nonatomic) IBOutlet UITextField *txt_Nibre_intervenants;

@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Lundi;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Mardi;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Mercredi;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Jeudi;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Vendredi;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Samedi;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Dimanche;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Pu;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Total;


@property (strong, nonatomic) IBOutlet UITextField *txt_H1_Lundi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H1_Mardi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H1_Mercredi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H1_Jeudi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H1_Vendredi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H1_Samedi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H1_Dimanche;
@property (strong, nonatomic) IBOutlet UITextField *txt_H1_PU;
@property (strong, nonatomic) IBOutlet UITextField *txt_H1_Total;


@property (strong, nonatomic) IBOutlet UITextField *txt_H2_Lundi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H2_Mardi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H2_Mercredi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H2_Jeudi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H2_Vendredi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H2_Samedi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H2_Dimanche;
@property (strong, nonatomic) IBOutlet UITextField *txt_H2_PU;
@property (strong, nonatomic) IBOutlet UITextField *txt_H2_Total;


@property (strong, nonatomic) IBOutlet UITextField *txt_H3_Lundi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H3_Mardi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H3_Mercredi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H3_Jeudi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H3_Vendredi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H3_Samedi;
@property (strong, nonatomic) IBOutlet UITextField *txt_H3_Dimanche;
@property (strong, nonatomic) IBOutlet UITextField *txt_H3_PU;
@property (strong, nonatomic) IBOutlet UITextField *txt_H3_Total;

@property (strong, nonatomic) IBOutlet UITextField *txt_Nbre1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nbre2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nbre3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nbre4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nbre5;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nbre6;

@property (strong, nonatomic) IBOutlet UITextField *txt_Remplacees1;
@property (strong, nonatomic) IBOutlet UITextField *txt_Remplacees2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Remplacees3;
@property (strong, nonatomic) IBOutlet UITextField *txt_Remplacees4;
@property (strong, nonatomic) IBOutlet UITextField *txt_Remplacees5;
@property (strong, nonatomic) IBOutlet UITextField *txt_Remplacees6;


@property (strong, nonatomic) IBOutlet UITextView *txt_Detail_Intervention;

@property (strong, nonatomic) IBOutlet UIView *view_Attente;
@property (strong, nonatomic) IBOutlet UIView *view_Regles;
@property (strong, nonatomic) IBOutlet UIView *view_Temps;
@property (strong, nonatomic) IBOutlet UIView *view_Caracteristique;
@property (strong, nonatomic) IBOutlet UIView *view_Cablages;
@property (strong, nonatomic) IBOutlet UIView *view_Autre;
@property (strong, nonatomic) IBOutlet UIView *view_Schneider;
@property (strong, nonatomic) IBOutlet UIView *view_Entreprise;

@property (strong, nonatomic) IBOutlet UITextView *txt_Travaux;
@property (strong, nonatomic) IBOutlet UITextView *txt_Encheance;
@property (strong, nonatomic) IBOutlet UITextView *txt_Observations;

@property (strong, nonatomic) IBOutlet UITextField *txt_Nom1;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit1;
@property (strong, nonatomic) IBOutlet UIImageView *img_Signature1;


@property (strong, nonatomic) IBOutlet UITextField *txt_Nom2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Enterprise;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit2;
@property (strong, nonatomic) IBOutlet UIImageView *img_Signature2;






@end
