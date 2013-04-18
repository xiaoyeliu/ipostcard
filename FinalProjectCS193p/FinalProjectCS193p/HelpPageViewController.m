//
//  HelpPageViewController.m
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/20/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import "HelpPageViewController.h"

@interface HelpPageViewController ()

@end

@implementation HelpPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    //[self setGoback:nil];
    [super viewDidUnload];
}
- (IBAction)goback:(id)sender {
    
    [self performSegueWithIdentifier:@"back" sender:self];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqualToString:@"back"]){
    
        [self.navigationController popToRootViewControllerAnimated:YES];
    }

}


@end
