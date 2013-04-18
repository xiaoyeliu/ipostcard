//
//  AlbumViewController.m
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/20/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import "AlbumViewController.h"

@interface AlbumViewController ()

@end

@implementation AlbumViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIImagePickerController *picker;
    picker= [[UIImagePickerController alloc] init];
    
    picker.delegate=self;
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{

    UIImagePickerController *picker;
    picker= [[UIImagePickerController alloc] init];
    
    picker.delegate=self;
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];


}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *image=  (UIImage *)[info valueForKey:UIImagePickerControllerOriginalImage];
    self.photo=image;
    [self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"showimage" sender:self];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqualToString:@"showimage"]){
    
        [segue.destinationViewController setPhoto:self.photo];
    
    }

}



@end
