//
//  imageSelectionViewController.m
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/16/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import "imageSelectionViewController.h"
#import "EditingboardViewController.h"

@interface imageSelectionViewController ()

@end

@implementation imageSelectionViewController
@synthesize photoinfo=_photoinfo;
@synthesize imageView=_imageView;

-(void) setPhoto:(NSDictionary *)photoinfo{
    
    if (_photoinfo!=photoinfo) {
        _photoinfo=photoinfo;
    }

}

-(void)viewDidAppear:(BOOL)animated
{
    UIImage *image;
    NSURL *imageurl;
    image=(UIImage *)[self.photoinfo valueForKey:UIImagePickerControllerOriginalImage];
    imageurl=(NSURL *) [self.photoinfo valueForKey:UIImagePickerControllerMediaURL];
    
    self.imageView.image=image;

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)CameraRollBtn:(id)sender {
   [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)Confirmbtn:(id)sender {
     [self performSegueWithIdentifier:@"Chosen" sender:self];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Chosen"])
    {
        
        [segue.destinationViewController setPhotoinfo:self.photoinfo];
    }
    
    
}







@end
