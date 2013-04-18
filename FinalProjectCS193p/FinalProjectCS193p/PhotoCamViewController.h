//
//  PhotoCamViewController.h
//  final
//
//  Created by XIAOYE LIU on 3/08/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostCard.h"
@interface PhotoCamViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
	
	//UIImagePickerController *picker;
}

- (IBAction)CameraRollbtn:(id)sender;
- (IBAction)TakePhoto:(id)sender;
@property (strong, nonatomic) NSDictionary *photo;
@property (nonatomic) NSInteger selectionmode;
@property (strong,nonatomic) PostCard* postcard;

@end
