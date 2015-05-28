//
//  SchemaVC.m
//  Causerie
//
//  Created by Saravana on 30/03/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import "SchemaVC.h"
#import <QuartzCore/QuartzCore.h>


@interface SchemaVC ()

@end

@implementation SchemaVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[scrollView setContentSize:(CGSizeMake(768, 3200))];
    
    UIBarButtonItem * btnItem = [[ UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:Nil];
    self.navigationItem.backBarButtonItem = btnItem ;
    
    str_DocumentName = @"Schema" ;
    self.title = str_DocumentName ;
    
    imagesig.layer.borderWidth=0.5;
    imagesig.layer.borderColor=[[UIColor blackColor]CGColor];
    [imagesig setImage:[UIImage imageNamed:@"grids.gif"]];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)donebutclicked:(id)sender
{
    [self.delegate sendschImgData:imagesig.image];
    
    [self.navigationController popViewControllerAnimated:YES];

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
