//
//  insertTextViewController.h
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/20/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditingboardViewController.h"

@interface insertTextViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *previewLabel;
- (IBAction)Preview:(id)sender;
@property (nonatomic) NSString *userwords;
- (IBAction)HideKeyboard:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *textEnter;
- (IBAction)insertText:(id)sender;
@property (strong, nonatomic) PostCard *postcard;
@end
