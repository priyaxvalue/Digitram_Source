//
//  SignaVC.h
//  Causerie
//
//  Created by Saravana on 27/03/15.
//  Copyright (c) 2015 Balladonia iTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SignaVCDelegate <NSObject>

-(void)sendImgData:(UIImage *)image;

@end

@interface SignaVC : UIViewController

{
    IBOutlet UIScrollView *scrollView;
    
    IBOutlet UIImageView *imagesig;
    
    IBOutlet UIButton *donebut;
    
    NSString *str_DocumentName;
    
    NSData *sigdata;
    
    IBOutlet UIImage *image1;
    
}

@property(nonatomic, weak) id <SignaVCDelegate> delegate;


-(IBAction)donebutclicked:(id)sender;

@end
