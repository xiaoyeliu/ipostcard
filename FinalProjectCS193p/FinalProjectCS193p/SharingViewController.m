//
//  SharingViewController.m
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/18/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import "SharingViewController.h"

@interface SharingViewController ()

@end

@implementation SharingViewController
@synthesize postcard=_postcard;

-(void) setPostcard:(PostCard *)postcard{

    if(_postcard!=postcard)
    {
       _postcard=postcard;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   /// self.postcard.finalImage= [UIImage imageNamed:@"stamp7.jpg"];

}

-(void) viewDidAppear:(BOOL)animated{

    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.tableView reloadData];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(indexPath.row==0)
    {
    cell.textLabel.text= @"Share to Facebook";
    }
    
    if(indexPath.row==1)
    {
        cell.textLabel.text= @"Share via Email";
    }
    
    
    if(indexPath.row==2)
    {
        cell.textLabel.text= @"Share via Sina Weibo";
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
            SLComposeViewController *facebook=[[SLComposeViewController alloc] init];
            facebook= [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            [facebook setInitialText:@"Testing, Posting this image from Xiaoye's App :)"];
            [facebook addImage:self.postcard.finalImage];
            [self presentViewController:facebook animated:YES completion:nil];
            [facebook setCompletionHandler:^(SLComposeViewControllerResult result)
             {
                 
                 NSString *outputmessage;
                 if(result==SLComposeViewControllerResultCancelled)
                 {
                     outputmessage=@"Operation Cancelled :(";
                     
                 }
                 if(result==SLComposeViewControllerResultDone)
                 {
                     
                     outputmessage=@"Sucessfully Posted:)!";
                     
                 }
                 
                 UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Facebook" message:outputmessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                 [alert show];
             }];
        }
        else{
        
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Facebook" message:@"Service Not Available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        
        }
        

    }
    
    if(indexPath.row==1)
    {
    
        MFMailComposeViewController *mail=[[MFMailComposeViewController alloc] init];
        [mail setMailComposeDelegate:self];
        NSArray *emails= [[NSArray alloc] initWithObjects:@"xiaoyeliu0507@gmail.com", nil ];
        NSString *message = @"testing email";
        //[[self mytextview]text];
        [mail setMessageBody:message isHTML:NO];
        [mail setToRecipients:emails];
        NSData *myData = UIImagePNGRepresentation(self.postcard.finalImage);
        [mail addAttachmentData:myData mimeType:@"image/png" fileName:@"MyPostCard.png"];
        [mail setSubject:@"Testing email from my app"];
        [self presentViewController:mail animated:YES completion:nil];
        
        
        
    }
    
    if(indexPath.row==2)
    {
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]){
            
            SLComposeViewController *weibo=[[SLComposeViewController alloc] init];
            weibo= [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
            
            [weibo setInitialText:@"Testing, Posting this image from Xiaoye's App :)"];
            [weibo addImage:self.postcard.finalImage];
            [self presentViewController:weibo animated:YES completion:nil];
        
            [weibo setCompletionHandler:^(SLComposeViewControllerResult result)
             {
             
                 NSString *outputmessage;
                 if(result==SLComposeViewControllerResultCancelled)
                 {
                 
                     outputmessage=@"Operation Cancelled :(";
                 
                 }
                 if(result==SLComposeViewControllerResultDone)
                 {
                     
                     outputmessage=@"Sucessfully Posted:)!";
                     
                 }
                 
                 UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sina Weibo" message:outputmessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                 [alert show];
             }];
        }else{
        
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Sina Weibo" message:@"Service Not Available" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
    
    
    }
    
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Finishsharing:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
