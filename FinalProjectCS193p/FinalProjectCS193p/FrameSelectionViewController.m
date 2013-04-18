//
//  FrameSelectionViewController.m
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/18/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import "FrameSelectionViewController.h"
#import "EditingboardViewController.h"
#import "InsertImage.h"

@interface FrameSelectionViewController ()

@end

@implementation FrameSelectionViewController
@synthesize selectedIndex=_selectedIndex;


-(void)setPostcard:(PostCard *)postcard{

    if(_postcard!=postcard)
    {
        _postcard=postcard;
    }


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Frame and Stamp";
    
    frameImage= [[NSArray alloc] initWithObjects:@"frame1.jpg",@"frame2.png",@"frame3.png",@"Frame4.png",nil];
    
    
    stampImage= [[NSArray alloc] initWithObjects:@"stamp1.jpg",@"stamp2.jpg",@"stamp3.jpg",@"stamp4.png",@"stamp5.jpg",@"stamp6.jpg",@"stamp7.jpg",nil];

    
    
}

-(void) viewDidAppear:(BOOL)animated
{

    [[self navigationController] setNavigationBarHidden:NO animated:YES];


}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{   
    return 2;
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if(section==0)
    {
        return [frameImage count];
    
    }
    else
    {
    
        return [stampImage count];
    }

}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    InsertImage *collectioncell= (InsertImage *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if(indexPath.section==0)
    {
    
        collectioncell.imageView.image = [UIImage imageNamed:[frameImage objectAtIndex:indexPath.item]];
        
    }
    
    if(indexPath.section==1)
    {
        
        collectioncell.imageView.image = [UIImage imageNamed:[stampImage objectAtIndex:indexPath.item]];
        
    }
    
    return collectioncell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section==0)
    {
        self.image= [UIImage imageNamed:[frameImage objectAtIndex:indexPath.item]];
        self.selectedIndex=0;
        
        if(self.postcard.isFront==YES) {
            
            self.postcard.cardFront.frame=self.image;
        }else{
            
            self.postcard.cardBack.frame=self.image;
        }
        
        [self performSegueWithIdentifier:@"sendbackFrame" sender:self];
    }
    
    if(indexPath.section==1)
    {
        
       self.image= [UIImage imageNamed:[stampImage objectAtIndex:indexPath.item]];
        self.selectedIndex=1;
        if(self.postcard.isFront==YES) {
            self.postcard.cardFront.stamp=self.image;
        }else{
            
            self.postcard.cardBack.stamp=self.image;
        }
        [self performSegueWithIdentifier:@"sendbackFrame" sender:self];
    }
    
    
    

}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"sendbackFrame"])
    {
        
        [segue.destinationViewController setPostcard:self.postcard];
        if(self.selectedIndex ==0)
        {
            [segue.destinationViewController setFrameImg:self.image];
        }
        if(self.selectedIndex ==1)
        {
            
            [segue.destinationViewController setStampImg:self.image];
        }
        
    }

}



@end
