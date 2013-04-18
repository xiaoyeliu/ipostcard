//
//  ImageViewController.h
//  Shutterbug
//
//  Created by CS193p Instructor.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImageViewController : UIViewController

- (IBAction)Done:(id)sender;
@property (nonatomic,strong) UIImage *photo;


@end
