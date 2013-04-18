//
//  SharingViewController.h
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/18/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostCard.h"
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>
@interface SharingViewController : UITableViewController <MFMailComposeViewControllerDelegate>


@property (nonatomic,strong) PostCard *postcard;
- (IBAction)Finishsharing:(id)sender;

@end
