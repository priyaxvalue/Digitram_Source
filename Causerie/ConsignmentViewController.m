//
//  ConsignmentViewController.m
//  Digitram
//
//  Created by Ravi on 27/05/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import "ConsignmentViewController.h"
#import "ScrollViewToPDF.h"
#import <QuartzCore/QuartzCore.h>

@interface ConsignmentViewController ()

@end

@implementation ConsignmentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1,928
    str_DocumentName = @"Print Preview" ;
    self.title = str_DocumentName ;
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // Created and modified date as of now
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [format setDateFormat:@"yyyy-MM-dd"];
    str_CreatedDate = [format stringFromDate:now];
    NSLog(@"Created Date : %@", str_CreatedDate) ;
    [scrollView setContentSize:(CGSizeMake(768, 2600))];
    saved_Into_DB=NO;
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    [self.img1view.layer setBorderWidth:0.8];
    [self.img2view.layer setBorderWidth:0.8];
    
    //BarButton
    saveButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_download1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm:)] ;
    pdfButton = [[ UIBarButtonItem alloc] initWithImage:[ UIImage imageNamed:@"ic_mail1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(saveToDataBase:)] ;
    self.navigationItem.rightBarButtonItem = pdfButton ;
    NSArray *arry = [[NSArray alloc]initWithObjects:pdfButton,saveButton, nil];
    self.navigationItem.rightBarButtonItems = arry ;
    
    self.sigview1.layer.borderWidth=1.0;
    self.sigview1.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview2.layer.borderWidth=1.0;
    self.sigview2.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview3.layer.borderWidth=1.0;
    self.sigview3.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview4.layer.borderWidth=1.0;
    self.sigview4.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview5.layer.borderWidth=1.0;
    self.sigview5.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview6.layer.borderWidth=1.0;
    self.sigview6.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview7.layer.borderWidth=1.0;
    self.sigview7.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview8.layer.borderWidth=1.0;
    self.sigview8.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview9.layer.borderWidth=1.0;
    self.sigview9.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview10.layer.borderWidth=1.0;
    self.sigview10.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview11.layer.borderWidth=1.0;
    self.sigview11.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    self.sigview12.layer.borderWidth=1.0;
    self.sigview12.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    txtDeconsignation_a.textAlignment=NSTextAlignmentCenter;
    txtDeconsignation_h.textAlignment=NSTextAlignmentCenter;
    txtDeconsignation_mn.textAlignment=NSTextAlignmentCenter;
    
    txtSign_consignation_a.textAlignment=NSTextAlignmentCenter;
    txtSign_consignation_h.textAlignment=NSTextAlignmentCenter;
    txtSign_consignation_mn.textAlignment=NSTextAlignmentCenter;
    
    txtDelegation_a.textAlignment=NSTextAlignmentCenter;
    txtDelegation_h.textAlignment=NSTextAlignmentCenter;
    txtDelegation_mn.textAlignment=NSTextAlignmentCenter;
    
    txtPlus_tard_a.textAlignment=NSTextAlignmentCenter;
    txtPlus_tard_h.textAlignment=NSTextAlignmentCenter;
    txtPlus_tard_mn.textAlignment=NSTextAlignmentCenter;
    
    txtdecharge_date.textAlignment=NSTextAlignmentCenter;
    txtdecharge_heure.textAlignment=NSTextAlignmentCenter;
    
    if(self.IsForUpdating==YES)
    {
        // ************* For Signature Image
        NSString *datas1=(self.retrievedarray)[0][@"consignment"];
        NSData *data=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image=[[UIImage alloc]init];
        image=[UIImage imageWithData:data];
        [self.imagevw1 setImage:image];
        
        NSString *datas2=(self.retrievedarray)[0][@"accord"];
        NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image2=[[UIImage alloc]init];
        image2=[UIImage imageWithData:data2];
        [self.imagevw2 setImage:image2];
        
        NSString *datas3=(self.retrievedarray)[0][@"avis_trav"];
        NSData *data3=[[NSData alloc]initWithBase64EncodedData:datas3 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image3=[[UIImage alloc]init];
        image3=[UIImage imageWithData:data3];
        [self.imagevw3 setImage:image3];
        
        NSString *datas4=(self.retrievedarray)[0][@"avis_consi"];
        NSData *data4=[[NSData alloc]initWithBase64EncodedData:datas4 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image4=[[UIImage alloc]init];
        image4=[UIImage imageWithData:data4];
        [self.imagevw4 setImage:image4];
        
        NSString *datas5=(self.retrievedarray)[0][@"authorisation_accord"];
        NSData *data5=[[NSData alloc]initWithBase64EncodedData:datas5 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image5=[[UIImage alloc]init];
        image5=[UIImage imageWithData:data5];
        [self.imagevw5 setImage:image5];
        
        NSString *datas6=(self.retrievedarray)[0][@"authorisation_consignation"];
        NSData *data6=[[NSData alloc]initWithBase64EncodedData:datas6 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image6=[[UIImage alloc]init];
        image6=[UIImage imageWithData:data6];
        [self.imagevw6 setImage:image6];
        
        NSString *datas7=(self.retrievedarray)[0][@"sign_remplace"];
        NSData *data7=[[NSData alloc]initWithBase64EncodedData:datas7 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image7=[[UIImage alloc]init];
        image7=[UIImage imageWithData:data7];
        [self.imagevw7 setImage:image7];
        
        NSString *datas8=(self.retrievedarray)[0][@"sign_remplacant"];
        NSData *data8=[[NSData alloc]initWithBase64EncodedData:datas8 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image8=[[UIImage alloc]init];
        image8=[UIImage imageWithData:data8];
        [self.imagevw8 setImage:image8];
        
        NSString *datas9=(self.retrievedarray)[0][@"le_represendant"];
        NSData *data9=[[NSData alloc]initWithBase64EncodedData:datas9 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image9=[[UIImage alloc]init];
        image9=[UIImage imageWithData:data9];
        [self.imagevw9 setImage:image9];
        
        NSString *datas10=(self.retrievedarray)[0][@"le_charge"];
        NSData *data10=[[NSData alloc]initWithBase64EncodedData:datas10 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image10=[[UIImage alloc]init];
        image10=[UIImage imageWithData:data10];
        [self.imagevw10 setImage:image10];
        
        NSString *datas11=(self.retrievedarray)[0][@"decharge_travaux"];
        NSData *data11=[[NSData alloc]initWithBase64EncodedData:datas11 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image11=[[UIImage alloc]init];
        image11=[UIImage imageWithData:data11];
        [self.imagevw11 setImage:image11];
        
        NSString *datas12=(self.retrievedarray)[0][@"decharge_le_represendant"];
        NSData *data12=[[NSData alloc]initWithBase64EncodedData:datas12 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image12=[[UIImage alloc]init];
        image12=[UIImage imageWithData:data12];
        [self.imagevw12 setImage:image12];
        
        //************** For Text
        txtConsignation_m.text=(self.retrievedarray)[0][@"consignation_m"];
        txtEnterprise.text=(self.retrievedarray)[0][@"enterprise"];
        txtConsignee_a.text=(self.retrievedarray)[0][@"consignee_a"];
        txtConsignee_h.text=(self.retrievedarray)[0][@"consignee_h"];
        txtConsignee_mn.text=(self.retrievedarray)[0][@"consignee_mn"];
        txtRisques.text=(self.retrievedarray)[0][@"risques"];
        txtSuivants.text=(self.retrievedarray)[0][@"suivants"];
        
        txtTermines_a.text=(self.retrievedarray)[0][@"termines_a"];
        txtTermines_h.text=(self.retrievedarray)[0][@"termines_h"];
        txtTermines_mn.text=(self.retrievedarray)[0][@"termines_mn"];
        
        txtNecessaires.text=(self.retrievedarray)[0][@"necessaires"];
        txtRepresentant.text=(self.retrievedarray)[0][@"representant"];
        txtDeconsignation_a.text=(self.retrievedarray)[0][@"deconsignation_a"];
        txtDeconsignation_h.text=(self.retrievedarray)[0][@"deconsignation_h"];
        txtDeconsignation_mn.text=(self.retrievedarray)[0][@"deconsignation_mn"];
        
        txtNom_remplace.text=(self.retrievedarray)[0][@"nom_remplace"];
        txtNom_remplacant.text=(self.retrievedarray)[0][@"nom_remplacant"];
        txtSign_consignation_a.text=(self.retrievedarray)[0][@"sign_consignation_a"];
        txtSign_consignation_h.text=(self.retrievedarray)[0][@"sign_consignation_h"];
        txtSign_consignation_mn.text=(self.retrievedarray)[0][@"sign_consignation_mn"];
        
        txtDelegation_represent.text=(self.retrievedarray)[0][@"delegation_represent"];
        txtDelegation_demande.text=(self.retrievedarray)[0][@"delegation_demande"];
        txtDelegation_charge.text=(self.retrievedarray)[0][@"delegation_charge"];
        txtd_effectuer_les.text=(self.retrievedarray)[0][@"d_effectuer_les"];
        txtDelegation_a.text=(self.retrievedarray)[0][@"delegation_a"];
        txtDelegation_h.text=(self.retrievedarray)[0][@"delegation_h"];
        txtDelegation_mn.text=(self.retrievedarray)[0][@"delegation_mn"];
        txtDelegation_risques.text=(self.retrievedarray)[0][@"delegation_risques"];
        txtPlus_tard_a.text=(self.retrievedarray)[0][@"plus_tard_a"];
        txtPlus_tard_h.text=(self.retrievedarray)[0][@"plus_tard_h"];
        txtPlus_tard_mn.text=(self.retrievedarray)[0][@"plus_tard_mn"];
        
        txtdecharge_represendant.text=(self.retrievedarray)[0][@"decharge_represendant"];
        txtdecharge_de_toutes.text=(self.retrievedarray)[0][@"decharge_de_toutes"];
        txtdecharge_de_travaux.text=(self.retrievedarray)[0][@"decharge_de_travaux"];
        txtdecharge_suivant.text=(self.retrievedarray)[0][@"decharge_suivant"];
        txtdecharge_duree_de.text=(self.retrievedarray)[0][@"decharge_duree_de"];
        txtdecharge_date.text=(self.retrievedarray)[0][@"decharge_date"];
        txtdecharge_heure.text=(self.retrievedarray)[0][@"decharge_heure"];
    }
    if(self.confirmpdf==YES)
    {
        txtConsignation_m.text=self.dataarray[0];
        txtEnterprise.text=self.dataarray[1];
        txtConsignee_a.text=self.dataarray[2];
        txtConsignee_h.text=self.dataarray[3];
        txtConsignee_mn.text=self.dataarray[4];
        txtRisques.text=self.dataarray[5];
        txtSuivants.text=self.dataarray[6];
        
        txtTermines_a.text=self.dataarray[7];
        txtTermines_h.text=self.dataarray[8];
        txtTermines_mn.text=self.dataarray[9];
        
        txtNecessaires.text=self.dataarray[10];
        txtRepresentant.text=self.dataarray[11];
        txtDeconsignation_a.text=self.dataarray[12];
        txtDeconsignation_h.text=self.dataarray[13];
        txtDeconsignation_mn.text=self.dataarray[14];
        
        txtNom_remplace.text=self.dataarray[15];
        txtNom_remplacant.text=self.dataarray[16];
        txtSign_consignation_a.text=self.dataarray[17];
        txtSign_consignation_h.text=self.dataarray[18];
        txtSign_consignation_mn.text=self.dataarray[19];
        
        txtDelegation_represent.text=self.dataarray[20];
        txtDelegation_demande.text=self.dataarray[21];
        txtDelegation_charge.text=self.dataarray[22];
        txtd_effectuer_les.text=self.dataarray[23];
        txtDelegation_a.text=self.dataarray[24];
        txtDelegation_h.text=self.dataarray[25];
        txtDelegation_mn.text=self.dataarray[26];
        txtDelegation_risques.text=self.dataarray[27];
        txtPlus_tard_a.text=self.dataarray[28];
        txtPlus_tard_h.text=self.dataarray[29];
        txtPlus_tard_mn.text=self.dataarray[30];
        
        txtdecharge_represendant.text=self.dataarray[31];
        txtdecharge_de_toutes.text=self.dataarray[32];
        txtdecharge_de_travaux.text=self.dataarray[33];
        txtdecharge_suivant.text=self.dataarray[34];
        txtdecharge_duree_de.text=self.dataarray[35];
        txtdecharge_date.text=self.dataarray[36];
        txtdecharge_heure.text=self.dataarray[37];
        
        if (self.imagearray.count!=0)
        {
            NSString *datas1=self.imagearray[0];
            NSData *data=[[NSData alloc]initWithBase64EncodedData:datas1 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image=[[UIImage alloc]init];
            image=[UIImage imageWithData:data];
            [self.imagevw1 setImage:image];
        }
        if(self.imagearray1.count!=0)
        {
            NSString *datas2=self.imagearray1[0];
            NSData *data2=[[NSData alloc]initWithBase64EncodedData:datas2 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image2=[[UIImage alloc]init];
            image2=[UIImage imageWithData:data2];
            [self.imagevw2 setImage:image2];
        }
        if(self.imagearray2.count!=0)
        {
            NSString *datas3=self.imagearray2[0];
            NSData *data3=[[NSData alloc]initWithBase64EncodedData:datas3 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image3=[[UIImage alloc]init];
            image3=[UIImage imageWithData:data3];
            [self.imagevw3 setImage:image3];
        }
        if(self.imagearray3.count!=0)
        {
            NSString *datas4=self.imagearray3[0];
            NSData *data4=[[NSData alloc]initWithBase64EncodedData:datas4 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image4=[[UIImage alloc]init];
            image4=[UIImage imageWithData:data4];
            [self.imagevw4 setImage:image4];
        }
        if(self.imagearray4.count!=0)
        {
            NSString *datas5=self.imagearray4[0];
            NSData *data5=[[NSData alloc]initWithBase64EncodedData:datas5 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image5=[[UIImage alloc]init];
            image5=[UIImage imageWithData:data5];
            [self.imagevw5 setImage:image5];
        }
        if(self.imagearray5.count!=0)
        {
            NSString *datas6=self.imagearray5[0];
            NSData *data6=[[NSData alloc]initWithBase64EncodedData:datas6 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image6=[[UIImage alloc]init];
            image6=[UIImage imageWithData:data6];
            [self.imagevw6 setImage:image6];
        }
        if(self.imagearray6.count!=0)
        {
            NSString *datas7=self.imagearray6[0];
            NSData *data7=[[NSData alloc]initWithBase64EncodedData:datas7 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image7=[[UIImage alloc]init];
            image7=[UIImage imageWithData:data7];
            [self.imagevw7 setImage:image7];
        }
        if(self.imagearray7.count!=0)
        {
            NSString *datas8=self.imagearray7[0];
            NSData *data8=[[NSData alloc]initWithBase64EncodedData:datas8 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image8=[[UIImage alloc]init];
            image8=[UIImage imageWithData:data8];
            [self.imagevw8 setImage:image8];
        }
        if(self.imagearray8.count!=0)
        {
            NSString *datas9=self.imagearray8[0];
            NSData *data9=[[NSData alloc]initWithBase64EncodedData:datas9 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image9=[[UIImage alloc]init];
            image9=[UIImage imageWithData:data9];
            [self.imagevw9 setImage:image9];
        }
        if(self.imagearray9.count!=0)
        {
            NSString *datas10=self.imagearray9[0];
            NSData *data10=[[NSData alloc]initWithBase64EncodedData:datas10 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image10=[[UIImage alloc]init];
            image10=[UIImage imageWithData:data10];
            [self.imagevw10 setImage:image10];
        }
        
        if(self.imagearray10.count!=0)
        {
            NSString *datas11=self.imagearray10[0];
            NSData *data11=[[NSData alloc]initWithBase64EncodedData:datas11 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image11=[[UIImage alloc]init];
            image11=[UIImage imageWithData:data11];
            [self.imagevw11 setImage:image11];
        }
        if(self.imagearray11.count!=0)
        {
            NSString *datas12=self.imagearray11[0];
            NSData *data12=[[NSData alloc]initWithBase64EncodedData:datas12 options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *image12=[[UIImage alloc]init];
            image12=[UIImage imageWithData:data12];
            [self.imagevw12 setImage:image12];
        }
    }
    
    txtConsignation_m.delegate=self;
    txtEnterprise.delegate=self;
    txtConsignee_a.delegate=self;
    txtConsignee_h.delegate=self;
    txtConsignee_mn.delegate=self;
    txtRisques.delegate=self;
    txtSuivants.delegate=self;
    txtConsignment.delegate=self;
    txtAccord.delegate=self;
    txtTermines_a.delegate=self;
    txtTermines_h.delegate=self;
    txtTermines_mn.delegate=self;
    txtNecessaires.delegate=self;
    txtRepresentant.delegate=self;
    txtDeconsignation_a.delegate=self;
    txtDeconsignation_h.delegate=self;
    txtDeconsignation_mn.delegate=self;
    txtAuthorisation_accord.delegate=self;
    txtAuthorisation_consignation.delegate=self;
    txtNom_remplace.delegate=self;
    txtNom_remplacant.delegate=self;
    txtSign_remplace.delegate=self;
    txtSign_remplacant.delegate=self;
    txtSign_consignation.delegate=self;
    txtSign_consignation_a.delegate=self;
    txtSign_consignation_h.delegate=self;
    txtSign_consignation_mn.delegate=self;
    txtDelegation_represent.delegate=self;
    txtDelegation_demande.delegate=self;
    txtDelegation_charge.delegate=self;
    txtd_effectuer_les.delegate=self;
    txtDelegation_a.delegate=self;
    txtDelegation_h.delegate=self;
    txtDelegation_mn.delegate=self;
    txtDelegation_risques.delegate=self;
    txtPlus_tard_a.delegate=self;
    txtPlus_tard_h.delegate=self;
    txtPlus_tard_mn.delegate=self;
    txtle_represendant.delegate=self;
    txtle_charge.delegate=self;
    txtdecharge_represendant.delegate=self;
    txtdecharge_de_toutes.delegate=self;
    txtdecharge_de_travaux.delegate=self;
    txtdecharge_suivant.delegate=self;
    txtdecharge_duree_de.delegate=self;
    txtdecharge_date.delegate=self;
    txtdecharge_heure.delegate=self;
    txtdecharge_travaux.delegate=self;
    txtdecharge_le_represendant.delegate=self;
}

-(void)viewDidAppear:(BOOL)animated
{
    txtConsignation_m.userInteractionEnabled=false;
    
    txtEnterprise.userInteractionEnabled=false;
    txtConsignee_a.userInteractionEnabled=false;
    txtConsignee_h.userInteractionEnabled=false;
    txtConsignee_mn.userInteractionEnabled=false;
    txtRisques.userInteractionEnabled=false;
    txtSuivants.userInteractionEnabled=false;
    
    txtTermines_a.userInteractionEnabled=false;
    txtTermines_h.userInteractionEnabled=false;
    txtTermines_mn.userInteractionEnabled=false;
    
    txtNecessaires.userInteractionEnabled=false;
    txtRepresentant.userInteractionEnabled=false;
    txtDeconsignation_a.userInteractionEnabled=false;
    txtDeconsignation_h.userInteractionEnabled=false;
    txtDeconsignation_mn.userInteractionEnabled=false;
    
    txtNom_remplace.userInteractionEnabled=false;
    txtNom_remplacant.userInteractionEnabled=false;
    txtSign_consignation_a.userInteractionEnabled=false;
    txtSign_consignation_h.userInteractionEnabled=false;
    txtSign_consignation_mn.userInteractionEnabled=false;
    
    txtDelegation_represent.userInteractionEnabled=false;
    txtDelegation_demande.userInteractionEnabled=false;
    txtDelegation_charge.userInteractionEnabled=false;
    txtd_effectuer_les.userInteractionEnabled=false;
    txtDelegation_a.userInteractionEnabled=false;
    txtDelegation_h.userInteractionEnabled=false;
    txtDelegation_mn.userInteractionEnabled=false;
    txtDelegation_risques.userInteractionEnabled=false;
    txtPlus_tard_a.userInteractionEnabled=false;
    txtPlus_tard_h.userInteractionEnabled=false;
    txtPlus_tard_mn.userInteractionEnabled=false;
    
    txtdecharge_represendant.userInteractionEnabled=false;
    txtdecharge_de_toutes.userInteractionEnabled=false;
    txtdecharge_de_travaux.userInteractionEnabled=false;
    txtdecharge_suivant.userInteractionEnabled=false;
    txtdecharge_duree_de.userInteractionEnabled=false;
    txtdecharge_date.userInteractionEnabled=false;
    txtdecharge_heure.userInteractionEnabled=false;
    
    self.editbut1.userInteractionEnabled=false;
    self.editbut2.userInteractionEnabled=false;
    self.editbut3.userInteractionEnabled=false;
    self.editbut4.userInteractionEnabled=false;
    self.editbut5.userInteractionEnabled=false;
    self.editbut6.userInteractionEnabled=false;
    self.editbut7.userInteractionEnabled=false;
    self.editbut8.userInteractionEnabled=false;
    self.editbut9.userInteractionEnabled=false;
    self.editbut10.userInteractionEnabled=false;
    self.editbut11.userInteractionEnabled=false;
    self.editbut12.userInteractionEnabled=false;
}

-(IBAction)editbutclicked:(id)sender
{
    [self.view endEditing:YES];
    UIButton *butt=(UIButton *)sender;
    
    if (butt.tag==401)
    {
        //  currentImage =
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig1clicked = YES ;
    }
    else if(butt.tag==402)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig2clicked = YES ;
    }
    else if(butt.tag==403)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig3clicked = YES ;
    }
    else if(butt.tag==404)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig4clicked = YES ;
    }
    if (butt.tag==405)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig5clicked = YES ;
    }
    else if(butt.tag==406)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig6clicked = YES ;
    }
    else if(butt.tag==407)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig7clicked = YES ;
    }
    else if(butt.tag==408)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig8clicked = YES ;
    }
    if (butt.tag==409)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig9clicked = YES ;
    }
    else if(butt.tag==410)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig10clicked = YES ;
    }
    else if(butt.tag==411)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig11clicked = YES ;
    }
    else if(butt.tag==412)
    {
        UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignaVC *svc=[sb instantiateViewControllerWithIdentifier:@"signa"];
        svc.delegate=self;
        [self.navigationController pushViewController:svc animated:NO];
        sig12clicked = YES ;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.view endEditing:YES];
}

#pragma mark - UITextFiled Delegates

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField==txtdecharge_represendant || textField==txtdecharge_de_toutes || textField==txtdecharge_de_travaux || textField==txtdecharge_suivant || textField==txtdecharge_duree_de)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textField==txtDelegation_represent || textField==txtDelegation_demande || textField==txtd_effectuer_les|| textField==txtDelegation_charge || textField==txtDelegation_risques)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-400;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textField==txtDelegation_represent || textField==txtDelegation_demande || textField==txtd_effectuer_les|| textField==txtDelegation_charge || textField==txtDelegation_risques)
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-400;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textField==txtNom_remplace || textField==txtNom_remplacant )
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-500;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    else if (textField==txtRepresentant || textField==txtNecessaires )
    {
        CGRect scrollViewFrame=scrollView.frame;
        CGPoint bottomOffset = CGPointMake(0, scrollView.contentSize.height - scrollView.bounds.size.height);
        scrollViewFrame.origin.y=bottomOffset.y-700;
        [scrollView scrollRectToVisible:scrollViewFrame animated:YES];
    }
    if (textField == txtConsignee_a)
    {
        [self.view endEditing:YES];
        [self showDatePicker];
        return NO;
    }
    if (textField == txtConsignee_h)
    {
        [self.view endEditing:YES];
        [self showTimePicker];
        return NO;
    }
    if (textField == txtConsignee_mn)
    {
        [self.view endEditing:YES];
        [self showMinutePicker];
        return NO;
    }
    if (textField == txtTermines_a)
    {
        [self.view endEditing:YES];
        [self showDatePicker1];
        return NO;
    }
    if (textField == txtTermines_h)
    {
        [self.view endEditing:YES];
        [self showTimePicker1];
        return NO;
    }
    if (textField == txtTermines_mn)
    {
        [self.view endEditing:YES];
        [self showMinutePicker1];
        return NO;
    }
    if (textField == txtDeconsignation_a)
    {
        [self.view endEditing:YES];
        [self showDatePicker2];
        return NO;
    }
    if (textField == txtDeconsignation_h)
    {
        [self.view endEditing:YES];
        [self showTimePicker2];
        return NO;
    }
    if (textField == txtDeconsignation_mn)
    {
        [self.view endEditing:YES];
        [self showMinutePicker2];
        return NO;
    }
    if (textField == txtSign_consignation_a)
    {
        [self.view endEditing:YES];
        [self showDatePicker3];
        return NO;
    }
    if (textField == txtSign_consignation_h)
    {
        [self.view endEditing:YES];
        [self showTimePicker3];
        return NO;
    }
    if (textField == txtSign_consignation_mn)
    {
        [self.view endEditing:YES];
        [self showMinutePicker3];
        return NO;
    }
    if (textField == txtDelegation_a)
    {
        [self.view endEditing:YES];
        [self showDatePicker4];
        return NO;
    }
    if (textField == txtDelegation_h)
    {
        [self.view endEditing:YES];
        [self showTimePicker4];
        return NO;
    }
    
    if (textField == txtDelegation_mn)
        
    {
        [self.view endEditing:YES];
        
        [self showMinutePicker4];
        
        return NO;
    }
    
    if (textField == txtPlus_tard_a)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker5];
        
        return NO;
        
    }
    
    if (textField == txtPlus_tard_h)
        
    {
        [self.view endEditing:YES];
        
        [self showTimePicker5];
        
        return NO;
    }
    
    if (textField == txtPlus_tard_mn)
        
    {
        [self.view endEditing:YES];
        
        [self showMinutePicker5];
        
        return NO;
    }
    
    if (textField == txtdecharge_date)
        
    {
        [self.view endEditing:YES];
        
        [self showDatePicker6];
        
        return NO;
    }
    
    if (textField == txtdecharge_heure)
        
    {
        [self.view endEditing:YES];
        
        [self showTimePicker6];
        
        return NO;
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    
    return YES;
    
}

#pragma mark - Showing DatePicker


#pragma mark for Date

-(void)showDatePicker

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    
    [txtConsignee_a setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:txtConsignee_a.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)txtConsignee_a.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    txtConsignee_a.text = [NSString stringWithFormat:@"%@",dateString];
    
}

# pragma mark For time

-(void) timefield:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtConsignee_h.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"HH"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtConsignee_h.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showTimePicker

{
    
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(timefield:) forControlEvents:UIControlEventValueChanged];
    
    [txtConsignee_h setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtConsignee_h.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

# pragma mark For Minutes

-(void) minutefield:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtConsignee_mn.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"mm"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtConsignee_mn.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showMinutePicker

{
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(minutefield:) forControlEvents:UIControlEventValueChanged];
    
    [txtConsignee_mn setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtConsignee_mn.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}


# pragma mark For date

-(void)showDatePicker1

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField1:) forControlEvents:UIControlEventValueChanged];
    
    [txtTermines_a setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:txtTermines_a.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField1:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)txtTermines_a.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    txtTermines_a.text = [NSString stringWithFormat:@"%@",dateString];
    
}

# pragma mark For time

-(void) timefield1:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtTermines_h.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"HH"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtTermines_h.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showTimePicker1

{
    
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(timefield1:) forControlEvents:UIControlEventValueChanged];
    
    [txtTermines_h setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtTermines_h.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

# pragma mark For Minutes

-(void) minutefield1:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtTermines_mn.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"mm"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtTermines_mn.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showMinutePicker1

{
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(minutefield1:) forControlEvents:UIControlEventValueChanged];
    
    [txtTermines_mn setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtTermines_mn.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}


#pragma mark for Date

-(void)showDatePicker2

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField2:) forControlEvents:UIControlEventValueChanged];
    
    [txtDeconsignation_a setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:txtDeconsignation_a.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField2:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)txtDeconsignation_a.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    txtDeconsignation_a.text = [NSString stringWithFormat:@"%@",dateString];
    
}

# pragma mark For time

-(void) timefield2:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtDeconsignation_h.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"HH"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtDeconsignation_h.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showTimePicker2

{
    
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(timefield2:) forControlEvents:UIControlEventValueChanged];
    
    [txtDeconsignation_h setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtDeconsignation_h.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

# pragma mark For Minutes

-(void) minutefield2:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtDeconsignation_mn.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"mm"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtDeconsignation_mn.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showMinutePicker2

{
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(minutefield2:) forControlEvents:UIControlEventValueChanged];
    
    [txtDeconsignation_mn setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtDeconsignation_mn.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

///////////////////////////////////////

#pragma mark for Date

-(void)showDatePicker3

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField3:) forControlEvents:UIControlEventValueChanged];
    
    [txtSign_consignation_a setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:txtSign_consignation_a.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField3:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)txtSign_consignation_a.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    txtSign_consignation_a.text = [NSString stringWithFormat:@"%@",dateString];
    
}

# pragma mark For time

-(void) timefield3:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtSign_consignation_h.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"HH"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtSign_consignation_h.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showTimePicker3

{
    
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(timefield3:) forControlEvents:UIControlEventValueChanged];
    
    [txtSign_consignation_h setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtSign_consignation_h.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

# pragma mark For Minutes

-(void) minutefield3:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtSign_consignation_mn.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"mm"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtSign_consignation_mn.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showMinutePicker3

{
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(minutefield3:) forControlEvents:UIControlEventValueChanged];
    
    [txtSign_consignation_mn setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtSign_consignation_mn.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

/////////////////////////////////

#pragma mark for Date

-(void)showDatePicker4

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField4:) forControlEvents:UIControlEventValueChanged];
    
    [txtDelegation_a setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:txtDelegation_a.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField4:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)txtDelegation_a.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    txtDelegation_a.text = [NSString stringWithFormat:@"%@",dateString];
    
}

