//
//  RiskAnalysisViewController.h
//  Causerie
//
//  Created by X-Value Technologies on 27/02/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBSqlite.h"
#import <MessageUI/MessageUI.h>
#import "SignaVC.h"
#import "SchemaVC.h"

@interface RiskAnalysisViewController : UIViewController<UIScrollViewDelegate,MFMailComposeViewControllerDelegate, SignaVCDelegate, SchemaVCDelegate, UITextFieldDelegate,UIAlertViewDelegate,UITextViewDelegate>

{
    int i;
    NSString *path;
    NSString *dateStr, *datestring;
    BOOL  bool_SavedTofile;
    UIBarButtonItem * saveButton , * pdfButton ;
    
    NSString *b1, *b2, *b3, *b4, *b5, *b6, *b7, *b8, *b9, *b10, *b11, *b12, *b13, *b14, *b15, *b16, *b17, *b18, *b19, *b20,*b21, *b22, *b23, *b24, *b25, *b26, *b27, *b28, *b29, *b30, *b31, *b32, *b33, *b34, *b35, *b36, *b37, *b38, *b39, *b40, *b41, *b42, *doc_mod_date;
    
    NSString *tpb1,*tpb2,*tpb3,*tpb4,*tpb5,*tpb6,*tpb7,*tpb8,*tpb9,*tpb10,*tpb11,*tpb12,*tpb13,*tpb14,*tpb15,*tpb16,*tpb17,*tpb18,*tpb19,*tpb20,*tpb21;
    
    NSData *datasig1, *datasig2, *datasig3, *datasig4, *datasig5;
    NSString * str_DocumentName , *str_CreatedDate;
    
    BOOL sig1clicked,sig2clicked,sig3clicked,sig4clicked, saved_Into_DB;
    
    UIImageView * img_CurrentImage ;
    
    UIView *titlebackgrond2;
    BOOL needsRemoveFirstResponder;
}

@property (nonatomic, weak)UIView *sigView1,*sigView3,*sigView4;

@property (weak,nonatomic)IBOutlet UILabel *doc_name;
@property (weak, nonatomic) IBOutlet UIView *titleview, *sig1view;
@property (weak, nonatomic) IBOutlet UIView *firstrowfirst;
@property (weak, nonatomic) IBOutlet UIView *firstrowsecd;
@property (weak, nonatomic) IBOutlet UIView *firsrtowthird;
@property (weak, nonatomic) IBOutlet UIView *secondrowview;
@property (weak, nonatomic) IBOutlet UIView *thirdrowview;
@property (weak, nonatomic) IBOutlet UIView *fourthrowview;
@property (weak, nonatomic) IBOutlet UIView *fourthrowview2;
@property (weak, nonatomic) IBOutlet UIView *fourthrowview3;
@property (weak, nonatomic) IBOutlet UIView *titleview2;
@property (weak, nonatomic) IBOutlet UIView *descriptionview;
@property (weak, nonatomic) IBOutlet UIView *listview;
@property (weak, nonatomic) IBOutlet UIView *listview1;
- (IBAction)checkbox1:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *checkbox1;
@property(nonatomic,strong)UIImage *image2,*image1;
@property (weak, nonatomic) IBOutlet UIView *listview2;
- (IBAction)checkbox2:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *checkbox2;
@property (weak, nonatomic) IBOutlet UIView *listview3;
@property (weak, nonatomic) IBOutlet UIButton *checkbox3;
- (IBAction)checkbox3:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview4;
@property (weak, nonatomic) IBOutlet UIButton *checkbox4;
- (IBAction)checkbox4:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview5;

@property (weak, nonatomic) IBOutlet UIButton *checkbox5;
- (IBAction)checkbox5:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview6;
@property (weak, nonatomic) IBOutlet UIButton *checkbox6;
- (IBAction)checkbox6:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview7;
@property (weak, nonatomic) IBOutlet UIButton *checkbox7;
- (IBAction)checkbox7:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview8;
@property (weak, nonatomic) IBOutlet UIButton *checkbox8;
- (IBAction)checkbox8:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview9;
@property (weak, nonatomic) IBOutlet UIButton *checkbox9;
- (IBAction)checkbox9:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview10;

@property (weak, nonatomic) IBOutlet UIButton *checkbox10;
- (IBAction)checkbox10:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview11;

@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;

