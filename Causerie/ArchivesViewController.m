//
//  ArchivesViewController.m
//  Causerie
//
//  Created by Balladonia iTechnologies on 16/03/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import "ArchivesViewController.h"
#import "DBSqlite.h"
#import "AccidentsVC.h"
#import "ConsignmentVC.h"
#import "RiskAnalysisViewController.h"
#import "PreventionPlanVC.h"
#import "CauzQSSE_ViewController.h"
#import "HazardViewController.h"
#import "AdequacyVC.h"
#import "SecurityViewController.h"
#import "BeginFormVC.h"
#import "ReceptionViewController.h"

@interface ArchivesViewController () < MFMailComposeViewControllerDelegate>

{
    MBProgressHUD *hud;
    NSIndexPath *deleteindexpath;
    
}


@end

@implementation ArchivesViewController

@synthesize retrarray;

-(void)viewWillAppear:(BOOL)animated
{
    [ self fun_RetrieveFromDB] ;

}
- (void)viewDidLoad
{
    NSLog(@"View did load JJJJJJJ ") ;
    [super viewDidLoad];
    [ self fun_SetProperties] ;

    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- ( void) fun_SetProperties
{
    // 0/149/48.
    self.title = @"Formulaires archivés" ;
    
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    [self.view setBackgroundColor:[ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1]] ;
    self.tbl_Archives = [[ UITableView alloc] initWithFrame:CGRectMake(62, 250, 639, 0) style:UITableViewStylePlain] ;
    self.tbl_Archives.dataSource=self;
    self.tbl_Archives.delegate=self;
    self.tbl_Archives.layer.cornerRadius = 5.f;
    self.tbl_Archives.layer.borderWidth = 0.8f;
    self.tbl_Archives.layer.masksToBounds = YES ;
    self.tbl_Archives.scrollEnabled = YES ;
    [ self.view addSubview:self.tbl_Archives] ;
    
    
}
- ( void) fun_RetrieveFromDB
{
    array_Tables = [[ NSArray alloc] initWithObjects:@"hazardous_record",@"consignment",@"qsse",@"prevention",@"attestation",@"accident_immediate",@"adequacy_conservation",@"risk_analysis",@"visite_securite",@"verbal_de_reception", nil] ;
    
    array_Ids = [[ NSArray alloc] initWithObjects:@"hazard_id",@"consignment_id",@"qsse_id",@"prevention_id",@"attestation_id",@"accident_id",@"adequacy_id",@"risk_id",@"visite_id",@"verbal_id", nil] ;
    array_FullDocNames = [[ NSMutableArray alloc]init] ;
    for (int i = 0 ; i < array_Tables.count; i++)
    {
        NSString * str = [ NSString stringWithFormat:@"select %@,doc_name from %@",array_Ids[i], array_Tables[i]] ;
        self.array_DocNames = [[ DBSqlite dbManager] selectStatement:str] ;
        [array_FullDocNames addObjectsFromArray:self.array_DocNames] ;
    }
    NSLog(@"array_FullDocNames :: %@", array_FullDocNames) ;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.tbl_Archives.frame = CGRectMake(self.tbl_Archives.frame.origin.x, self.tbl_Archives.frame.origin.y, self.tbl_Archives.frame.size.width, array_FullDocNames.count*50) ;
    
    return array_FullDocNames.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"CellIdentifier";
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.tintColor = [UIColor blackColor];
        
        UILabel * lbl_Date = [[ UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, cell.frame.size.height)] ;
        lbl_Date.text = @"" ;
        lbl_Date.tag = 1 ;
        lbl_Date.textColor = [ UIColor blackColor] ;
        lbl_Date.textAlignment = NSTextAlignmentCenter ;
        [ cell.contentView addSubview:lbl_Date] ;
        
        UILabel * lbl_ArchiveName = [[ UILabel alloc] initWithFrame:CGRectMake(lbl_Date.frame.origin.x+lbl_Date.frame.size.width, lbl_Date.frame.origin.y, 380 , lbl_Date.frame.size.height)] ;
        lbl_ArchiveName.text = @"" ;
        lbl_ArchiveName.tag = 2 ;
        lbl_ArchiveName.textColor = [ UIColor blackColor] ;
        lbl_ArchiveName.textAlignment = NSTextAlignmentCenter ;
        [ cell.contentView addSubview:lbl_ArchiveName] ;
        
        UIButton * btn_Delete = [ UIButton buttonWithType:UIButtonTypeCustom] ;
        btn_Delete.frame = CGRectMake(lbl_ArchiveName.frame.origin.x+lbl_ArchiveName.frame.size.width+13, lbl_ArchiveName.frame.origin.y+10, 25, 25) ;
        btn_Delete.tag = 3 ;
        [btn_Delete setBackgroundImage:[ UIImage imageNamed:@"CLOSE.png"] forState:UIControlStateNormal] ;
        [ btn_Delete addTarget:self action:@selector(fun_MailOrDelete:) forControlEvents:UIControlEventTouchUpInside] ;
        [ cell.contentView addSubview:btn_Delete] ;
        
        UIButton * btn_Mail = [ UIButton buttonWithType:UIButtonTypeCustom] ;
        btn_Mail.frame = CGRectMake(btn_Delete.frame.origin.x+btn_Delete.frame.size.width+13, btn_Delete.frame.origin.y, 25, 25) ;
        btn_Mail.tag = 4 ;
        [btn_Mail setBackgroundImage:[ UIImage imageNamed:@"ENV.png"] forState:UIControlStateNormal] ;
        [ btn_Mail addTarget:self action:@selector(fun_MailOrDelete:) forControlEvents:UIControlEventTouchUpInside] ;
        [ cell.contentView addSubview:btn_Mail] ;
        
        UIButton * btn_ShowPdf = [ UIButton buttonWithType:UIButtonTypeCustom] ;
        btn_ShowPdf.frame = CGRectMake(btn_Mail.frame.origin.x+btn_Mail.frame.size.width+13, btn_Mail.frame.origin.y, 25, 25) ;
        btn_ShowPdf.tag = 5 ;
        [btn_ShowPdf setBackgroundImage:[ UIImage imageNamed:@"NOTE.png"] forState:UIControlStateNormal] ;
        [ btn_ShowPdf addTarget:self action:@selector(fun_MailOrDelete:) forControlEvents:UIControlEventTouchUpInside] ;
        [ cell.contentView addSubview:btn_ShowPdf] ;
        
        UIButton * btn_OpenForm = [ UIButton buttonWithType:UIButtonTypeCustom] ;
        btn_OpenForm.frame = CGRectMake(btn_ShowPdf.frame.origin.x+btn_ShowPdf.frame.size.width+13, btn_ShowPdf.frame.origin.y, 25, 25) ;
        btn_OpenForm.tag = 6 ;
        [btn_OpenForm setBackgroundImage:[ UIImage imageNamed:@"ARC_EDIT.png"] forState:UIControlStateNormal] ;
        [ btn_OpenForm addTarget:self action:@selector(fun_MailOrDelete:) forControlEvents:UIControlEventTouchUpInside] ;
        [ cell.contentView addSubview:btn_OpenForm] ;
    }
    NSLog(@"Entryyyy ||") ;
    NSArray * arr_DocName =  [array_FullDocNames[indexPath.row][@"doc_name"] componentsSeparatedByString:@"_"] ;
    NSLog(@"Array _ doc name : %@", arr_DocName) ;
    (( UILabel *) [ cell viewWithTag:1]).text = arr_DocName[1] ;
    (( UILabel *) [ cell viewWithTag:2]).text = arr_DocName[0] ;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50 ;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentIndex = (int)indexPath.row ;
    NSLog(@"Currnt Index : %d", self.currentIndex) ;
}