# pragma mark For time

-(void) timefield4:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtDelegation_h.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"HH"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtDelegation_h.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showTimePicker4

{
    
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(timefield4:) forControlEvents:UIControlEventValueChanged];
    
    [txtDelegation_h setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtDelegation_h.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}


# pragma mark For Minutes

-(void) minutefield4:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtDelegation_mn.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"mm"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtDelegation_mn.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showMinutePicker4

{
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(minutefield4:) forControlEvents:UIControlEventValueChanged];
    
    [txtDelegation_mn setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtDelegation_mn.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

///////////////////////////////

#pragma mark for Date

-(void)showDatePicker5

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField5:) forControlEvents:UIControlEventValueChanged];
    
    [txtPlus_tard_a setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:txtPlus_tard_a.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField5:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)txtPlus_tard_a.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    txtPlus_tard_a.text = [NSString stringWithFormat:@"%@",dateString];
    
}

# pragma mark For time

-(void) timefield5:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtPlus_tard_h.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"HH"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtPlus_tard_h.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showTimePicker5

{
    
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(timefield5:) forControlEvents:UIControlEventValueChanged];
    
    [txtPlus_tard_h setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtPlus_tard_h.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}


# pragma mark For Minutes

-(void) minutefield5:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtPlus_tard_mn.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"mm"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtPlus_tard_mn.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showMinutePicker5

