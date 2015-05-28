//
//  PreventionPlanVC.h
//  Causerie
//
//  Created by Balladonia iTechnologies on 18/02/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawLine.h"
#import <MessageUI/MessageUI.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface PreventionPlanVC : UIViewController < UITextFieldDelegate, UIAlertViewDelegate,UITextViewDelegate,UIPopoverControllerDelegate >
{
    IBOutlet UIScrollView *scrollview;
    NSMutableArray * array_SignatureData ;
    UITextField * date_CurrentTextfield ;
    NSString * str_DocumentName , * path, *str_CreatedDate;
    UIImageView *currentImageView ;
    BOOL bool_SavedTofile, saved_Into_DB;
    UIBarButtonItem * saveButton, * pdfButton, *savebut ;
}
@property (strong, nonatomic) IBOutlet UITextField *txt_numero;


@property (strong, nonatomic) IBOutlet UITextField *txt_EU_Enterprise;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE1_Enterprise;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE2_Enterprise;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE3_Enterprise;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE4_Enterprise;

@property (strong, nonatomic) IBOutlet UIButton *btn_Edit1;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit2;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit3;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit4;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit5;

@property (strong, nonatomic) IBOutlet UITextField *txt_EU_Representee;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE1_Representee;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE2_Representee;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE3_Representee;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE4_Representee;

@property (strong, nonatomic) IBOutlet UITextField *txt_EU_Nature;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE1_Nature;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE2_Nature;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE3_Nature;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE4_Nature;

@property (strong, nonatomic) IBOutlet UITextField *txt_EU_Effect;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE1_Effect;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE2_Effect;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE3_Effect;
@property (strong, nonatomic) IBOutlet UITextField *txt_EE4_Effect;


@property (strong, nonatomic) IBOutlet UITextView *txt_Desc_Operation;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_debut;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_previsible;
@property (strong, nonatomic) IBOutlet UITextView *txt_Adresse;
@property (strong, nonatomic) IBOutlet UITextView *txt_Listes;
@property (strong, nonatomic) IBOutlet UITextView *txt_Consignes;


@property (strong, nonatomic) IBOutlet UITextField *txt_N1;
@property (strong, nonatomic) IBOutlet UITextField *txt_N2;
@property (strong, nonatomic) IBOutlet UITextField *txt_N3;
@property (strong, nonatomic) IBOutlet UITextField *txt_N4;
@property (strong, nonatomic) IBOutlet UITextField *txt_N5;
@property (strong, nonatomic) IBOutlet UITextField *txt_N6;
@property (strong, nonatomic) IBOutlet UITextField *txt_N7;
@property (strong, nonatomic) IBOutlet UITextField *txt_N8;
@property (strong, nonatomic) IBOutlet UITextField *txt_N9;
@property (strong, nonatomic) IBOutlet UITextField *txt_N10;

@property (strong, nonatomic) IBOutlet UIImageView *img_Signature1;
@property (strong, nonatomic) IBOutlet UIImageView *img_Signature2;
@property (strong, nonatomic) IBOutlet UIImageView *img_Signature3;
@property (strong, nonatomic) IBOutlet UIImageView *img_Signature4;
@property (strong, nonatomic) IBOutlet UIImageView *img_Signature5;

@property (strong, nonatomic) IBOutlet UITextView *txt_Accident;
@property (strong, nonatomic) IBOutlet UITextView *txt_Infirmerie;
@property (strong, nonatomic) IBOutlet UITextView *txt_Autre;


@property(nonatomic,retain)IBOutlet UIBarButtonItem *bbbbb;

@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;

@end
