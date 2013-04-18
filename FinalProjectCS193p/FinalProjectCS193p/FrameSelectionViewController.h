//
//  FrameSelectionViewController.h
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/18/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostCard.h"

@interface FrameSelectionViewController : UICollectionViewController <UICollectionViewDelegate,UICollectionViewDataSource>
{

    NSArray *frameImage;
    NSArray *stampImage;


}

@property (nonatomic) int selectedIndex;
@property (strong,nonatomic) UIImage *image;
@property (strong,nonatomic) PostCard *postcard;

@end
