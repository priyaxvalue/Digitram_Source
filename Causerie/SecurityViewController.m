//
//  SecurityViewController.m
//  Causerie
//
//  Created by Balladonia iTechnologies on 09/03/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#define TAG_DEV 1


#import "SecurityViewController.h"
#import "DBSqlite.h"
#import "ScrollViewToPDF.h"
#import "SignaVC.h"


@interface SecurityViewController () <MFMailComposeViewControllerDelegate, SignaVCDelegate>
{
    NSString *path;
}
@end

@implementation SecurityViewController

@synthesize txt_Date1,txt_N,txt_audit,txt_Site,txt_Activite,txt_Travaux,txt_Participant,txt_Presentes,txt_Auditee,btn_Programme,btn_Inopinee,txt_Observation1,txt_Observation2,txt_Observation3,txt_Observation4,txt_Observation5,txt_Observation6,txt_Type1,txt_Type2,txt_Type3,txt_Type4,txt_Type5,txt_Type6,txt_Response1,txt_Response2,txt_Response3,txt_Response4,txt_Response5,txt_Response6,txt_Action1,txt_Action2,txt_Action3,txt_Action4,txt_Action5,txt_Action6,txt_Immediate1,txt_Immediate2,txt_Immediate3,txt_Immediate4,txt_Immediate5,txt_Immediate6,txt_Acteur1,txt_Acteur2,txt_Acteur3,txt_Acteur4,txt_Acteur5,txt_Acteur6,txt_Delai1,txt_Delai2,txt_Delai3,txt_Delai4,txt_Delai5,txt_Delai6,txt_Audite,txt_Auditeur,txt_Date2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [ self fun_SetProperties] ;
    // [ self fun_CreateUI] ;
    
    saved_Into_DB=NO;
    
    
    if (self.IsForUpdating==YES)
        
    {
        txt_Date1.text=(self.retrievedarray)[0] [@"visite_date"];
        txt_N.text=(self.retrievedarray)[0] [@"visit_no"];
        txt_audit.text=(self.retrievedarray)[0] [@"audit"];
        txt_Site.text=(self.retrievedarray)[0] [@"site"];
        txt_Participant.text=(self.retrievedarray)[0] [@"participant"];
        txt_Presentes.text=(self.retrievedarray)[0] [@"presentes"];
        txt_Auditee.text=(self.retrievedarray)[0] [@"personne_auditee"];
        txt_Travaux.text=(self.retrievedarray)[0] [@"type_de_travaux"];
        txt_Activite.text=(self.retrievedarray)[0] [@"activite"];
        
        NSString *strb1=(self.retrievedarray)[0] [@"programme"];
        NSString *strb2=@"Yes";
        if([strb1 isEqualToString:strb2])
        {
            [self.btn_Programme setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        
        NSString *strb11=(self.retrievedarray)[0] [@"visit_inopinee"];
        NSString *strb12=@"Yes";
        if([strb11 isEqualToString:strb12])
        {
            [self.btn_Inopinee setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        }
        
        txt_Observation1.text=(self.retrievedarray)[0] [@"observation1"];
        txt_Observation2.text=(self.retrievedarray)[0] [@"observation2"];
        txt_Observation3.text=(self.retrievedarray)[0] [@"observation3"];
        txt_Observation4.text=(self.retrievedarray)[0] [@"observation4"];
        txt_Observation5.text=(self.retrievedarray)[0] [@"observation5"];
        txt_Observation6.text=(self.retrievedarray)[0] [@"observation6"];
        
        txt_Type1.text=(self.retrievedarray)[0] [@"type1"];
        txt_Type2.text=(self.retrievedarray)[0] [@"type2"];
        txt_Type3.text=(self.retrievedarray)[0] [@"type3"];
        txt_Type4.text=(self.retrievedarray)[0] [@"type4"];
        txt_Type5.text=(self.retrievedarray)[0] [@"type5"];
        txt_Type6.text=(self.retrievedarray)[0] [@"type6"];
        
        txt_Response1.text=(self.retrievedarray)[0] [@"dialogue1"];
        txt_Response2.text=(self.retrievedarray)[0] [@"dialogue2"];
        txt_Response3.text=(self.retrievedarray)[0] [@"dialogue3"];
        txt_Response4.text=(self.retrievedarray)[0] [@"dialogue4"];
        txt_Response5.text=(self.retrievedarray)[0] [@"dialogue5"];
        txt_Response6.text=(self.retrievedarray)[0] [@"dialogue6"];
        
        txt_Action1.text=(self.retrievedarray)[0] [@"action_prise1"];
        txt_Action2.text=(self.retrievedarray)[0] [@"action_prise2"];
        txt_Action3.text=(self.retrievedarray)[0] [@"action_prise3"];
        txt_Action4.text=(self.retrievedarray)[0] [@"action_prise4"];
        txt_Action5.text=(self.retrievedarray)[0] [@"action_prise5"];
        txt_Action6.text=(self.retrievedarray)[0] [@"action_prise6"];
        
        txt_Immediate1.text=(self.retrievedarray)[0] [@"immediate1"];
        txt_Immediate2.text=(self.retrievedarray)[0] [@"immediate2"];
        txt_Immediate3.text=(self.retrievedarray)[0] [@"immediate3"];
        txt_Immediate4.text=(self.retrievedarray)[0] [@"immediate4"];
        txt_Immediate5.text=(self.retrievedarray)[0] [@"immediate5"];
        txt_Immediate6.text=(self.retrievedarray)[0] [@"immediate6"];
        
        txt_Acteur1.text=(self.retrievedarray)[0] [@"differee_acteur1"];
        txt_Acteur2.text=(self.retrievedarray)[0] [@"differee_acteur2"];
        txt_Acteur3.text=(self.retrievedarray)[0] [@"differee_acteur3"];
        txt_Acteur4.text=(self.retrievedarray)[0] [@"differee_acteur4"];
        txt_Acteur5.text=(self.retrievedarray)[0] [@"differee_acteur5"];
        txt_Acteur6.text=(self.retrievedarray)[0] [@"differee_acteur6"];
        
        txt_Delai1.text=(self.retrievedarray)[0] [@"differee_delai1"];
        txt_Delai2.text=(self.retrievedarray)[0] [@"differee_delai2"];
        txt_Delai3.text=(self.retrievedarray)[0] [@"differee_delai3"];
        txt_Delai4.text=(self.retrievedarray)[0] [@"differee_delai4"];
        txt_Delai5.text=(self.retrievedarray)[0] [@"differee_delai5"];
        txt_Delai6.text=(self.retrievedarray)[0] [@"differee_delai6"];
        
        txt_Audite.text=(self.retrievedarray)[0] [@"comment_audite"];
        txt_Auditeur.text=(self.retrievedarray)[0] [@"comment_auditeur"];
        txt_Date2.text=(self.retrievedarray)[0] [@"date"];
        
        
        NSString *datas11=(self.retrievedarray)[0][@"signature_auditeur"];
        // NSData *data11=[[NSData alloc]initWithBase64EncodedData:datas11 options:NSDataBase64DecodingIgnoreUnknownCharacters ];
        NSData *data11=[[NSData alloc]initWithBase64EncodedString:datas11 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image11=[[UIImage alloc]init];
        image11=[UIImage imageWithData:data11];
        [self.img_Signature setImage:image11];
        
        NSString *str_PhotosEncodedList=(self.retrievedarray)[0][@"photos_sur_situations"];
        NSLog(@"Encoded Photos List : %@", str_PhotosEncodedList) ;
        NSArray * array_RetrievedStr = [ str_PhotosEncodedList componentsSeparatedByString:@","] ;
        
        for (NSString * photoStr in array_RetrievedStr)
        {
            if (photoStr.length>0) {
                UIImage * currentImage = [ self decodeBase64ToImage:photoStr] ;
                
                [array_photos addObject:currentImage] ;
                [array_PhotoView[array_photos.count-1] setBackgroundColor:[ UIColor colorWithPatternImage:currentImage]] ;
            }
        }
        NSLog(@"array _ Photos : %@", array_photos) ;
    }
    
}

- ( void) fun_SetProperties
{
    [self.scrl_View setContentSize:CGSizeMake(768, 2500)] ;
    str_DocumentName = @"QE7170TR VAS Visite d'Amélioration Sécurité" ;
    self.title = str_DocumentName ;
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    
    //    self.view_Photo1.tag = 0 ;
    //    self.view_Photo2.tag = 1;
    //    self.view_Photo3.tag = 2 ;
    //    self.view_Photo4.tag = 3 ;
    //    self.view_Photo1.backgroundColor = [ UIColor clearColor] ;
    //    self.view_Photo2.backgroundColor = [ UIColor clearColor] ;
    //    self.view_Photo3.backgroundColor = [ UIColor clearColor] ;
    //    self.view_Photo4.backgroundColor = [ UIColor clearColor] ;
    
    self.Photo1.tag=0;
    self.Photo2.tag=1;
    self.Photo3.tag=2;
    self.Photo4.tag=3;
    
    self.Photo1.backgroundColor=[UIColor clearColor];
    self.Photo2.backgroundColor=[UIColor clearColor];
    self.Photo3.backgroundColor=[UIColor clearColor];
    self.Photo4.backgroundColor=[UIColor clearColor];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    array_photos = [[ NSMutableArray alloc] init] ;
    //    array_PhotoView = [[ NSArray alloc] initWithObjects:self.view_Photo1,self.view_Photo2,self.view_Photo3,self.view_Photo4, nil] ;
    array_PhotoView = [[ NSArray alloc] initWithObjects:self.Photo1,self.Photo2,self.Photo3,self.Photo4, nil] ;
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(fun_saveToDataBase:)] ;
    
    
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,saveButton, nil];
    self.navigationItem.rightBarButtonItems = arry ;
    
    self.txt_Date1.delegate = self ;
    self.txt_Date2.delegate = self ;
    
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;
    
    
    
    self.btn_QETR.backgroundColor = [ UIColor lightGrayColor] ;
    self.btn_QETR.layer.borderWidth = 0.5f ;
    //self.btn_QETR.backgroundColor = [ UIColor whiteColor] ;
    //[self.btn_QETR setTitleColor:[ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1 ] forState:UIControlStateNormal] ;
    [self.btn_QETR addTarget:self action:@selector(fun_OnButtonTouch:) forControlEvents:UIControlEventTouchUpInside] ;
    self.btn_QETR.backgroundColor = [ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1 ] ;
    [self.btn_QETR setTitleColor:[ UIColor whiteColor] forState:UIControlStateNormal] ;
    
    
    self.btn_Aide.backgroundColor = [ UIColor lightGrayColor] ;
    self.btn_Aide.layer.borderWidth = 0.5f ;
    self.btn_Aide.layer.borderColor = [ UIColor blackColor].CGColor ;
    self.btn_Aide.backgroundColor = [ UIColor whiteColor] ;
    [self.btn_Aide setTitleColor:[ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1 ] forState:UIControlStateNormal] ;
    [self.btn_Aide addTarget:self action:@selector(fun_OnButtonTouch:) forControlEvents:UIControlEventTouchUpInside] ;
    
    
    self.image_Aide = [[ UIImageView alloc] initWithFrame:CGRectMake(self.view_QETRContainer.frame.origin.x+50, self.view_QETRContainer.frame.origin.y+100, self.self.view.frame.size.width - 100, 500)] ;
    [self.image_Aide setImage:[ UIImage imageNamed:@"Aide.png"]];
    self.image_Aide.hidden = YES ;
    [ self.view addSubview:self.image_Aide] ;
    
    
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(activateDeletionMode:)];
    longPress.delegate = self;
    //    [self.view_Photo1 addGestureRecognizer:longPress];
    [self.Photo1 addGestureRecognizer:longPress];
    
    UILongPressGestureRecognizer *longPress1 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(activateDeletionMode:)];
    longPress1.delegate = self;
    //    [self.view_Photo2 addGestureRecognizer:longPress1];
    [self.Photo2 addGestureRecognizer:longPress1];
    
    UILongPressGestureRecognizer *longPress2 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(activateDeletionMode:)];
    longPress2.delegate = self;
    //    [self.view_Photo3 addGestureRecognizer:longPress2];
    [self.Photo3 addGestureRecognizer:longPress2];
    
    UILongPressGestureRecognizer *longPress3 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(activateDeletionMode:)];
    longPress3.delegate = self;
    //    [self.view_Photo4 addGestureRecognizer:longPress3];
    [self.Photo4 addGestureRecognizer:longPress3];
    
    
    [self.btn_Programme addTarget:self action:@selector(fun_Img_Tapped:) forControlEvents:UIControlEventTouchUpInside] ;
    [ self.btn_Inopinee addTarget:self action:@selector(fun_Img_Tapped:) forControlEvents:UIControlEventTouchUpInside] ;
    [self.btn_Programme setTitle:nil forState:UIControlStateNormal] ;
    [ self.btn_Inopinee setTitle:nil forState:UIControlStateNormal] ;
    [ self.btn_AddPhotos addTarget:self action:@selector(fun_AddPhotos) forControlEvents:UIControlEventTouchUpInside] ;
    btn_delete = [ UIButton buttonWithType:UIButtonTypeCustom] ;
    [btn_delete setBackgroundImage:[ UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal] ;
    [ btn_delete addTarget:self action:@selector(fun_OnDelete) forControlEvents:UIControlEventTouchUpInside] ;
    
    
    [self.btn_Edit addTarget:self action:@selector(fun_OnEditSignature) forControlEvents:UIControlEventTouchUpInside] ;
    
}


