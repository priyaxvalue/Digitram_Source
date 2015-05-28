//
//  CauserieQSSEViewController.h
//  Digitram
//
//  Created by Ravi on 26/05/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridTableViewCell.h"
#import "DBSqlite.h"
#import "DrawLine.h"
#import <MessageUI/MessageUI.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface CauserieQSSEViewController : UIViewController< UIGestureRecognizerDelegate,UIAlertViewDelegate ,UITextViewDelegate>
{
    CGPoint lastPoint;
    BOOL mouseSwiped, bool_SavedTofile,saved_Into_DB;
    int mouseMoved;
    int i ;
    NSString * str_DocumentName , * path, *str_CreatedDate;
    UIImageView * currentImageView ;
    UIBarButtonItem * saveButton, * pdfButton ;
    BOOL sig1clicked;
}
@property (strong, nonatomic) IBOutlet UIView *view_Participants;
@property (strong, nonatomic) IBOutlet UILabel *lbl_CauserieQsse;

@property(nonatomic)BOOL confirmpdf;

@property(nonatomic, retain)NSMutableArray *dataarray, *imagearray1,*imagearray2,*imagearray3,*imagearray4,*imagearray5,*imagearray6,*imagearray7,*imagearray8,*imagearray9,*imagearray10,*imagearray11,*imagearray12,*imagearray13,*imagearray14,*imagearray15;

@property ( nonatomic, strong) DrawLine * obj ;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Heading;
@property (strong, nonatomic) IBOutlet UITextField *txt_poleqsse;
@property (strong, nonatomic) IBOutlet UITextField *txt_Reference;
@property (strong, nonatomic) IBOutlet UITextField *txt_animateur;
@property (strong, nonatomic) IBOutlet UITextField *txt_date;
@property (weak, nonatomic) IBOutlet UITextView *txt_Themes;

@property(nonatomic,strong ) NSMutableArray *array_items,*arr_names;
@property (strong, nonatomic) IBOutlet UIScrollView *scrl_View;

@property(nonatomic,retain)UIBarButtonItem *bbbbb;

@property (strong, nonatomic) IBOutlet UIImageView *img_Sign1;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign2;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign3;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign4;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign5;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign6;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign7;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign8;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign9;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign10;

@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom1;
@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom2;
@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom3;
@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom4;
@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom5;
@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom6;
@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom7;
@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom8;
@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom9;
@property (strong, nonatomic) IBOutlet UITextView *txt_nom_prenom10;

@property (strong, nonatomic) IBOutlet UITextView *txt_Commentaires;
@property (strong, nonatomic) IBOutlet UITextView *txt_Remarques;

@property (strong, nonatomic) IBOutlet UITextView *txt_Proposition;
@property (strong, nonatomic) IBOutlet UITextView *txt_Pilote;
@property (strong, nonatomic) IBOutlet UITextView *txt_Delai;
@property (strong, nonatomic) IBOutlet UITextView *txt_Realise;

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

@property(nonatomic,retain)IBOutlet UIView *lastview, *sigview;

@property (strong, nonatomic) IBOutlet UITextField *txt_Nom;
@property (strong, nonatomic) IBOutlet UIImageView *img_Signature_Nom;
@property (strong, nonatomic) IBOutlet UIButton *btn_Edit;

-(IBAction)editbutclicked:(id)sender;

@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;


@end