- ( void) fun_MailOrDelete : ( UIButton *) currentButton
{
    if (currentButton.tag == 3)
    {
        CGPoint buttonPosition = [currentButton convertPoint:CGPointZero toView:self.tbl_Archives];
        deleteindexpath = [self.tbl_Archives indexPathForRowAtPoint:buttonPosition];
        UIAlertView * alertView = [[  UIAlertView alloc] initWithTitle:@"Effacer" message:@"Voulez-vous supprimer le fichier?" delegate:self cancelButtonTitle:@"NON" otherButtonTitles:@"OUI", nil] ;
        [ alertView show] ;
    }
    
    else if (currentButton.tag == 4)
    {
        CGPoint buttonPosition = [currentButton convertPoint:CGPointZero toView:self.tbl_Archives];
        NSIndexPath *indexPath = [self.tbl_Archives indexPathForRowAtPoint:buttonPosition];
        [ self openPerPagePDF : indexPath] ;
        [ self showEmail] ;
    }
    else if (currentButton.tag == 5)
    {
        CGPoint buttonPosition = [currentButton convertPoint:CGPointZero toView:self.tbl_Archives];
        NSIndexPath *indexPath = [self.tbl_Archives indexPathForRowAtPoint:buttonPosition];

        NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docpath = [ary objectAtIndex:0];
        
        path = [docpath stringByAppendingPathComponent:array_FullDocNames[indexPath.row][@"doc_name"]];
        [ self openPath:path] ;
    }
    else if (currentButton.tag == 6)
    {
        CGPoint buttonPosition = [currentButton convertPoint:CGPointZero toView:self.tbl_Archives];
        NSIndexPath *cindexPath=[self.tbl_Archives indexPathForRowAtPoint:buttonPosition];
        [self fun_RetrieveFromDB:cindexPath];
    }
}

