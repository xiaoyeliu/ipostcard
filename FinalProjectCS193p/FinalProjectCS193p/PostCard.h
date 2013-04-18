//
//  PostCard.h
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/18/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardSidesView.h"

@interface PostCard : NSObject
@property (strong,nonatomic) CardSidesView* cardFront;
@property (strong,nonatomic) CardSidesView* cardBack;
@property (strong,nonatomic) NSDictionary *originalInfo;
@property (strong,nonatomic) UIImage* originalBack;
//@property (strong,nonatomic) NSString * text;
@property (strong, nonatomic) UIImage *finalImage;
@property BOOL isFront;
@end