- ( void) fun_OnEditSignature
{
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
    
    svc.delegate=self;
    
    [self.navigationController pushViewController:svc animated:NO];
    
}

#pragma mark Signature delegate

-(void)sendImgData:(UIImage *)image;
{
    UIImageView *imageView;
    NSLog(@"Image : %@", image) ;
    imageView = self.img_Signature ;
    imageView.image=image;
}

- ( void) activateDeletionMode : ( id) sender
{
    btn_delete.hidden = YES ;
    UILongPressGestureRecognizer* gesture=(UILongPressGestureRecognizer*)sender;
    NSLog(@"Sender view : %@", gesture) ;
    currentIndex = (int)gesture.view.tag ;
    if (gesture.view.backgroundColor != [ UIColor clearColor])
    {
        NSLog(@"Frame :: %@", NSStringFromCGRect(gesture.view.frame)) ;
        btn_delete.hidden = NO ;
        btn_delete.frame = CGRectMake(gesture.view.frame.size.width - 17, 0, 15, 15) ;
        [ gesture.view addSubview:btn_delete] ;
        
    }
}

- ( void) fun_OnDelete
{
    NSLog(@"Fun_dle") ;
    UIAlertView * alert = [[ UIAlertView alloc] initWithTitle:@"Photos" message:@"Do you want to delete the Photo?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [ alert show] ;
}
- ( void) fun_AddPhotos
{
    if (array_photos.count <=3)
    {
        [ self fun_AddPictureFromGallery] ;
    }
}

- ( void) fun_AddPictureFromGallery
{
    ////NSLog(@"Button Clicked") ;
    self.controller =
    [[UIImagePickerController alloc] init];
    
    self.controller.delegate = self;
    
    self.controller.sourceType =
    UIImagePickerControllerSourceTypePhotoLibrary;
    self.controller.mediaTypes = @[(NSString *) kUTTypeImage] ;
    self.controller.allowsEditing = YES;
    [self presentViewController:self.controller
                       animated:YES completion:nil];
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    selectedImage = info[UIImagePickerControllerEditedImage] ;
    
    NSString * mediaType = info[UIImagePickerControllerMediaType] ;
    if ([mediaType isEqualToString:(NSString *) kUTTypeImage])
    {
        ////NSLog(@"Media is an image") ;
    }
    else if([mediaType isEqualToString: (NSString *) kUTTypeMovie])
    {
        ////NSLog(@"media is a video") ;
    }
    
    
    [ self dismissViewControllerAnimated:YES completion:nil] ;
    
    
    //self.bool_ViewMoved = false ;
    
    
    CGSize size=CGSizeMake(100, 100);
    selectedImage=[self scaleImage:selectedImage toSize:size];
    [array_photos addObject:selectedImage];
    [array_PhotoView[array_photos.count-1] setBackgroundColor:[ UIColor colorWithPatternImage:selectedImage]] ;
}
//to resize image to specified size
-(UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- ( void) fun_Img_Tapped : ( UIButton *) currentButton
{
    (currentButton.currentBackgroundImage != nil) ? [ currentButton setBackgroundImage:nil forState:UIControlStateNormal] : [ currentButton setBackgroundImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal] ;
}
- ( void) fun_OnButtonTouch : ( UIButton *) currentButton
{
    
    if (currentButton == self.btn_QETR)
    {
        self.view_QETRContainer.hidden = NO ;
        self.image_Aide.hidden = YES ;
        saveButton.enabled = YES ;
        pdfButton.enabled = YES ;
        self.btn_QETR.backgroundColor = [ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1 ] ;
        [self.btn_QETR setTitleColor:[ UIColor whiteColor] forState:UIControlStateNormal] ;
        self.btn_Aide.backgroundColor = [ UIColor whiteColor] ;
        [self.btn_Aide setTitleColor:[ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1 ] forState:UIControlStateNormal] ;
        self.scrl_View.scrollEnabled = YES ;
    }
    else if (currentButton == self.btn_Aide)
    {
        self.view_QETRContainer.hidden = YES ;
        self.image_Aide.hidden = NO ;
        saveButton.enabled = NO ;
        pdfButton.enabled = NO ;
        self.btn_Aide.backgroundColor = [ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1 ] ;
        [self.btn_Aide setTitleColor:[ UIColor whiteColor] forState:UIControlStateNormal] ;
        self.btn_QETR.backgroundColor = [ UIColor whiteColor] ;
        [self.btn_QETR setTitleColor:[ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1 ] forState:UIControlStateNormal] ;
        self.scrl_View.scrollEnabled = NO;
        
    }
}

-(void)confirm :(UIBarButtonItem *)currentBarButton
{
    self.bbbbb=currentBarButton;
    
    alertView1 = [[UIAlertView alloc] initWithTitle:@"Confirmer"
                                            message:@"Voulez-vous sauver?" delegate:self
                                  cancelButtonTitle:@"OUI" otherButtonTitles:@"NON", nil];
    alertView1.tag=TAG_DEV;
    
    [alertView1 show];
    
}


- ( void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==TAG_DEV)
    {
        if (buttonIndex==0)
        {
            [self fun_saveToDataBase :self.bbbbb];
        }
        else
        {
            [alertView removeFromSuperview];
        }
    }
    else
    {
        if (buttonIndex == 1)
        {
            NSLog(@"Entered") ;
            [array_photos removeObjectAtIndex:currentIndex] ;
            for (UIView * view in array_PhotoView)
            {
                [view setBackgroundColor:[ UIColor clearColor]];
            }
            int i = 0 ;
            for (UIImage * photo in array_photos)
            {
                NSLog(@"Photo :: %@", photo) ;
                UIView * currentView = array_PhotoView[i] ;
                currentView.backgroundColor = [ UIColor colorWithPatternImage:photo] ;
                i++ ;
            }
            btn_delete.hidden = YES ;
        }
        else
        {
            btn_delete.hidden = YES ;
        }
    }
}

-(void)fun_saveToDataBase : ( UIBarButtonItem *) currentBarButton
{
    int  nnn;
    NSDateFormatter *forma=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [ forma setDateFormat:@"dd-MM-YYYY"] ;
    NSString *datestring12 = [forma stringFromDate:now];
    if (self.IsForUpdating==YES )
    {
        if (self.retrievedarray!=nil)
        {
            NSLog(@"retrive:%@",self.retrievedarray);
            NSLog(@"retrive:%@",(self.retrievedarray)[0][@"visite_id"]);
            NSString *str=(self.retrievedarray)[0][@"visite_id"];
            nnn=[str intValue];
        }
        else
        {
            NSString * str_GetCount = @"SELECT visite_id FROM visite_securite" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            nnn =  CurrentCount;
        }
        NSString * str_ProgrammeImg = (self.btn_Programme.currentBackgroundImage == nil) ? @"No" : @"Yes"  ;
        NSString * str_Inopinee = (self.btn_Inopinee.currentBackgroundImage == nil) ? @"No" : @"Yes"  ;
        NSString * str_Signature = [ self encodeToBase64String:self.img_Signature.image] ;
        NSMutableArray * array_EncodedImages = [[ NSMutableArray alloc] init] ;
        for (UIImage * image in array_photos)
        {
            NSString * str_EncodedString = [ self encodeToBase64String:image] ;
            [array_EncodedImages addObject:str_EncodedString] ;
        }
        NSString * str_JoinedPhotos = [array_EncodedImages componentsJoinedByString:@","];
        [ self openPerPagePDF] ;
        str_DocumentName = [str_DocumentName stringByReplacingOccurrencesOfString:@"'"
                                                                       withString:@"''"];
        NSString *updateSQL = [NSString stringWithFormat:
                               @"update visite_securite set doc_name='%@',visite_date='%@',programme='%@',visit_inopinee='%@',visit_no='%@',audit='%@',participant='%@',site='%@',presentes='%@',activite='%@',personne_auditee='%@',type_de_travaux='%@',observation1='%@',observation2='%@',observation3='%@',observation4='%@',observation5='%@',observation6='%@',type1='%@',type2='%@',type3='%@',type4='%@',type5='%@',type6='%@',dialogue1='%@',dialogue2='%@',dialogue3='%@',dialogue4='%@',dialogue5='%@',dialogue6='%@',action_prise1='%@',action_prise2='%@',action_prise3='%@',action_prise4='%@',action_prise5='%@',action_prise6='%@',immediate1='%@',immediate2='%@',immediate3='%@',immediate4='%@',immediate5='%@',immediate6='%@',differee_acteur1='%@',differee_acteur2='%@',differee_acteur3='%@',differee_acteur4='%@',differee_acteur5='%@',differee_acteur6='%@',differee_delai1='%@',differee_delai2='%@',differee_delai3='%@',differee_delai4='%@',differee_delai5='%@',differee_delai6='%@',comment_audite='%@',comment_auditeur='%@',signature_auditeur='%@',date='%@',photos_sur_situations='%@',doc_modified_date='%@' where visite_id='%ld'", str_DocumentName,self.txt_Date1.text,str_ProgrammeImg,str_Inopinee,self.txt_N.text,self.txt_audit.text,self.txt_Participant.text,self.txt_Site.text,self.txt_Presentes.text,self.txt_Activite.text,self.txt_Auditee.text,self.txt_Travaux.text,self.txt_Observation1.text,self.txt_Observation2.text,self.txt_Observation3.text,self.txt_Observation4.text,self.txt_Observation5.text,self.txt_Observation6.text,self.txt_Type1.text,self.txt_Type2.text,self.txt_Type3.text,self.txt_Type4.text,self.txt_Type5.text,self.txt_Type6.text,self.txt_Response1.text,self.txt_Response2.text,self.txt_Response3.text,self.txt_Response4.text,self.txt_Response5.text,self.txt_Response6.text,self.txt_Action1.text,self.txt_Action2.text,self.txt_Action3.text,self.txt_Action4.text,self.txt_Action5.text,self.txt_Action6.text,self.txt_Immediate1.text,self.txt_Immediate2.text,self.txt_Immediate3.text,self.txt_Immediate4.text,self.txt_Immediate5.text,self.txt_Immediate6.text,self.txt_Acteur1.text,self.txt_Acteur2.text,self.txt_Acteur3.text,self.txt_Acteur4.text,self.txt_Acteur5.text,self.txt_Acteur6.text,self.txt_Delai1.text,self.txt_Delai2.text,self.txt_Delai3.text,self.txt_Delai4.text,self.txt_Delai5.text,self.txt_Delai6.text,self.txt_Audite.text,self.txt_Auditeur.text,str_Signature,self.txt_Date2.text,str_JoinedPhotos,datestring12,(long)nnn];
        [[ DBSqlite dbManager] updateStatement:updateSQL];
    }
    else
    {
        NSString * str_ProgrammeImg = (self.btn_Programme.currentBackgroundImage == nil) ? @"No" : @"Yes";
        NSString * str_Inopinee = (self.btn_Inopinee.currentBackgroundImage == nil) ? @"No" : @"Yes";
        NSString * str_Signature = [ self encodeToBase64String:self.img_Signature.image];
        NSMutableArray * array_EncodedImages = [[ NSMutableArray alloc] init] ;
        for (UIImage * image in array_photos)
        {
            NSString * str_EncodedString = [ self encodeToBase64String:image] ;
            [array_EncodedImages addObject:str_EncodedString] ;
        }
        NSString * str_JoinedPhotos = [ array_EncodedImages componentsJoinedByString:@","];
        if(saved_Into_DB==NO)
        {
            [self openPerPagePDF] ;
            NSString * str_GetCount = @"SELECT visite_id FROM visite_securite" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSLog(@"Current Count : %d", CurrentCount);
            NSString *strQuery = [NSString stringWithFormat:@"insert into visite_securite(doc_name,visite_id,visite_date,programme,visit_inopinee,visit_no,audit,participant,site,presentes,activite,personne_auditee,type_de_travaux,observation1,observation2,observation3,observation4,observation5,observation6,type1,type2,type3,type4,type5,type6,dialogue1,dialogue2,dialogue3,dialogue4,dialogue5,dialogue6,action_prise1,action_prise2,action_prise3,action_prise4,action_prise5,action_prise6,immediate1,immediate2,immediate3,immediate4,immediate5,immediate6,differee_acteur1,differee_acteur2,differee_acteur3,differee_acteur4,differee_acteur5,differee_acteur6,differee_delai1,differee_delai2,differee_delai3,differee_delai4,differee_delai5,differee_delai6,comment_audite,comment_auditeur,signature_auditeur,date,photos_sur_situations,doc_created_date,doc_modified_date) values (\"%@\",\"%d\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",str_DocumentName,++CurrentCount,self.txt_Date1.text,str_ProgrammeImg,str_Inopinee,self.txt_N.text,self.txt_audit.text,self.txt_Participant.text,self.txt_Site.text,self.txt_Presentes.text,self.txt_Activite.text,self.txt_Auditee.text,self.txt_Travaux.text,self.txt_Observation1.text,self.txt_Observation2.text,self.txt_Observation3.text,self.txt_Observation4.text,self.txt_Observation5.text,self.txt_Observation6.text,self.txt_Type1.text,self.txt_Type2.text,self.txt_Type3.text,self.txt_Type4.text,self.txt_Type5.text,self.txt_Type6.text,self.txt_Response1.text,self.txt_Response2.text,self.txt_Response3.text,self.txt_Response4.text,self.txt_Response5.text,self.txt_Response6.text,self.txt_Action1.text,self.txt_Action2.text,self.txt_Action3.text,self.txt_Action4.text,self.txt_Action5.text,self.txt_Action6.text,self.txt_Immediate1.text,self.txt_Immediate2.text,self.txt_Immediate3.text,self.txt_Immediate4.text,self.txt_Immediate5.text,self.txt_Immediate6.text,self.txt_Acteur1.text,self.txt_Acteur2.text,self.txt_Acteur3.text,self.txt_Acteur4.text,self.txt_Acteur5.text,self.txt_Acteur6.text,self.txt_Delai1.text,self.txt_Delai2.text,self.txt_Delai3.text,self.txt_Delai4.text,self.txt_Delai5.text,self.txt_Delai6.text,self.txt_Audite.text,self.txt_Auditeur.text,str_Signature,self.txt_Date2.text,str_JoinedPhotos,str_CreatedDate,str_CreatedDate];
            [[DBSqlite dbManager] insertStatement:strQuery];
            self.IsForUpdating=YES;
            saved_Into_DB=YES;
        }
        if(saved_Into_DB==YES)
        {
            NSString * str_GetCount = @"SELECT visite_id FROM visite_securite" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount];
            NSString *updateSQL = [NSString stringWithFormat:
                                   @"update visite_securite set doc_name='%@',visite_date='%@',programme='%@',visit_inopinee='%@',visit_no='%@',audit='%@',participant='%@',site='%@',presentes='%@',activite='%@',personne_auditee='%@',type_de_travaux='%@',observation1='%@',observation2='%@',observation3='%@',observation4='%@',observation5='%@',observation6='%@',type1='%@',type2='%@',type3='%@',type4='%@',type5='%@',type6='%@',dialogue1='%@',dialogue2='%@',dialogue3='%@',dialogue4='%@',dialogue5='%@',dialogue6='%@',action_prise1='%@',action_prise2='%@',action_prise3='%@',action_prise4='%@',action_prise5='%@',action_prise6='%@',immediate1='%@',immediate2='%@',immediate3='%@',immediate4='%@',immediate5='%@',immediate6='%@',differee_acteur1='%@',differee_acteur2='%@',differee_acteur3='%@',differee_acteur4='%@',differee_acteur5='%@',differee_acteur6='%@',differee_delai1='%@',differee_delai2='%@',differee_delai3='%@',differee_delai4='%@',differee_delai5='%@',differee_delai6='%@',comment_audite='%@',comment_auditeur='%@',signature_auditeur='%@',date='%@',photos_sur_situations='%@',doc_modified_date='%@' where visite_id='%d'", str_DocumentName,self.txt_Date1.text,str_ProgrammeImg,str_Inopinee,self.txt_N.text,self.txt_audit.text,self.txt_Participant.text,self.txt_Site.text,self.txt_Presentes.text,self.txt_Activite.text,self.txt_Auditee.text,self.txt_Travaux.text,self.txt_Observation1.text,self.txt_Observation2.text,self.txt_Observation3.text,self.txt_Observation4.text,self.txt_Observation5.text,self.txt_Observation6.text,self.txt_Type1.text,self.txt_Type2.text,self.txt_Type3.text,self.txt_Type4.text,self.txt_Type5.text,self.txt_Type6.text,self.txt_Response1.text,self.txt_Response2.text,self.txt_Response3.text,self.txt_Response4.text,self.txt_Response5.text,self.txt_Response6.text,self.txt_Action1.text,self.txt_Action2.text,self.txt_Action3.text,self.txt_Action4.text,self.txt_Action5.text,self.txt_Action6.text,self.txt_Immediate1.text,self.txt_Immediate2.text,self.txt_Immediate3.text,self.txt_Immediate4.text,self.txt_Immediate5.text,self.txt_Immediate6.text,self.txt_Acteur1.text,self.txt_Acteur2.text,self.txt_Acteur3.text,self.txt_Acteur4.text,self.txt_Acteur5.text,self.txt_Acteur6.text,self.txt_Delai1.text,self.txt_Delai2.text,self.txt_Delai3.text,self.txt_Delai4.text,self.txt_Delai5.text,self.txt_Delai6.text,self.txt_Audite.text,self.txt_Auditeur.text,str_Signature,self.txt_Date2.text,str_JoinedPhotos,datestring12,CurrentCount];
            [[ DBSqlite dbManager] updateStatement:updateSQL];
        }
    }
    if (currentBarButton == pdfButton)
    {
        [ self showEmail] ;
    }
}

