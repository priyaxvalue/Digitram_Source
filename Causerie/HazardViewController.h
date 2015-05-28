//
//  HazardViewController.h
//  Causerie
//
//
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface HazardViewController : UIViewController < UITextFieldDelegate, UIAlertViewDelegate ,UITextViewDelegate>
{
    NSString * str_DocumentName , * path, *str_CreatedDate,*b1,*b2;
    UITextField * date_CurrentTextfield ;
    UIBarButtonItem * pdfButton , *saveButton ;
    BOOL bool_SavedTofile, saved_Into_DB ;
    NSString *ris_val;
}

@property (strong, nonatomic) IBOutlet UIView *view_NomPrenom;
@property (strong, nonatomic) IBOutlet UITextField *txt_NomPrenom;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_de_Incident_ou_de_soins_benins;
@property (strong, nonatomic) IBOutlet UITextField *txt_Siege_de_lesions;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_transmission_par_le_Dr_au_DRSI;
@property (strong, nonatomic) IBOutlet UITextView *txt_Type;
@property (strong, nonatomic) IBOutlet UITextView *txt_Actions;
@property (strong, nonatomic) IBOutlet UITextView *txt_Qui;
@property (strong, nonatomic) IBOutlet UITextView *txt_Delai;
@property (strong, nonatomic) IBOutlet UITextView *txt_Realise;


@property (weak, nonatomic) IBOutlet UITextField *txt_Nom_du_declarant;

@property (weak, nonatomic) IBOutlet UITextField *txt_date_de_reception;

@property (strong, nonatomic) IBOutlet UIScrollView *scroll_View;
@property(nonatomic, retain) IBOutlet UILabel *dimg_lbl1;
@property(nonatomic, retain) IBOutlet UILabel *dimg_lbl2;
@property(nonatomic, retain) IBOutlet UILabel *dimg_lbl3;
@property(nonatomic, retain) IBOutlet UILabel *dimg_lbl4;

@property (strong, nonatomic) IBOutlet UITextField *txt_Telephone;
@property (strong, nonatomic) IBOutlet UITextField *txt_lieu_de_levenement;


@property (strong, nonatomic) IBOutlet UITextField *txt_date_fiche;
@property (strong, nonatomic) IBOutlet UITextField *txt_temoins;
@property (strong, nonatomic) IBOutlet UITextField *txt_evaluation;
@property (strong, nonatomic) IBOutlet UITextField *txt_date_et_faits;

@property (strong, nonatomic) IBOutlet UITextView *txt_desc_faits;
@property (strong, nonatomic) IBOutlet UITextView *txt_Causes;
@property (strong, nonatomic) IBOutlet UITextView *txt_Mesure;
@property (strong, nonatomic) IBOutlet UITextView *txt_pilote;
@property (strong, nonatomic) IBOutlet UITextView *txt_delai;
@property (strong, nonatomic) IBOutlet UITextView *txt_Realise_Visa;

@property (strong, nonatomic) IBOutlet UITextField *txt_Date_Manager;
@property (strong, nonatomic) IBOutlet UITextField *txt_Nom;

@property (strong, nonatomic) IBOutlet UITextField *dimg_tf1;
@property (strong, nonatomic) IBOutlet UITextField *dimg_tf2, *dimg_tf3, *dimg_tf4, *dimg_tf5;

@property(nonatomic, retain)IBOutlet UIBarButtonItem *bbbbb;

@property (strong, nonatomic) IBOutlet UITextField *txt_Date_lemetteur;
@property (strong, nonatomic) IBOutlet UITextField *txt_Date_FSD;

@property(nonatomic, retain) IBOutlet UIView *dimg_view1, *dimg_view2, *dimg_view3, *dimg_view4, *dimg_view5, *dimg_view6, *dimg_view7, *dimg_view8, *dimg_view9, *dimg_view10, *dimg_view11, *dimg_view12, *dimg_view13, *dimg_view14, *dimg_view15, *dimg_view16, *dimg_view17, *dimg_view18, *dimg_view19, *dimg_view20, *dimg_view21, *dimg_view22, *dimg_view23, *dimg_view24, *dimg_view25, *dimg_view26, *dimg_view27, *dimg_view28, *dimg_view29, *dimg_view30, *dimg_view31, *dimg_view32, *dimg_view33, *dimg_view34, *dimg_view35;

@property(nonatomic, retain) IBOutlet UILabel *dimg_blbl1, *dimg_blbl2, *dimg_blbl3, *dimg_blbl4, *dimg_blbl5, *dimg_blbl6, *dimg_blbl7, *dimg_blbl8, *dimg_blbl9, *dimg_blbl10, *dimg_blbl11, *dimg_blbl12, *dimg_blbl13, *dimg_blbl14, *dimg_blbl15, *dimg_blbl16;


@property(nonatomic,retain)IBOutlet UIButton *dimg_bt1, *dimg_bt2, *dimg_bt3, *dimg_bt4, *dimg_bt5, *dimg_bt6, *dimg_bt7, *dimg_bt8, *dimg_bt9, *dimg_bt10, *dimg_bt11, *dimg_bt12, *dimg_bt13, *dimg_bt14, *dimg_bt15, *dimg_bt16,*fiche_btn,*incident_btn;

-(IBAction)buttcl:(id)sender;



@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;

@end