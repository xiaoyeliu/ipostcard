//
//  imageSelectionViewController.h
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/16/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imageSelectionViewController : UIViewController

@property (strong,nonatomic) NSDictionary *photoinfo;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)CameraRollBtn:(id)sender;
- (IBAction)Confirmbtn:(id)sender;

@end
