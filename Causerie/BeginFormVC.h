

#import <UIKit/UIKit.h>
#import "SignaVC.h"


@interface BeginFormVC : UIViewController<UITextViewDelegate>
{
    IBOutlet UIScrollView *scrollView;
    int i, j;
    NSString *path;
    NSString *datestring, *moddt;
    NSData *dataimage1, *dataimage2, *dataimage3, *dataimage4, *dataimage5, *dataimage6, *dataimage7;
    NSString * str_DocumentName , *str_CreatedDate;
    BOOL sig1clicked, sig2clicked, sig3clicked, sig4clicked, sig5clicked, sig6clicked, sig7clicked;
    BOOL bool_SavedTofile, saved_Into_DB;
    UIBarButtonItem * saveButton , * pdfButton ;
}

@property (nonatomic,retain)IBOutlet UIView *view1, *view2, *view3, *view4, *view5, *view6, *view7, *view8, *view9, *view10, *view11, *view12, *view13;
@property (nonatomic,retain)IBOutlet UIView *view14, *view15, *view16, *view17, *view18, *view19, *view20;
@property (nonatomic, retain)IBOutlet UIView *view21, *view22, *view23, *view24, *view25, *view26, *view27, *view28, *view29, *view30;
@property (nonatomic, retain)IBOutlet UIView *view31, *view32, *view33, *view34, *view35, *view36, *view37, *view38, *view39, *view40;
@property (nonatomic, retain)IBOutlet UIView *view41, *view42, *view43, *view44, *view45, *view46, *view47, *view48, *view49, *view50;
@property (nonatomic, retain)IBOutlet UIView *view51, *view52, *view53, *view54, *view55, *view56, *view57, *view58, *view59, *view60;
@property (nonatomic, retain)IBOutlet UIView *view61, *view62, *view63, *view64, *view65, *view66, *view67, *view68, *view69, *view70;
@property (nonatomic,retain)IBOutlet UILabel *lhead1, *lhead2, *lhead3, *lhead4, *lhead5, *lhead6, *lhead7, *lhead8;

@property (nonatomic,retain)IBOutlet UITextField *destf1, *destf2, *destf3, *destf4, *destf5, *destf6, *destf7;

@property (nonatomic,retain)IBOutlet UIImageView *img_Sign1;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign2;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign3;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign4;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign5;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign6;
@property (strong, nonatomic) IBOutlet UIImageView *img_Sign7;

@property(nonatomic, retain)IBOutlet UIBarButtonItem *bbbbb;

@property (strong, nonatomic) IBOutlet UIView *imgView1, *imgView2,*imgView3,*imgView4,*imgView5,*imgView6,*imgView7;


@property (nonatomic, retain)IBOutlet UIImageView *imgSign1, *imgSign2, *imgSign3, *imgSign4, *imgSign5, *imgSign6, *imgSign7;

@property(nonatomic,retain)IBOutlet UITextField *site, *societe, *adresse1, *adresse2, *cp, *ville;

@property (nonatomic, retain) IBOutlet UITextView *nom1, *nom2, *nom3, *nom4, *nom5, *nom6, *nom7, *habilitation1, *habilitation2, *habilitation3, *habilitation4, *habilitation5, *habilitation6, *habilitation7, *gies1, *gies2, *gies3, *gies4, *gies5, *gies6, *gies7, *risque_chimique1, *risque_chimique2, *risque_chimique3, *risque_chimique4, *risque_chimique5, *risque_chimique6, *risque_chimique7, *atex1, *atex2, *atex3, *atex4, *atex5, *atex6, *atex7, *restriction1, *restriction2, *restriction3, *restriction4, *restriction5, *restriction6, *restriction7, *autes1, *autes2, *autes3, *autes4, *autes5, *autes6, *autes7, *date_et_sign1, *date_et_sign2, *date_et_sign3, *date_et_sign4, *date_et_sign5, *date_et_sign6, *date_et_sign7;

-(void)showEmail;

- (void)openPerPagePDF;

-(void)saveToDataBase;

-(IBAction)editbutclicked:(id)sender;

@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;

@end
