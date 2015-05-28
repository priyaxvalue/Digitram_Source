//
//  Intervention.m
//  Digitram
//
//  Created by Balladonia iTechnologies on 02/04/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import "Intervention.h"
#import "DBSqlite.h"
#import "ScrollViewToPDF.h"

@interface Intervention ()

@end

@implementation Intervention

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [ self fun_SetProperties] ;
}

- ( void)fun_SetProperties
{
    [self.scrl_view setContentSize:CGSizeMake(768, 2500)] ;
    str_DocumentName = @"Procès Verbal d’Intervention" ;
    self.title = str_DocumentName ;
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(fun_saveToDataBase:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(fun_saveToDataBase:)] ;
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}
-(void)fun_saveToDataBase : ( UIBarButtonItem *) currentBarButton
{
    if (bool_SavedTofile == false)
    {
        [ self openPerPagePDF] ;
        NSString * str_GetCount = @"SELECT pv_intervention_id FROM pv_intervention" ;
        
        int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
        
        NSLog(@"Current Count : %d", CurrentCount) ;
        NSString *strQuery = [NSString stringWithFormat:@"insert into pv_intervention(pv_intervention_id,doc_name,n_de_dossier,n_de_concrat,client_passeur_dordre,passeur_dordre_adresse,client_final,client_final_adresse,nature_concrat_maintenance ,nature_maintenance,nature_depannage_hors,nature_depannage_sous,mise_en_service,nature_renovation,nature_autres ,numero_semaine,date_de_intervention,nbre_intervenants ,heures_8ha18h_lundi,heures_8ha18h_mardi,heures_8ha18h_mercredi,heures_8ha18h_jeudi,heures_8ha18h_vendredi,heures_8ha18h_samedi,heures_8ha18h_dimanchi,heures_8ha18h_puheure,heures_8ha18h_total_en_e,heures_18ha22h_et_6ha8h_lundi,heures_18ha22h_et_6ha8h_mardi,heures_18ha22h_et_6ha8h_mercredi,heures_18ha22h_et_6ha8h_jeudi,heures_18ha22h_et_6ha8h_vendredi,heures_18ha22h_et_6ha8h_samedi,heures_18ha22h_et_6ha8h_dimanchi,heures_18ha22h_et_6ha8h_puheure,heures_18ha22h_et_6ha8h_total_en_e,heures_de_nuit_lundi,heures_de_nuit_mardi,heures_de_nuit_mercredi,heures_de_nuit_jeudi,heures_de_nuit_vendredi,heures_de_nuit_samedi,heures_de_nuit_dimanchi,heures_de_nuit_puheure,heures_de_nuit_total_en_e,nbre_1,designation_des_pieces_1,nbre_2,designation_des_pieces_2,nbre_3,designation_des_pieces_3,nbre_4,designation_des_pieces_4,nbre_5,designation_des_pieces_5,nbre_6,designation_des_pieces_6,detail_de_intervention_et_travaux,deroulement_de_attente,deroulement_de_temps_attente,regles_de_securite,temps_de_consignation,Appareillge_caracteristique,Appareillge_cablages,Appareillge_autre,traitement_ala_charge_schneider,traitement_ala_charge_entreprise,travaux_prevoir_obser_particuliers,enheance,observ_client,chef_de_mission_nom,chef_de_mission_signature,interlocuteur_nom,interlocuteur_enterprise,interlocuteur_tel ,interlocuteur_fax,interlocuteur_signature,doc_created_date datetime,doc_modified_date datetime) values (\"%d\",\"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%d\", \"%@\",\"%d\", \"%d\", \"%d\",\"%d\", \"%d\", \"%d\",\"%d\", \"%d\", \"%d\",\"%d\", \"%d\", \"%d\",\"%d\", \"%d\", \"%d\",\"%d\", \"%d\",\"%d\",\"%d\",\"%d\",\"%d\",\"%d\",\"%d\",\"%d\",\"%d\",\"%d\",\"%d\",\"%d\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%d\",\"%d\",\"%@\",\"%@\",\"%@\")",++CurrentCount,str_DocumentName,str_CreatedDate,str_CreatedDate];
        
        //[[ DBSqlite dbManager] insertStatement:strQuery] ;
        
    }
    
    if (currentBarButton == pdfButton)
    {
        [ self showEmail] ;
    }
}

#pragma mark - PDF Creation
- (void)openPerPagePDF

{
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:self.scrl_view];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    NSLog(@"Now : %@", now) ;
    //[format setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    [ format setDateFormat:@"dd-MM-YYYY_hhmmss"] ;
    NSString * datestring = [format stringFromDate:now];
    
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    
    //   Formname_DDMMYYYYhhmmss
    str_DocumentName = [NSString stringWithFormat:@"Procès Verbal d’Intervention_%@.pdf", datestring]  ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
    [pdfData writeToFile:path atomically:NO];
    NSLog(@"tmpDirectory: %@",path);
    bool_SavedTofile = true ;
    //[self openPath:path];
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
    
    NSString *emailTitle  =  @"Causerie mail";
    
    // Email Content
    
    NSString *messageBody  =  @"<h3>Causerie Document</h3>";
    
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

- (void)didReceiveMemoryWarning {
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
