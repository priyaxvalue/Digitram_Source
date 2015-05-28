

#import <UIKit/UIKit.h>

@interface AdequacyVC : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{
    IBOutlet UIScrollView *scrollView;
    
    
    
    int i ;
    
    NSString *path;
    NSString *datestring;
    NSString *b1;
    NSString *b2, *b3, *b4, *b5, *b6, *b7, *b8, *b9, *b10, *b11, *b12, *b13, *b14, *b15, *b16, *b17, *b18, *b19, *b20, *b21, *b22, *b23, *b24, *b25, *b26, *b27, *doc_modified_date;
    NSString  * str_DocumentName , * str_CreatedDate;
    
    UIImage *imag;
    
    BOOL sig1clicked, sig2clicked;
    
    BOOL bool_Moved , bool_SavedTofile, saved_Into_DB;
    UIBarButtonItem * saveButton , * pdfButton , *savebut;
    
}

@property(nonatomic, retain)IBOutlet NSData *datafrm;
@property(nonatomic,retain) IBOutlet UIView *img1view;
@property(nonatomic,retain) IBOutlet UIView *img2view;
@property(nonatomic,retain)IBOutlet UIButton *bgrue;
@property(nonatomic,retain)IBOutlet UIButton *bpemp;
@property(nonatomic,retain)IBOutlet UIButton *bengn;
@property(nonatomic,retain)IBOutlet UIButton *bpont;
@property(nonatomic,retain)IBOutlet UIButton *bacces;
@property(nonatomic,retain)IBOutlet UIButton *blope1;
@property(nonatomic,retain)IBOutlet UIButton *blope2;
@property(nonatomic,retain)IBOutlet UIButton *bleng1;
@property(nonatomic,retain)IBOutlet UIButton *bleng2;
@property(nonatomic,retain)IBOutlet UIButton *bles1;
@property(nonatomic,retain)IBOutlet UIButton *bles2;
@property(nonatomic,retain)IBOutlet UIButton *blengc1;
@property(nonatomic,retain)IBOutlet UIButton *blengc2;
@property(nonatomic,retain)IBOutlet UIButton *blengt1;
@property(nonatomic,retain)IBOutlet UIButton *blengt2;
@property(nonatomic,retain)IBOutlet UIButton *badeq1;
@property(nonatomic,retain)IBOutlet UIButton *badeq2;
@property(nonatomic,retain)IBOutlet UIButton *bprise1;
@property(nonatomic,retain)IBOutlet UIButton *bprise2;
@property(nonatomic,retain)IBOutlet UIButton *bprisefos1;
@property(nonatomic,retain)IBOutlet UIButton *bprisefos2;
@property(nonatomic,retain)IBOutlet UIButton *bprisepou1;
@property(nonatomic,retain)IBOutlet UIButton *bprisepou2;
@property(nonatomic,retain)IBOutlet UIButton *bpriseora1;
@property(nonatomic,retain)IBOutlet UIButton *bpriseora2;
@property(nonatomic,retain)IBOutlet UIButton *bzone1;
@property(nonatomic,retain)IBOutlet UIButton *bzone2;

@property(nonatomic,retain)IBOutlet UIBarButtonItem *bbbbb;

@property(nonatomic, retain)IBOutlet UIImageView *imgSign1;

@property(nonatomic, retain)IBOutlet UIImageView *imgSign2;

@property (nonatomic,retain)IBOutlet UITextField *tfch, *prop, *datf1, *datf2;
@property (nonatomic,retain)IBOutlet UITextField *headtf;

@property (nonatomic, retain)IBOutlet UITextView *adresse_du_chantier, *ver_controle_non_obs1, *ver_controle_non_obs2, *ver_controle_non_obs3, *ver_controle_non_obs4, *ver_controle_non_obs5, *examen_controle_obs1, *examen_controle_obs2, *examen_controle_obs3, *examen_controle_obs4, *examen_controle_obs5, *examen_controle_obs6;

@property (nonatomic,retain)IBOutlet UITextField *charge_de_travaux, *proprietaire_du_materiel, *no_dossier, *identi_marque, *identi_type, *identi_no, *identi_n_serie, *identi_no_immatri_grue, *examen_poids_total, *examen_cmu, *examen_cmu_des_accessories, *charge_de_travaux_nom, *levagiste_si_location_nom;


@property (nonatomic, retain)IBOutlet UIView *sheadview1, *view1, *view2, *view3, *sheadview2, *view4, *sheadview3, *view5, *view6, *view7, *view8, *view9, *view10, *view11, *view12, *view13, *view14, *view15, *view16, *view17, *view18, *view19, *view20, *view21, *view22, *sheadview4, *view23, *view24, *view25, *view26, *view27, *view28, *view29, *view30, *view31, *view32, *view33, *view34, *view35, *view36, *view37, *view38, *view39, *view40, *view41, *view42, *view43, *view44, *view45, *view46, *view47, *view48, *view49, *view50, *view51, *view52;

- (IBAction)buttonclicked:(id)sender;
-(IBAction)showEmail:(id)sender;

-(IBAction)editbutclicked:(id)sender;

@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;

@end