- (NSString *)encodeToBase64String:(UIImage *)image
{
    
    return [UIImageJPEGRepresentation(image, 1) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

#pragma mark - PDF Creation
- (void)openPerPagePDF

{
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:self.scrl_View];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    NSLog(@"Now : %@", now) ;
    //[format setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    [ format setDateFormat:@"dd-MM-YYYY_hhmmss"] ;
    NSString * datestring = [format stringFromDate:now];
    
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    
    //   Formname_DDMMYYYYhhmmss
    str_DocumentName = [NSString stringWithFormat:@"VAS Visite d'Amélioration Sécurité_%@.pdf", datestring]  ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
    [pdfData writeToFile:path atomically:NO];
    NSLog(@"tmpDirectory: %@",path);
    // bool_SavedTofile = true ;
    //[self openPath:path];
}

- (void)openPath:(NSString *)pathString {
    
    NSURL *path1 = [NSURL fileURLWithPath:pathString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:path1];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    webView.scalesPageToFit = YES;
    webView.delegate = self ;
    
    [webView loadRequest:urlRequest];
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view = webView;
    [self.navigationController pushViewController:viewController animated:YES];
    
    //UIBarButtonItem * sendButton = [[ UIBarButtonItem alloc] initWithTitle:@"Send Email" style:UIBarButtonItemStyleDone target:self action:@selector(showEmail:)];
    //viewController.navigationItem.rightBarButtonItem=sendButton;
    //    NSArray *arry1 = [[NSArray alloc]initWithObjects:sendButton, nil];
    //    viewController.navigationItem.rightBarButtonItems = arry1 ;
    
    //system([[NSString stringWithFormat:@"open '%@'", self.pdfPath] cStringUsingEncoding:NSUTF8StringEncoding]);
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.txt_Date1 || textField == self.txt_Date2)
    {
        [ self showDatePicker:textField] ;
        [ self.view endEditing:YES] ;
        date_CurrentTextfield = textField ;
    }
    return YES ;
}
//- (IBAction)openPerPagePDF:(id)sender {
//    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:self.scrl_View];
//    NSString *tmpDirectory = NSTemporaryDirectory();
//    NSString *path = [tmpDirectory stringByAppendingPathComponent:@"image.pdf"];
//    [pdfData writeToFile:path atomically:NO];
//    NSLog(@"tmpDirectory: %@",path);
//
//    [self openPath:path];
//}
//
//- (void)openPath:(NSString *)pathString {
//
//    NSURL *path = [NSURL fileURLWithPath:pathString];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:path];
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
//    webView.scalesPageToFit = YES;
//    [webView loadRequest:urlRequest];
//    UIViewController *viewController = [[UIViewController alloc] init];
//    viewController.view = webView;
//    [self.navigationController pushViewController:viewController animated:YES];
//
//    //system([[NSString stringWithFormat:@"open '%@'", self.pdfPath] cStringUsingEncoding:NSUTF8StringEncoding]);
//
//}

