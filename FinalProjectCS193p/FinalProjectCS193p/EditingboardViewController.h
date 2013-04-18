//
//  EditingboardViewController.h
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/14/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostCard.h"

@interface EditingboardViewController : UIViewController <UITabBarDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UITextViewDelegate>
{
    UIAlertView *alert;
    UIActionSheet *action;
    CIContext *context;
    CIFilter *brownfilter;
    CIFilter *matrixfilter;
    CIFilter *sharpfilter;
    CGPoint startPoint;
    UITextView *textView;
    
    
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UIImageView *frameView;
@property (strong, nonatomic) IBOutlet UIImageView *stampView;
@property (strong, nonatomic) IBOutlet UITextView *textView;



@property (strong, nonatomic) UIImage *frameImg;
@property (strong, nonatomic) UIImage *stampImg;
@property (strong, nonatomic) PostCard *postcard;




@property (strong, nonatomic) IBOutlet UITabBarItem *home;
@property (strong, nonatomic) IBOutlet UITabBar *tabbar;
@property (strong, nonatomic) IBOutlet UITabBarItem *Insert;
@property (strong, nonatomic) IBOutlet UITabBarItem *Effects;
@property (strong, nonatomic) IBOutlet UITabBarItem *Text;
@property (strong, nonatomic) IBOutlet UITabBarItem *Sound;
@property (strong, nonatomic) IBOutlet UITabBarItem *Save;
@property (strong, nonatomic) IBOutlet UITabBarItem *More;



@property (strong, nonatomic) IBOutlet UILabel *userwords;
@property (nonatomic) BOOL ifentertext;
@property CGPoint startPoint;
@property (strong, nonatomic) UIImage *outputImage;
- (IBAction)flipCard:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *cardSides;
@property (nonatomic) int indicator;






-(void) addLabel:(CardSidesView *) cardside;
-(void) applyFilter:(int)type Value:(float)value;
-(void) drawFrame:(CardSidesView *)cardside;
-(void) addStamp:(CardSidesView *)cardside;
-(void) drawbackGround;
-(void) setUpTabbar;
-(void) resetImage;
-(UIImage *) mergeAlldrawings;

@end
