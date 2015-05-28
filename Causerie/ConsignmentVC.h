
#import <UIKit/UIKit.h>
#import "DBSqlite.h"
#import <MessageUI/MessageUI.h>
#import "SignaVC.h"

@interface ConsignmentVC : UIViewController<UITextFieldDelegate,UIPopoverControllerDelegate,
UIGestureRecognizerDelegate,MFMailComposeViewControllerDelegate, SignaVCDelegate, UIAlertViewDelegate>
{
    int i;
    
    
        CGPoint lastPoint;
        BOOL mouseSwiped;
        int mouseMoved;
    BOOL sig2clicked,sig1clicked, sig3clicked, sig4clicked, sig5clicked, sig6clicked, sig7clicked, sig8clicked, sig9clicked, sig10clicked, sig11clicked, sig12clicked;
    
    UIBarButtonItem * saveButton , * pdfButton, *savebut ;
    NSString *dateStr;
    NSString *filePath;
    NSString * str_DocumentName , * str_CreatedDate, * path;
    BOOL bool_SavedTofile, saved_Into_DB;

    IBOutlet UIScrollView *scrollView;
    
    IBOutlet UITextField *txtConsignation_m;
    IBOutlet UITextField *txtEnterprise;
    IBOutlet UITextField *txtConsignee_a;
    IBOutlet UITextField *txtConsignee_h;
    IBOutlet UITextField *txtConsignee_mn;
    IBOutlet UITextField *txtRisques;
    IBOutlet UITextField *txtSuivants;
    IBOutlet UITextField *txtConsignment;
    IBOutlet UITextField *txtAccord;
    IBOutlet UITextField *txtTermines_a;
    IBOutlet UITextField *txtTermines_h;
    IBOutlet UITextField *txtTermines_mn;
    IBOutlet UITextField *txtNecessaires;
    IBOutlet UITextField *txtRepresentant;
    IBOutlet UITextField *txtDeconsignation_a;
    IBOutlet UITextField *txtDeconsignation_h;
    IBOutlet UITextField *txtDeconsignation_mn;
    IBOutlet UITextField *txtAuthorisation_accord;
    IBOutlet UITextField *txtAuthorisation_consignation;
    IBOutlet UITextField *txtNom_remplace;
    IBOutlet UITextField *txtNom_remplacant;
    IBOutlet UITextField *txtSign_remplace;
    IBOutlet UITextField *txtSign_remplacant;
    IBOutlet UITextField *txtSign_consignation;
    IBOutlet UITextField *txtSign_consignation_a;
    IBOutlet UITextField *txtSign_consignation_h;
    IBOutlet UITextField *txtSign_consignation_mn;
    IBOutlet UITextField *txtDelegation_represent;
    IBOutlet UITextField *txtDelegation_demande;
    IBOutlet UITextField *txtDelegation_charge;
    IBOutlet UITextField *txtd_effectuer_les;
    IBOutlet UITextField *txtDelegation_a;
    IBOutlet UITextField *txtDelegation_h;
    IBOutlet UITextField *txtDelegation_mn;
    IBOutlet UITextField *txtDelegation_risques;
    IBOutlet UITextField *txtPlus_tard_a;
    IBOutlet UITextField *txtPlus_tard_h;
    IBOutlet UITextField *txtPlus_tard_mn;
    IBOutlet UITextField *txtle_represendant;
    IBOutlet UITextField *txtle_charge;
    IBOutlet UITextField *txtdecharge_represendant;
    IBOutlet UITextField *txtdecharge_de_toutes;
    IBOutlet UITextField *txtdecharge_de_travaux;
    IBOutlet UITextField *txtdecharge_suivant;
    IBOutlet UITextField *txtdecharge_duree_de;
    IBOutlet UITextField *txtdecharge_date;
    IBOutlet UITextField *txtdecharge_heure;
    IBOutlet UITextField *txtdecharge_travaux;
    IBOutlet UITextField *txtdecharge_le_represendant;
    
    
    IBOutlet UIImageView *img_Sign1;
     IBOutlet UIImageView *img_Sign2;
    
    UIImageView * currentImage ; 
    
}

@property(nonatomic, retain)IBOutlet UIView *img1view;
@property(nonatomic, retain)IBOutlet UIView *img2view;

@property(nonatomic,retain)IBOutlet UIBarButtonItem *bbbbb;

@property(nonatomic,retain)IBOutlet UIView *sigview1,*sigview2, *sigview3, *sigview4, *sigview5, *sigview6, *sigview7, *sigview8, *sigview9, *sigview10, *sigview11, *sigview12;

@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;

-(IBAction)generatePDF:(id)sender;
-(IBAction)editbutclicked:(id)sender;

@property (nonatomic,retain) IBOutlet UIImageView *imagevw1, *imagevw2, *imagevw3, *imagevw4, *imagevw5, *imagevw6, *imagevw7, *imagevw8, *imagevw9, *imagevw10, *imagevw11, *imagevw12;


@end
