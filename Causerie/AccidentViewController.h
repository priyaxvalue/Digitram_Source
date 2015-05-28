//
//  AccidentViewController.h
//  Digitram
//
//  Created by Ravi on 26/05/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccidentViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>

{
    IBOutlet UIScrollView *scrollView;
    int i ;
    NSString *datestring;
    NSData *dataimage1, *dataimage2;
    NSString * str_DocumentName , * path, *str_CreatedDate;
    BOOL sig1clicked, sig2clicked, bool_SavedTofile, saved_Into_DB;
    UIBarButtonItem * saveButton , * pdfButton ;
    UIImageView * currentImageView ;
}

@property(nonatomic)IBOutlet NSString *b1, *b2, *b3, *b4, *b5, *b6, *b7, *b8, *b9, *b10, *b11, *b12, *b13, *b14, *b15, *b16, *b17, *b18, *b19, *b20, *b21, *b22;

@property(nonatomic)IBOutlet UIButton *editbut1, *editbut2;

@property(nonatomic)BOOL confirmpdf;

@property (strong, nonatomic) IBOutlet UIImageView *img_Signature1;
@property (strong, nonatomic) IBOutlet UIImageView *img_Signature2;

@property(nonatomic,retain)IBOutlet NSMutableArray *dataarray, *imagearray, *imagearray1;

@property(nonatomic,retain)IBOutlet UIView *employeurview, *accidenteview, *accidentview, *circonstancesview, *premiersoinsview, *consequencesview, *lineview1, *lineview2;

@property (nonatomic, retain)IBOutlet UIButton *bparsst, *bmede, *bets, *bdou, *bdnon, *bfou, *bfnon, *blavictra, *blavicint, *baffou, *baffnon,*badt, *baslc, *btb, *bb, *bm, *blhc, *bbu, *bat, *bocc, *bou, *bnon;


@property(nonatomic, retain)IBOutlet UITextField *emp_n_rue_bp, *emp_code_postal, *emp_commune, *acc_fonction, *acc_anciennete_au_poste, *acc_qualification, *acc_anc_au_poste, *acc_jour_de_laccident, *lieu_n_rue_bp, *lieu_code_postal, *lieu_commune, *temoin_immediat, *premiere_prosonne_ayent, *siege_des_lesions, *nature_des_lesions, *premiers_N_rue_bp, *premiers_code_postal, *premiers_commune, *donnees_si_non_preciser, *donnees_concernant_mesure, *la_victim_date, *la_victim_days, *declarant_name, *declarant_a, *declarant_text, *information_du_chsct, *doc_created_date, *doc_modified_date, *annee, *classement_no, *pris_no, *pris_a, *doc_name, *dateacctf, *decdatetf, *infdatetf, *prisdatetf, *vswtf, *daystf, *timetf, *accident_excercait_elle, *premiers_excercait_elle, *donnes_le_date, *empl, *accid,*txt_consequences;

@property (nonatomic,retain)IBOutlet UITextView *textview1, *textview2, *textview3, *textview4, *textview5;
@property(nonatomic,retain) IBOutlet UIView *img1view;
@property(nonatomic,retain) IBOutlet UIView *img2view;

@property (nonatomic,retain)IBOutlet UIBarButtonItem *bbbbb;

@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;

- (IBAction)buttonclicked:(id)sender;

-(IBAction)editbutclicked:(id)sender;


@end
