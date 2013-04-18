//
//  PhotoCamViewController.m
//  final
//
//  Created by XIAOYE LIU on 3/08/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import "PhotoCamViewController.h"
#import "imageSelectionViewController.h"

@interface PhotoCamViewController ()

@end

@implementation PhotoCamViewController

@synthesize photo=_photo;
@synthesize selectionmode=_selectionmode;
@synthesize postcard=_postcard;

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    self.postcard=[[PostCard alloc] init];
    self.postcard.cardFront=[[CardSidesView alloc] init];
    self.postcard.cardBack=[[CardSidesView alloc] init];
    
    self.postcard.isFront=YES;
    self.postcard.originalBack=[UIImage imageNamed:@"card.png"];
    self.postcard.cardBack.bkgrdImg=self.postcard.originalBack;

    
    
}


- (IBAction)TakePhoto:(id)sender {
    
    UIImagePickerController *picker;
    picker= [[UIImagePickerController alloc] init];
    
    picker.delegate=self;
    picker.sourceType=UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
}




- (IBAction)CameraRollbtn:(id)sender {
    
    UIImagePickerController *picker;
    picker= [[UIImagePickerController alloc] init];
    
    picker.delegate=self;
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    self.postcard.originalInfo=info;
    
    [self performSegueWithIdentifier:@"Select Photo" sender:self];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Select Photo"])
    
    [segue.destinationViewController setPostcard:self.postcard];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
