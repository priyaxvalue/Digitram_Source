//
//  ArchivesViewController.h
//  Causerie
//
//  Created by Balladonia iTechnologies on 16/03/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface ArchivesViewController : UIViewController < UITableViewDataSource , UITableViewDelegate , UIAlertViewDelegate,UIWebViewDelegate>
{
//    MBProgressHUD *hud;
    NSArray * array_Ids ;
    NSArray * array_Tables ;
    NSMutableArray * array_FullDocNames ;
    NSString * path , * str_DocumentName;
}

@property (nonatomic, strong) NSMutableArray *retrarray;
@property ( nonatomic) int currentIndex ;
@property ( nonatomic, strong) UITableView *tbl_Archives;
@property ( strong, nonatomic) NSMutableArray * array_DocNames  ;
@end