{
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    
    [timePicker setDate:[NSDate date]];
    
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(minutefield5:) forControlEvents:UIControlEventValueChanged];
    
    [txtPlus_tard_mn setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtPlus_tard_mn.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

////////////////////////////////////////////////

#pragma mark for Date

-(void)showDatePicker6

{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    [datePicker addTarget:self action:@selector(dateTextField6:) forControlEvents:UIControlEventValueChanged];
    
    [txtdecharge_date setInputView:datePicker];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    
    UIView *popoverView = [[UIView alloc] init];
    
    popoverView.backgroundColor = [UIColor clearColor];
    
    [popoverView addSubview:datePicker];
    
    popoverContent.view = popoverView;
    
    UIPopoverController *popoverController;
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    
    popoverController.delegate=self;
    
    [popoverController setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverController presentPopoverFromRect:txtdecharge_date.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}

-(void) dateTextField6:(id)sender

{
    UIDatePicker *picker = (UIDatePicker*)txtdecharge_date.inputView;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    NSDate *eventDate = picker.date;
    
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    
    txtdecharge_date.text = [NSString stringWithFormat:@"%@",dateString];
    
}

# pragma mark For time

-(void) timefield6:(id)sender
{
    UIDatePicker *myDatePicker = (UIDatePicker*)txtdecharge_heure.inputView;
    
    myDatePicker.datePickerMode=UIDatePickerModeTime;
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    [outputFormatter setDateFormat:@"HH:mm"]; //24hr time format
    
    NSString *timeString = [outputFormatter stringFromDate:myDatePicker.date];
    
    txtdecharge_heure.text = [NSString stringWithFormat:@"%@",timeString];
}

-(void)showTimePicker6

{
    UIDatePicker *timePicker = [[UIDatePicker alloc]init];
    [timePicker setDate:[NSDate date]];
    timePicker.datePickerMode = UIDatePickerModeTime;
    
    [timePicker addTarget:self action:@selector(timefield6:) forControlEvents:UIControlEventValueChanged];
    
    [txtdecharge_heure setInputView:timePicker];
    
    UIViewController* popoverContenttime = [[UIViewController alloc] init];
    
    UIView *popoverViewtime = [[UIView alloc] init];
    
    popoverViewtime.backgroundColor = [UIColor clearColor];
    
    [popoverViewtime addSubview:timePicker];
    
    popoverContenttime.view = popoverViewtime;
    
    UIPopoverController *popoverControllertime;
    
    popoverControllertime = [[UIPopoverController alloc] initWithContentViewController:popoverContenttime];
    
    popoverControllertime.delegate=self;
    
    [popoverControllertime setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    
    [popoverControllertime presentPopoverFromRect:txtdecharge_heure.frame inView:scrollView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}


#pragma mark - Saving to DB

-(void)confirm :(UIBarButtonItem *)currentBarButton
{
    self.bbbbb=currentBarButton;
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Confirmer"
                                                        message:@"Voulez-vous sauver?" delegate:self
                                              cancelButtonTitle:@"OUI" otherButtonTitles:@"NON", nil];
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex==0)
    {
        [self saveToDataBase:self.bbbbb];
    }
    else if(buttonIndex==1)
    {
        [alertView removeFromSuperview];
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


-(void)saveToDataBase : ( UIBarButtonItem *) currentBarButton
{
    int  nnn;
    NSDateFormatter *forma=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    [ forma setDateFormat:@"dd-MM-YYYY"] ;
    NSString *datestring12 = [forma stringFromDate:now];
    
    NSString * str_img1 = [ self encodeToBase64String:self.imagevw1.image] ;
    NSString * str_img2 = [ self encodeToBase64String:self.imagevw2.image] ;
    NSString * str_img3 = [ self encodeToBase64String:self.imagevw3.image] ;
    NSString * str_img4 = [ self encodeToBase64String:self.imagevw4.image] ;
    NSString * str_img5 = [ self encodeToBase64String:self.imagevw5.image] ;
    NSString * str_img6 = [ self encodeToBase64String:self.imagevw6.image] ;
    NSString * str_img7 = [ self encodeToBase64String:self.imagevw7.image] ;
    NSString * str_img8 = [ self encodeToBase64String:self.imagevw8.image] ;
    NSString * str_img9 = [ self encodeToBase64String:self.imagevw9.image] ;
    NSString * str_img10 = [ self encodeToBase64String:self.imagevw10.image] ;
    NSString * str_img11 = [ self encodeToBase64String:self.imagevw11.image] ;
    NSString * str_img12 = [ self encodeToBase64String:self.imagevw12.image] ;
    
    if (self.IsForUpdating==YES )
    {
        if (self.retrievedarray!=nil)
        {
            NSLog(@"retrive:%@",self.retrievedarray);
            NSLog(@"retrive:%@",(self.retrievedarray)[0][@"consignment_id"]);
            NSString *str=(self.retrievedarray)[0][@"consignment_id"];
            nnn=[str intValue];
        }
        else
        {
            NSString * str_GetCount = @"SELECT consignment_id  FROM consignment" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount];
            nnn =  CurrentCount;
        }
        [self fun_RemoveFromManager:str_DocumentName];
        [ self openPerPagePDF] ;
        NSString *updateSQL = [NSString stringWithFormat:
                               @"update consignment set consignation_m='%@',enterprise='%@',consignee_a='%@',consignee_h='%@',consignee_mn='%@',risques='%@',suivants='%@',consignment='%@',accord='%@',termines_a='%@',termines_h='%@',termines_mn='%@',avis_trav='%@',avis_consi='%@',necessaires='%@',representant='%@',deconsignation_a='%@',deconsignation_h='%@',     deconsignation_mn='%@',authorisation_accord='%@',authorisation_consignation='%@',nom_remplace='%@',nom_remplacant='%@',sign_remplace='%@',sign_remplacant='%@',sign_consignation_a='%@',sign_consignation_h='%@',sign_consignation_mn='%@',delegation_represent='%@',delegation_demande='%@',delegation_charge='%@',d_effectuer_les='%@',delegation_a='%@',delegation_h='%@',delegation_mn='%@',delegation_risques='%@',plus_tard_a='%@',plus_tard_h='%@',plus_tard_mn='%@',le_represendant='%@',le_charge='%@',decharge_represendant='%@',decharge_de_toutes='%@',decharge_de_travaux='%@',decharge_suivant='%@',decharge_duree_de='%@',decharge_date='%@',decharge_heure='%@',decharge_travaux='%@',decharge_le_represendant='%@',doc_modified_date='%@',doc_name='%@' where consignment_id='%ld'", txtConsignation_m.text,txtEnterprise.text,txtConsignee_a.text,txtConsignee_h.text,txtConsignee_mn.text,txtRisques.text,txtSuivants.text,str_img1,str_img2,txtTermines_a.text,txtTermines_h.text,txtTermines_mn.text,str_img3, str_img4,txtNecessaires.text,txtRepresentant.text,txtDeconsignation_a.text,txtDeconsignation_h.text,txtDeconsignation_mn.text,str_img5,str_img6,txtNom_remplace.text,txtNom_remplacant.text,str_img7,str_img8,txtSign_consignation_a.text,txtSign_consignation_h.text,txtSign_consignation_mn.text,txtDelegation_represent.text,txtDelegation_demande.text,txtDelegation_charge.text,txtd_effectuer_les.text,txtDelegation_a.text,txtDelegation_h.text,txtDelegation_mn.text,txtDelegation_risques.text,txtPlus_tard_a.text,txtPlus_tard_h.text,txtPlus_tard_mn.text,str_img9,str_img10,txtdecharge_represendant.text,txtdecharge_de_toutes.text,txtdecharge_de_travaux.text,txtdecharge_suivant.text,txtdecharge_duree_de.text,txtdecharge_date.text,txtdecharge_heure.text,str_img11,str_img12,datestring12,str_DocumentName,(long)nnn];
        
        [[ DBSqlite dbManager] updateStatement:updateSQL];
    }
    else
    {
        if (saved_Into_DB==NO)
        {
            [ self openPerPagePDF] ;
            NSString * str_GetCount = @"SELECT consignment_id FROM consignment" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSString *strQuery = [NSString stringWithFormat:@"insert into consignment(doc_modified_date,doc_created_date,doc_name,consignment_id,consignation_m,enterprise,consignee_a,consignee_h,consignee_mn,risques,suivants,consignment,accord,termines_a,termines_h,termines_mn,avis_trav,avis_consi,necessaires,representant,deconsignation_a,deconsignation_h,deconsignation_mn,authorisation_accord,authorisation_consignation,nom_remplace,nom_remplacant,sign_remplace,sign_remplacant,sign_consignation_a,sign_consignation_h,sign_consignation_mn,delegation_represent,delegation_demande,delegation_charge,d_effectuer_les,delegation_a,delegation_h,delegation_mn,delegation_risques,plus_tard_a,plus_tard_h,plus_tard_mn,le_represendant,le_charge,decharge_represendant,decharge_de_toutes,decharge_de_travaux,decharge_suivant,decharge_duree_de,decharge_date,decharge_heure,decharge_travaux,decharge_le_represendant) values (\"%@\",\"%@\",\"%@\",\"%d\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\", \"%@\", \"%@\",\"%@\")",str_CreatedDate,str_CreatedDate,str_DocumentName,++CurrentCount,txtConsignation_m.text,txtEnterprise.text,txtConsignee_a.text,txtConsignee_h.text,txtConsignee_mn.text,txtRisques.text,txtSuivants.text,str_img1,str_img2,txtTermines_a.text,txtTermines_h.text,txtTermines_mn.text,str_img3, str_img4,txtNecessaires.text,txtRepresentant.text,txtDeconsignation_a.text,txtDeconsignation_h.text,txtDeconsignation_mn.text,str_img5,str_img6,txtNom_remplace.text,txtNom_remplacant.text,str_img7,str_img8,txtSign_consignation_a.text,txtSign_consignation_h.text,txtSign_consignation_mn.text,txtDelegation_represent.text,txtDelegation_demande.text,txtDelegation_charge.text,txtd_effectuer_les.text,txtDelegation_a.text,txtDelegation_h.text,txtDelegation_mn.text,txtDelegation_risques.text,txtPlus_tard_a.text,txtPlus_tard_h.text,txtPlus_tard_mn.text,str_img9,str_img10,txtdecharge_represendant.text,txtdecharge_de_toutes.text,txtdecharge_de_travaux.text,txtdecharge_suivant.text,txtdecharge_duree_de.text,txtdecharge_date.text,txtdecharge_heure.text,str_img11,str_img12];
            [[DBSqlite dbManager]insertStatement:strQuery];
            self.IsForUpdating=YES;
            saved_Into_DB=YES;
        }
        else if(saved_Into_DB==YES)
        {
            NSString * str_GetCount = @"SELECT consignment_id FROM consignment" ;
            int CurrentCount = [[ DBSqlite dbManager] GetArticlesCount:str_GetCount] ;
            NSString *updateSQL = [NSString stringWithFormat:
                                   @"update consignment set consignation_m='%@',enterprise='%@',consignee_a='%@',consignee_h='%@',consignee_mn='%@',risques='%@',suivants='%@',consignment='%@',accord='%@',termines_a='%@',termines_h='%@',termines_mn='%@',avis_trav='%@',avis_consi='%@',necessaires='%@',representant='%@',deconsignation_a='%@',deconsignation_h='%@',deconsignation_mn='%@',authorisation_accord='%@',authorisation_consignation='%@',nom_remplace='%@',nom_remplacant='%@',sign_remplace='%@',sign_remplacant='%@',sign_consignation_a='%@',sign_consignation_h='%@',sign_consignation_mn='%@',delegation_represent='%@',delegation_demande='%@',delegation_charge='%@',d_effectuer_les='%@',delegation_a='%@',delegation_h='%@',delegation_mn='%@',delegation_risques='%@',plus_tard_a='%@',plus_tard_h='%@',plus_tard_mn='%@',le_represendant='%@',le_charge='%@',decharge_represendant='%@',decharge_de_toutes='%@',decharge_de_travaux='%@',decharge_suivant='%@',decharge_duree_de='%@',decharge_date='%@',decharge_heure='%@',decharge_travaux='%@',decharge_le_represendant='%@',doc_modified_date='%@',doc_name='%@' where consignment_id='%d'", txtConsignation_m.text,txtEnterprise.text,txtConsignee_a.text,txtConsignee_h.text,txtConsignee_mn.text,txtRisques.text,txtSuivants.text,str_img1,str_img2,txtTermines_a.text,txtTermines_h.text,txtTermines_mn.text,str_img3, str_img4,txtNecessaires.text,txtRepresentant.text,txtDeconsignation_a.text,txtDeconsignation_h.text,txtDeconsignation_mn.text,str_img5,str_img6,txtNom_remplace.text,txtNom_remplacant.text,str_img7,str_img8,txtSign_consignation_a.text,txtSign_consignation_h.text,txtSign_consignation_mn.text,txtDelegation_represent.text,txtDelegation_demande.text,txtDelegation_charge.text,txtd_effectuer_les.text,txtDelegation_a.text,txtDelegation_h.text,txtDelegation_mn.text,txtDelegation_risques.text,txtPlus_tard_a.text,txtPlus_tard_h.text,txtPlus_tard_mn.text,str_img9,str_img10,txtdecharge_represendant.text,txtdecharge_de_toutes.text,txtdecharge_de_travaux.text,txtdecharge_suivant.text,txtdecharge_duree_de.text,txtdecharge_date.text,txtdecharge_heure.text,str_img11,str_img12,datestring12,str_DocumentName,CurrentCount];
            [[ DBSqlite dbManager] updateStatement:updateSQL];
        }
    }
    if (currentBarButton == pdfButton)
    {
        [ self showEmail] ;
    }
    
}


#pragma mark - PDF Creation

-(IBAction)generatePDF:(id)sender
{
    
    /*    NSString *aFilename = @"Causerie.pdf";
     // Creates a mutable data object for updating with binary data, like a byte array
     //        NSMutableData *pdfData = [NSMutableData data];
     //
     //        // Points the pdf converter to the mutable data object and to the UIView to be converted
     //        UIGraphicsBeginPDFContextToData(pdfData, scrollView.bounds, nil);
     //        UIGraphicsBeginPDFPage();
     //        CGContextRef pdfContext = UIGraphicsGetCurrentContext();
     //
     //
     //        // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
     //
     //        [scrollView.layer renderInContext:pdfContext];
     //
     //        // remove PDF rendering context
     //        UIGraphicsEndPDFContext();
     
     CGRect scrollSize = CGRectMake(0,0,scrollView.contentSize.width,scrollView.contentSize.height);
     
     
     NSMutableData* pdfData = [NSMutableData data];
     UIGraphicsBeginPDFContextToData(pdfData, scrollSize, nil);
     UIGraphicsBeginPDFPage();
     CGContextRef pdfContext = UIGraphicsGetCurrentContext();
     CGContextScaleCTM(pdfContext, 1, 1);
     [scrollView.layer renderInContext:pdfContext];
     UIGraphicsEndPDFContext();
     
     // Retrieves the document directories from the iOS device
     NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
     
     NSString* documentDirectory = [documentDirectories objectAtIndex:0];
     NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:aFilename];
     
     // instructs the mutable data object to write its context to a file on disk
     [pdfData writeToFile:documentDirectoryFilename atomically:YES];
     NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
     
     [self openPath:documentDirectoryFilename];*/
    
    
}



- (void)openPerPagePDF
{
    NSData *pdfData = [ScrollViewToPDF pdfDataOfScrollView:scrollView];
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    NSDate *now=[NSDate date];
    NSLog(@"Now : %@", now) ;
    [ format setDateFormat:@"dd-MM-YYYY_hhmmss"] ;
    NSString * datestring = [format stringFromDate:now];
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    str_DocumentName = [NSString stringWithFormat:@"ATC Attestation de consignation_%@.pdf", datestring]  ;
    path = [docpath stringByAppendingPathComponent:str_DocumentName];
    [pdfData writeToFile:path atomically:NO];
    NSLog(@"tmpDirectory: %@",path);
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

#pragma mark Signature delegate

-(void)sendImgData:(UIImage *)image;
{
    UIImageView *imageView;
    
    if (sig1clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:701];
        sig1clicked=NO;
        
    }
    else if(sig2clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:702];
        sig2clicked=NO;
        
    }
    else if(sig3clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:703];
        sig3clicked=NO;
        
    }
    else if(sig4clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:704];
        sig4clicked=NO;
        
    }
    
    if (sig5clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:705];
        sig5clicked=NO;
        
    }
    else if(sig6clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:706];
        sig6clicked=NO;
        
    }
    else if(sig7clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:707];
        sig7clicked=NO;
        
    }
    else if(sig8clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:708];
        sig8clicked=NO;
        
    }
    
    if (sig9clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:709];
        sig9clicked=NO;
        
    }
    else if(sig10clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:710];
        sig10clicked=NO;
        
    }
    else if(sig11clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:711];
        sig11clicked=NO;
        
    }
    else if(sig12clicked==YES)
    {
        imageView=(UIImageView *)[self.view viewWithTag:712];
        sig12clicked=NO;
        
    }
    
    
    
    else
    {
        
    }
    imageView.image=image;
    
    //imgSign1.image=image;
}




@end