@property (weak, nonatomic) IBOutlet UIButton *checkbox11;
- (IBAction)checkbox11:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview12;
@property (weak, nonatomic) IBOutlet UIButton *checkbox12;
- (IBAction)checkbox12:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview13;
@property (weak, nonatomic) IBOutlet UIButton *checkbox13;
- (IBAction)checkbox13:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview14;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIButton *checkbox14;
- (IBAction)checkbox14:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview15;
@property (weak, nonatomic) IBOutlet UIButton *checkbox15;
- (IBAction)checkbox15:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview16;
@property (weak, nonatomic) IBOutlet UIButton *checkbox16;
- (IBAction)checkbox16:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview17;
@property (weak, nonatomic) IBOutlet UIButton *checkbox17;
- (IBAction)checkbox17:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *listview18;
@property (weak, nonatomic) IBOutlet UIButton *checkbox18;
- (IBAction)checkbox18:(id)sender;
@property(nonatomic,strong)UIButton *checkboxes17,*checkboxes18,*checkboxes19,*checkboxes20,*checkboxes21,*view1checkbox1,*view1checkbox2,*view1checkbox3,*view1checkbox4,*view1checkbox5,*view1checkbox6,*view1checkbox7,*view1checkbox8,*view2checkbox1,*view2checkbox2,*view2checkbox3,*view2checkbox4,*view2checkbox5,*border3checkbox1,*border3checkbox2,*border3checkbox11,*border3checkbox12,*border3checkbox13,*border3checkbox14,*border3checkbox15,*border3checkbox16,*border3checkbox17,*border3checkbox18,*border3checkbox21,*border3checkbox22,*border3checkbox23,*border3checkbox24,*border3checkbox25,*border3checkbox26,*border3checkbox27,*border3checkbox28,*border3checkbox31,*border3checkbox32,*border3checkbox33,*border3checkbox34,*border3checkbox35,*border3checkbox321,*border3checkbox322,*border3checkbox323,*border3checkbox324,*border3checkbox325,*bigbox;
@property(nonatomic,strong)UIView *listviews1,*listviews2,*listviews3,*listviews4,*listviews5,*border1,*border2,*border3,*border4,*border5,*smallview1,*smallview2,*smallview3,*smallview4;
@property (weak, nonatomic) IBOutlet UIView *listviews20;

@property (nonatomic,retain)IBOutlet UIBarButtonItem *bbbbb;

@property (nonatomic,retain)IBOutlet UIView  *vw_si_les, *vw_rappel;

@property (nonatomic,retain)IBOutlet UITextView *view2tv1, *view1tv1, *textv2, *textv, *textv1;



// New code

@property(nonatomic,retain)IBOutlet UITextField *nde_dossier, *date_des_travaux, *ndu_pdp, *ndu_ppsp, *ouvrage_concerne, *libelle_des_travaux, *nom, *amont_la_tension, *aval_la_tension, *autorisation_de_travail_nom, *nom1_text, *nom2_text;

@property (nonatomic,retain) IBOutlet UIImageView *imagesign1, *signature1, *sig1, *sig2, *border2backimage;

@property (nonatomic,retain)IBOutlet UIButton *button1, *button2, *button3, *button4, *button5, *button6, *button7, *button8, *button9, *button10, *button11, *button12, *button13, *button14, *button15, *button16, *button17, *button18, *button19, *button20, *button21,*button22, *button23, *button24, *button25, *button26, *button27, *button28, *button29, *button30, *button31, *button32, *button33, *button34, *button35, *button36, *button37, *button38, *button39, *button40, *button41;

@property (nonatomic,retain)IBOutlet UIButton *editBut2, *editBut3, *editBut4;

@property (nonatomic,retain)IBOutlet UIButton *tpbutton1, *tpbutton2, *tpbutton3, *tpbutton4, *tpbutton5, *tpbutton6, *tpbutton7, *tpbutton8, *tpbutton9, *tpbutton10, *tpbutton11, *tpbutton12, *tpbutton13, *tpbutton14, *tpbutton15, *tpbutton16, *tpbutton17, *tpbutton18, *tpbutton19, *tpbutton20, *tpbutton21;

-(IBAction)butclicked:(id)sender;

-(IBAction)editbutclicked:(UIButton *)sender;

-(IBAction)scheditbutclicked:(id)sender;



@end