- ( void) fun_RetrieveFromDB:( NSIndexPath * ) indexPath
{
//    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud=[[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hud.labelText=@"Chargement ... S'il vous plaît attendre";
    [self.navigationController.view addSubview:hud];
    [hud show:YES];
//    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(fetchRequestForIndexPath:) userInfo:nil repeats:NO];
    [self performSelectorOnMainThread:@selector(fetchRequestForIndexPath:) withObject:indexPath waitUntilDone:NO];
}
-(void)fetchRequestForIndexPath :( NSIndexPath * ) indexPath
{
   
    NSArray * arr_allKeys = [ array_FullDocNames[indexPath.row] allKeys] ;
    int doc_id ;
    for ( NSString * str_Key in arr_allKeys)
    {
        if (![str_Key isEqualToString:@"doc_name"])
        {
            doc_id = [array_FullDocNames[indexPath.row][str_Key] intValue] ;
            NSString * str_Query ;
            
            if ([str_Key isEqualToString:array_Ids[0]])
                str_Query =  [ NSString stringWithFormat:@"select * from hazardous_record where hazard_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[1]])
                str_Query =  [ NSString stringWithFormat:@"select * from consignment where consignment_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[2]])
                str_Query =  [ NSString stringWithFormat:@"select * from qsse where qsse_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[3]])
                str_Query =  [ NSString stringWithFormat:@"select * from prevention where prevention_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[4]])
                str_Query =  [ NSString stringWithFormat:@"select * from attestation where attestation_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[5]])
                str_Query =  [ NSString stringWithFormat:@"select * from accident_immediate where accident_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[6]])
                str_Query =  [ NSString stringWithFormat:@"select * from adequacy_conservation where adequacy_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[7]])
                str_Query =  [ NSString stringWithFormat:@"select * from risk_analysis where risk_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[8]])
                str_Query =  [ NSString stringWithFormat:@"select * from visite_securite where visite_id='%d'",doc_id]  ;
            else if ([str_Key isEqualToString:array_Ids[9]])
                str_Query=[NSString stringWithFormat:@"select * from verbal_de_reception where verbal_id='%d'", doc_id];
            
//            NSLog(@"Select query ::: %@", str_Query) ;
            
            retrarray=[[ DBSqlite dbManager] selectStatement: str_Query];
//            NSLog(@"Retrieved array is: %@", retrarray);
            
            NSArray * arr_DocName =  [retrarray[0][@"doc_name"] componentsSeparatedByString:@"_"] ;
            
//            NSLog(@"zerro is %@", arr_DocName[0]);
            
            if([arr_DocName[0] isEqual:@"Compte-rendu d'accident à chaud"])
            {
                NSLog(@"Redirecting.........");
                AccidentsVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"accident"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
                
            }
            if([arr_DocName[0] isEqual:@"ATC Attestation de consignation"])
            {
                NSLog(@"Redirecting.........");
                ConsignmentVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"consignment"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
            }
            
            if([arr_DocName[0] isEqual:@"DAR Analyse des  Risques"])
            {
                NSLog(@"Redirecting.........");
                RiskAnalysisViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"riskanalysis"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
            }
            
            if([arr_DocName[0] isEqual:@"Plan de prévention pour travaux"])
            {
                NSLog(@"Redirecting.........");
                PreventionPlanVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"prevention"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
            }
            
            if([arr_DocName[0] isEqual:@"CRV Causerie QSSE"])
            {
                NSLog(@"Redirecting.........");
                CauzQSSE_ViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"qsseform"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
            }
            
            if([arr_DocName[0] isEqual:@"Fiche de Situation Dangereuse ou incident"])
            {
                NSLog(@"Redirecting.........");
                HazardViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"hazardous"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
            }
            
            if([arr_DocName[0] isEqual:@"DAR Examen d'adéquation et de conservation"])
            {
                NSLog(@"Redirecting.........");
                AdequacyVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"adequacy"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
            }
            
            if([arr_DocName[0] isEqual:@"VAS Visite d'Amélioration Sécurité"])
            {
                NSLog(@"Redirecting.........");
                SecurityViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"security"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
            }
            
            if([arr_DocName[0] isEqual:@"PPS Emargement accueil chantier"])
            {
                NSLog(@"Redirecting.........");
                BeginFormVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"beginform"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
            }
            
            if([arr_DocName[0] isEqual:@"Proces Verbal De Reception"])
            {
                NSLog(@"Redirecting.........");
                ReceptionViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"reception"];
                controller.IsForUpdating=YES;
                controller.retrievedarray=retrarray;
                [self.navigationController pushViewController:controller animated:YES] ;
            }
        }
    }
    [MBProgressHUD hideAllHUDsForView:self.navigationController.view animated:YES];

}
- (void)openPath:(NSString *)pathString {
    
    NSURL *path1 = [NSURL fileURLWithPath:pathString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:path1];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    webView.scalesPageToFit = YES;
    webView.delegate = self ;
    
    [webView loadRequest:urlRequest];
    NSArray * arr_LastComponent1 = [pathString componentsSeparatedByString:@"/"]  ;
    NSArray * arr_LastComponent2 = [[arr_LastComponent1 lastObject] componentsSeparatedByString:@"_"] ;
    
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view = webView;
    viewController.title =  arr_LastComponent2[0]  ;
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [ self fun_RemoveFromDB:deleteindexpath] ;
        [ self fun_RemoveFromManager: array_FullDocNames[deleteindexpath.row][@"doc_name"]] ;
        [array_FullDocNames removeObjectAtIndex:deleteindexpath.row] ;
        [ self.tbl_Archives reloadData] ;
       
    }
}
- ( void) fun_RemoveFromDB:( NSIndexPath * ) indexPath
{
    NSArray * arr_allKeys = [ array_FullDocNames[indexPath.row] allKeys] ;
    int doc_id ;
    for ( NSString * str_Key in arr_allKeys)
    {
        if (![str_Key isEqualToString:@"doc_name"])
        {
            doc_id = [array_FullDocNames[indexPath.row][str_Key] intValue] ;
            NSString * str_Query ;
            
            if ([str_Key isEqualToString:array_Ids[0]])
                str_Query =  [ NSString stringWithFormat:@"delete from hazardous_record where hazard_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[1]])
                str_Query =  [ NSString stringWithFormat:@"delete from consignment where consignment_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[2]])
                str_Query =  [ NSString stringWithFormat:@"delete from qsse where qsse_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[3]])
                str_Query =  [ NSString stringWithFormat:@"delete from prevention where prevention_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[4]])
                str_Query =  [ NSString stringWithFormat:@"delete from attestation where attestation_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[5]])
                str_Query =  [ NSString stringWithFormat:@"delete from accident_immediate where accident_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[6]])
                str_Query =  [ NSString stringWithFormat:@"delete from adequacy_conservation where adequacy_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[7]])
                str_Query =  [ NSString stringWithFormat:@"delete from risk_analysis where risk_id='%d'",doc_id]  ;
            else if ([ str_Key isEqualToString:array_Ids[8]])
                str_Query =  [ NSString stringWithFormat:@"delete from visite_securite where visite_id='%d'",doc_id]  ;
            else if ([str_Key isEqualToString:array_Ids[9]])
                str_Query=[NSString stringWithFormat:@"delete from verbal_de_reception where verbal_id='%d'", doc_id];
            
            NSLog(@"Delete query ::: %@", str_Query) ;
            [[ DBSqlite dbManager] deleteStatement: str_Query];
        }
    }
}

- ( void) fun_RemoveFromManager :  ( NSString *) currentDocumentName
{
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    NSString *fullPath = [docpath stringByAppendingPathComponent:currentDocumentName];
    NSError *error = nil;
    NSFileManager *fl = [NSFileManager defaultManager];
    if([fl fileExistsAtPath:docpath])
    {
        BOOL removeSuccess = [fl removeItemAtPath:fullPath error:&error];
        if(removeSuccess){
            NSLog(@"File removed") ;
        }
        else {
            NSLog(@"File not removed") ;
        }
    }
}

- (void)openPerPagePDF : ( NSIndexPath * ) indexPath
{
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    str_DocumentName = array_FullDocNames[(int)indexPath.row][@"doc_name"] ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
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
    
    if ([extension isEqualToString:@"jpg"])
    {
        mimeType  =  @"image/jpeg";
    }
    else if ([extension isEqualToString:@"png"])
    {
        mimeType  =  @"image/png";
    }
    else if ([extension isEqualToString:@"doc"])
    {
        mimeType  =  @"application/msword";
    }
    else if ([extension isEqualToString:@"ppt"])
    {
        mimeType  =  @"application/vnd.ms-powerpoint";
    }
    else if ([extension isEqualToString:@"html"])
    {
        mimeType  =  @"text/html";
    }
    else if ([extension isEqualToString:@"pdf"])
    {
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