-(void)showDatePicker : ( UITextField *) currentTextfield
{
    NSLog(@"SHow date picker") ;
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [currentTextfield setInputView:datePicker];
}

-(void) dateTextField: (UIDatePicker *) sender
{
    NSLog(@"datetext field ") ;
    NSLog(@"sender : %@", sender) ;
    UIDatePicker *picker = (UIDatePicker*)sender.inputView;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    date_CurrentTextfield.text = [NSString stringWithFormat:@"%@",dateString];
}

-(void)showEmail

{
    Class mailClass  =  (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass !=  nil)
        
    {
        // We must always check whether the current device is configured for sending emails
        
        if ([mailClass canSendMail])
            
        {
            [self displayComposerSheet];
        }
        
        else
            
        {
            
            [self launchMailAppOnDevice];
        }
    }
    
    else
        
    {
        [self launchMailAppOnDevice];
    }
}

-(void)displayComposerSheet

{
    
    NSString *mailId;
    
    NSString *emailTitle  =  @"Digitram mail";
    
    // Email Content
    
    NSString *messageBody  =  @"<h3>Digitram Document</h3>";
    
    mailId = [[NSUserDefaults standardUserDefaults]valueForKey:@"mailIdEntered"];
    
    
    MFMailComposeViewController *mc  =  [[MFMailComposeViewController alloc] init];
    
    mc.mailComposeDelegate  =  self;
    
    [mc setSubject:emailTitle];
    
    [mc setMessageBody:messageBody isHTML:YES];
    
    
    NSArray *strArray = [ path componentsSeparatedByString:@"/"];
    NSLog(@"Str_Array : %@", strArray) ;
    NSString *fileName = [strArray lastObject];
    NSLog(@"Current File name : %@", fileName) ;
    
    NSArray *filepart  =  [path componentsSeparatedByString:@"."];
    
    NSString *extension  =  [filepart objectAtIndex:1];
    
    NSLog(@"Current path that is taken into account : %@", path) ;
    NSData *fileData =  [NSData dataWithContentsOfFile:path];
    
    
    NSString *mimeType;
    
    if ([extension isEqualToString:@"jpg"]) {
        
        mimeType  =  @"image/jpeg";
        
    } else if ([extension isEqualToString:@"png"]) {
        
        mimeType  =  @"image/png";
        
    } else if ([extension isEqualToString:@"doc"]) {
        
        mimeType  =  @"application/msword";
        
    } else if ([extension isEqualToString:@"ppt"]) {
        
        mimeType  =  @"application/vnd.ms-powerpoint";
        
    } else if ([extension isEqualToString:@"html"]) {
        
        mimeType  =  @"text/html";
        
    } else if ([extension isEqualToString:@"pdf"]) {
        NSLog(@"Oppa") ;
        mimeType  =  @"application/pdf";
    }
    [mc addAttachmentData:fileData mimeType:mimeType fileName:fileName];
    NSString * body = @"";
    [mc setMessageBody:body isHTML:NO];
    [self presentViewController:mc animated:YES completion:NULL];
}

-(void)launchMailAppOnDevice

{
    NSString *recipients  =  @"mailto:example@gmail.com?cc = &subject = Causerie Email\n\n";
    NSString *body  = [NSString stringWithFormat:@"&body = %@",@"type ur text"];
    NSString *email  =  [NSString stringWithFormat:@"%@%@", recipients, body];
    email  =  [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSLog(@"MailCompose Controller :::") ;
    switch (result)
    
    {
        case MFMailComposeResultCancelled:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Canceled"
                                                                message:@"Mail Canceled!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            
            break;
        }
        case MFMailComposeResultSaved:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Saved"
                                                                message:@"Mail Saved!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            
            break;
        }
        case MFMailComposeResultSent:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Sent"
                                                                message:@"Mail Sent!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            
            break;
        }
        case MFMailComposeResultFailed:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                message:@"Mail Failed!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            
            break;
        }
        default:
        {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Not Sent"
                                                                message:@"Mail Not sent!" delegate:self
                                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            
            break;
        }
            
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
