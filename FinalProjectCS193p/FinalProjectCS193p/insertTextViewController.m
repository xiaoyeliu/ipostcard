//
//  insertTextViewController.m
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/20/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import "insertTextViewController.h"

@interface insertTextViewController ()

@end

@implementation insertTextViewController
@synthesize postcard=_postcard;

-(void)setPostcard:(PostCard *)postcard{

    if(_postcard!=postcard)
    {
        _postcard=postcard;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}
-(void) viewDidAppear:(BOOL)animated{


    [self.navigationController setNavigationBarHidden:NO animated:YES];

}
- (IBAction)Preview:(id)sender {
 
   self.previewLabel.numberOfLines = 0;
   self.previewLabel.font = [UIFont fontWithName:@"Chalkduster" size:16.0];
    self.previewLabel.text=self.textEnter.text;

}
- (IBAction)HideKeyboard:(id)sender {
    
     [self.textEnter resignFirstResponder];
}
- (IBAction)insertText:(id)sender {
    
    self.postcard.cardBack.text=self.previewLabel.text;
    [self performSegueWithIdentifier:@"textback" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

if([segue.identifier isEqualToString:@"textback"])
{
    [segue.destinationViewController setPostcard:self.postcard];
}

}


@end
