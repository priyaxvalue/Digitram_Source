//
//  SchemaVC.h
//  Causerie
//
//  Created by Saravana on 30/03/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SchemaVCDelegate <NSObject>

-(void)sendschImgData:(UIImage *)image;

@end


@interface SchemaVC : UIViewController

{
    IBOutlet UIScrollView *scrollView;
    
    IBOutlet UIImageView *imagesig;
    
    IBOutlet UIButton *donebut;
    
    NSString *str_DocumentName;
    
    NSData *sigdata;
    
    IBOutlet UIImage *image1;
    
}

@property(nonatomic, weak) id <SchemaVCDelegate> delegate;


-(IBAction)donebutclicked:(id)sender;



@end
