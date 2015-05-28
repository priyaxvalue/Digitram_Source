//
//  SecurityViewController.h
//  Causerie
//
//  Created by Balladonia iTechnologies on 09/03/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawLine.h"
#import <MessageUI/MessageUI.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface SecurityViewController : UIViewController < UIWebViewDelegate , UIGestureRecognizerDelegate, UITextFieldDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>
{
    UIBarButtonItem * saveButton , * pdfButton ;
    NSString * str_CreatedDate ;
    UITextField * date_CurrentTextfield ;
    NSMutableArray * array_photos ;
    NSArray * array_PhotoView ;
    UIImage * selectedImage ;
    UIButton * btn_delete ;
    int currentIndex ;
    NSString * str_DocumentName ;
    BOOL bool_Moved , bool_SavedTofile, saved_Into_DB;
    
    UIAlertView* alertView1;
    
}
@property ( strong, nonatomic) UIImageView * image_Aide ;
@property ( strong, nonatomic) UICollectionView * viewCollectionView ;
@property ( nonatomic, strong) UIImagePickerController * controller ;

@property (strong, nonatomic) IBOutlet UIButton *btn_Edit;

@property (strong, nonatomic) IBOutlet DrawLine *view_QETRContainer;
@property (strong, nonatomic) IBOutlet UIScrollView *scrl_View;





@property (strong, nonatomic) IBOutlet UIButton *btn_QETR;
@property (strong, nonatomic) IBOutlet UIButton *btn_Aide;
@property (strong, nonatomic) IBOutlet UIButton *btn_Programme;
@property (strong, nonatomic) IBOutlet UIButton *btn_Inopinee;

@property (strong, nonatomic) IBOutlet UITextField *txt_Date1;
@property (strong, nonatomic) IBOutlet UITextField *txt_N;

@property (strong, nonatomic) IBOutlet UITextField *txt_audit;
@property (strong, nonatomic) IBOutlet UITextField *txt_Site;
@property (strong, nonatomic) IBOutlet UITextField *txt_Activite;
@property (strong, nonatomic) IBOutlet UITextField *txt_Travaux;
@property (strong, nonatomic) IBOutlet UITextField *txt_Participant;
@property (strong, nonatomic) IBOutlet UITextField *txt_Presentes;
@property (strong, nonatomic) IBOutlet UITextField *txt_Auditee;

@property (strong, nonatomic) IBOutlet UITextView *txt_Observation1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Observation2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Observation3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Observation4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Observation5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Observation6;

@property (strong, nonatomic) IBOutlet UITextView *txt_Type1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Type2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Type3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Type4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Type5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Type6;

@property (strong, nonatomic) IBOutlet UITextView *txt_Response1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Response2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Response3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Response4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Response5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Response6;

@property (strong, nonatomic) IBOutlet UITextView *txt_Action1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Action6;

@property (strong, nonatomic) IBOutlet UITextView *txt_Immediate1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Immediate2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Immediate3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Immediate4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Immediate5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Immediate6;

@property (strong, nonatomic) IBOutlet UITextView *txt_Acteur1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Acteur2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Acteur3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Acteur4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Acteur5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Acteur6;

@property (strong, nonatomic) IBOutlet UITextView *txt_Delai1;
@property (strong, nonatomic) IBOutlet UITextView *txt_Delai2;
@property (strong, nonatomic) IBOutlet UITextView *txt_Delai3;
@property (strong, nonatomic) IBOutlet UITextView *txt_Delai4;
@property (strong, nonatomic) IBOutlet UITextView *txt_Delai5;
@property (strong, nonatomic) IBOutlet UITextView *txt_Delai6;

@property (strong, nonatomic) IBOutlet UITextView *txt_Audite;
@property (strong, nonatomic) IBOutlet UITextView *txt_Auditeur;

@property (strong, nonatomic) IBOutlet UITextField *txt_Date2;

@property (strong, nonatomic) IBOutlet UIButton *btn_AddPhotos;
//@property (strong, nonatomic) IBOutlet UIView *view_Photo1;
@property (strong, nonatomic) IBOutlet UIView *view_Photo2;
@property (strong, nonatomic) IBOutlet UIView *view_Photo3;
@property (strong, nonatomic) IBOutlet UIView *view_Photo4;
@property (weak, nonatomic) IBOutlet UIImageView *Photo1;
@property (weak, nonatomic) IBOutlet UIImageView *Photo2;
@property (weak, nonatomic) IBOutlet UIImageView *Photo4;

@property (weak, nonatomic) IBOutlet UIImageView *Photo3;


@property(nonatomic,strong)UIImageView *view_Photo1,*view_Photo12 ,*view_Photo13,*view_Photo14;

@property (strong, nonatomic) IBOutlet UIImageView *img_Signature;

@property(nonatomic, retain)IBOutlet UIBarButtonItem *bbbbb;

@property BOOL IsForUpdating;
@property (nonatomic, strong) NSMutableArray *retrievedarray;

@end
