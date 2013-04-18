//
//  EditingboardViewController.m
//  FinalProjectCS193p
//
//  Created by XIAOYE LIU on 3/14/13.
//  Copyright (c) 2013 XIAOYE LIU. All rights reserved.
//

#import "EditingboardViewController.h"
#import "FrameSelectionViewController.h"

@interface EditingboardViewController ()

@end

@implementation EditingboardViewController
@synthesize tabbar=_tabbar;
@synthesize frameImg=_frameImg;
@synthesize stampImg=_stampImg;
@synthesize postcard=_postcard;
@synthesize startPoint=_startPoint;
@synthesize textView=_textView;
@synthesize ifentertext=_ifentertext;

-(void) setPostcard:(PostCard *)postcard{

    if(_postcard!=postcard){
        _postcard=postcard;
    }
}

-(void) setFrameImg:(UIImage *)frameImg
{
    if (_frameImg!=frameImg) {
        _frameImg=frameImg;
    }

}
-(void) setStampImg:(UIImage *)stampImg
{
    if(_stampImg!=stampImg){
 
        _stampImg=stampImg;
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    context = [CIContext contextWithOptions:nil];
    self.userwords.numberOfLines=0;
    self.userwords.font = [UIFont fontWithName:@"Chalkduster" size:16.0];


}

-(void) setUpTabbar{

    self.home.tag=0;
    self.Insert.tag=1;
    self.Effects.tag=2;
    self.Text.tag=3;
    self.Sound.tag=4;
    self.Save.tag=5;
    self.More.tag=6;
    
    NSArray *tabBarItemArray = [[NSArray alloc] initWithObjects: self.home,self.Insert,self.Effects,self.Text,self.Sound,self.Save,self.More, nil];
    [self.tabbar  setItems: tabBarItemArray];
    self.tabbar.delegate =self;
}



-(void)viewDidAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self setUpTabbar];
    [self drawbackGround];

}

-(void) drawbackGround{
    
    UIImage *image;
    NSURL *imageurl;
    
    if(self.postcard.isFront){
        
        
        if(self.postcard.cardFront.bkgrdImg==nil){  //initial state
            image=(UIImage *)[self.postcard.originalInfo valueForKey:UIImagePickerControllerOriginalImage];
            imageurl=(NSURL *) [self.postcard.originalInfo valueForKey:UIImagePickerControllerMediaURL];
            self.imageView.image=image;
            self.postcard.cardFront.bkgrdImg=image;
        }else{
        
            self.imageView.image=self.postcard.cardFront.bkgrdImg;
            [self drawFrame:self.postcard.cardFront];
            [self addStamp:self.postcard.cardFront];
            [self addLabel:self.postcard.cardFront];
            
        }
        self.cardSides.titleLabel.text=@"CardBack";
    }
    if(!self.postcard.isFront){ //return to the back side
    
        
        self.imageView.image=self.postcard.cardBack.bkgrdImg;
        [self drawFrame:self.postcard.cardBack];
        [self addStamp:self.postcard.cardBack];
        [self addLabel:self.postcard.cardBack];
        
     self.cardSides.titleLabel.text=@"CardFront";
    }
}



-(void) resetImage{

    self.postcard.isFront=YES;
    self.postcard.cardFront.bkgrdImg=nil;
    self.postcard.cardFront.frame=nil;
    self.postcard.cardFront.stamp=nil;
    self.postcard.cardBack.bkgrdImg=self.postcard.originalBack;
    self.postcard.cardBack.frame=nil;
    self.postcard.cardBack.stamp=nil;
    [self drawbackGround];



}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item  ///tab tags
{
    
    self.ifentertext=NO;
    if(item.tag==0)
    {
        
        alert=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Are you sure leaving the current Postcard and go back to Home Page without saving?" delegate:self cancelButtonTitle:@"No, stay here" otherButtonTitles:@"Yes, back to Home", nil];
        alert.tag=1;
        [alert show];
    }
    
    if(item.tag==1)
    {
        
        [self performSegueWithIdentifier:@"frame" sender:self];
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
    }
    
    if(item.tag==2)
    {
        action= [[UIActionSheet alloc] initWithTitle:@"Apply Filter" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Brown Filter" otherButtonTitles:@"Matrix Filter", @"Sharp Filter",nil];
        action.tag=1;
        action.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [action showInView:self.view];
    
    }
    
    if(item.tag==3)
    {
        
        [self performSegueWithIdentifier:@"text" sender:self];
        
    }
    
    
    if(item.tag==4)
    {
        
        [self performSegueWithIdentifier:@"sound" sender:self];
        
    }
    
    
    
    
    if(item.tag==5)
    {
        action= [[UIActionSheet alloc] initWithTitle:@"File Operations" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Reset Image" otherButtonTitles:@"Save PostCard", nil];
        action.tag=2;
        action.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [action showInView:self.view];
        
    }

    
    if(item.tag==6)
    {
        
        [self performSegueWithIdentifier:@"More" sender:self];
        
    }
    
    
    
}



-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if(actionSheet.tag==1)
    {
        if(buttonIndex==0)
        {
            [self applyFilter:1 Value:0.8 ];
        }
        if(buttonIndex ==1)
        {
            [self applyFilter:2 Value:0.8 ];
        }
    
    }
    if(actionSheet.tag==2)
    {
    
        if(buttonIndex==0)
        {
            [self resetImage];
        
        }
        if(buttonIndex==1)
        {
          alert=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Are you sure saving the current PostCard" delegate:self cancelButtonTitle:@"No, stay here" otherButtonTitles:@"Yes, save it", nil];
            alert.tag=5;
            [alert show];
        
        }
    
    
    
    }

}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex //save images
{
    if(alertView.tag==1)
    {
        if(buttonIndex==1)
        {
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        }
    }
    if(alertView.tag==5)
    {
        
        if(buttonIndex ==1)///////////saving image method here!!!!
        {
            UIImage* im2=[self mergeAlldrawings];
            UIImageWriteToSavedPhotosAlbum(im2, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
    }
    
}

-(void) addLabel:(CardSidesView *) cardside{

    if(cardside.text!=nil){
        self.userwords.text=self.postcard.cardBack.text;
    }
    else{
        self.userwords.text=nil;
    }
    
}

-(void) addStamp:(CardSidesView *) cardside{

    if(cardside.stamp!=nil)
    {
    UIImage * image = cardside.stamp;
  //  UIImage *scaledImage =[UIImage imageWithCGImage:[image CGImage] scale:(image.scale/4.0) orientation:(image.imageOrientation)];
    self.stampView.image=image;
  //  [self.view addSubview:self.stampView];
    
    }
}
-(void) drawFrame: (CardSidesView *) cardside{
    if(cardside.frame!=nil)
    {
    //CGRect rect = CGRectMake(0.0, 0.0, self.imageView.frame.size.width, self.imageView.frame.size.height);
    self.frameView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,self.imageView.frame.size.width,self.imageView.frame.size.height)];
    UIImage * image = cardside.frame;
    self.frameView.image=image;
    [self.view addSubview:self.frameView];
   // [self.frameView removeFromSuperview];
    }
}




- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error)
        alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                           message:@"Unable to save image to Photo Album."
                                          delegate:self cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil];
    else
        alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Image saved to Photo Album."
                                          delegate:self cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil];
    [alert show];
    
}





-(void) applyFilter:(int)type Value:(float)value
{
    CIImage *startingImage = [[CIImage alloc] initWithImage:self.imageView.image];
    UIImageOrientation originalOrientation = self.imageView.image.imageOrientation;
    CGFloat originalScale = self.imageView.image.scale;
    
    CIImage *filteredImage;
    
    if(type==1)
    {
        brownfilter = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:kCIInputImageKey,startingImage, @"inputIntensity",[NSNumber numberWithFloat:value], nil];
        filteredImage = [brownfilter outputImage];
    }
    
    if(type==2)
    {
        
        matrixfilter = [CIFilter filterWithName:@"CIColorMatrix"];
        [matrixfilter setDefaults];
        [matrixfilter setValue:startingImage forKey:kCIInputImageKey];
        [matrixfilter setValue:[CIVector vectorWithX:1 Y:1 Z:1 W:1] forKey:@"inputAVector"];
        filteredImage = [matrixfilter outputImage];
    }
    
    
    CGImageRef cgImage= [context createCGImage:filteredImage fromRect:[filteredImage extent]];
    self.imageView.image=[UIImage imageWithCGImage:cgImage scale:originalScale orientation:originalOrientation];
    if(self.postcard.isFront==YES)
    {
        self.postcard.cardFront.bkgrdImg=self.imageView.image;
    }else{
        self.postcard.cardBack.bkgrdImg=self.imageView.image;
    }
    CGImageRelease(cgImage);
}

-(UIImage *) mergeDrawings{

    CGSize size=CGSizeMake(self.imageView.frame.size.width,self.imageView.frame.size.height);
    UIGraphicsBeginImageContext(size);
    [self.imageView.image drawInRect:self.imageView.frame];
    if(self.frameView.image!=nil)
    {
        [self.frameView.image drawInRect:self.frameView.frame blendMode:kCGBlendModeNormal alpha:1];
    }
    if(self.stampView.image!=nil)
    {
        [self.stampView.image drawInRect:self.stampView.frame blendMode:kCGBlendModeNormal alpha:1];
        
    }
    if(self.indicator==1)
    {
        [self.userwords drawTextInRect:self.userwords.frame];
    }
   
/////////////////need to make sure how to do textview!!!!!!!////////////////////////////
    self.outputImage= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData* imdata =  UIImagePNGRepresentation (self.outputImage);
    UIImage* im2 = [UIImage imageWithData:imdata];
    self.outputImage=im2;
    return im2;

}

-(UIImage *) mergeAlldrawings{
    
    CGSize size=CGSizeMake(2*self.imageView.frame.size.width,self.imageView.frame.size.height);
    UIGraphicsBeginImageContext(size);

    self.imageView.image=self.postcard.cardFront.bkgrdImg;
    if(self.postcard.cardFront.frame!=nil) {self.frameView.image=self.postcard.cardFront.frame;}else{self.frameView.image=nil;}

    if(self.postcard.cardFront.stamp!=nil) {self.stampView.image=self.postcard.cardFront.stamp;}else{self.stampView.image=nil;}
    self.indicator=0;

    UIImage *im=[self mergeDrawings];
    [im drawInRect:CGRectMake(0, 0,self.imageView.frame.size.width,self.imageView.frame.size.height)];
    
    
    self.imageView.image=self.postcard.cardBack.bkgrdImg;
    if(self.postcard.cardBack.frame!=nil) {self.frameView.image=self.postcard.cardBack.frame;}else{self.frameView.image=nil;}
    if(self.postcard.cardBack.stamp!=nil) {self.stampView.image=self.postcard.cardBack.stamp;}else{self.stampView.image=nil;}
    self.indicator=1;
    UIImage *im1=[self mergeDrawings];
  
    [im1 drawInRect:CGRectMake(self.imageView.frame.size.width, 0,self.imageView.frame.size.width,self.imageView.frame.size.height)];
    
    self.outputImage= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData* imdata =  UIImagePNGRepresentation (self.outputImage);
    UIImage* im2 = [UIImage imageWithData:imdata];
    self.outputImage=im2;
    return im2;

}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
//    if(self.ifentertext==YES){
//    UITouch *mytouch=[touches anyObject];
//    startPoint = [mytouch locationInView:self.view];
//    
//    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(startPoint.x, startPoint.y, startPoint.x+200, startPoint.y+100)];//self.view.frame];
//    self.textView.textColor = [UIColor blackColor];
//    self.textView.font = [UIFont fontWithName:@"Chalkduster" size:18.0];
//    self.textView.delegate = self;
//    self.textView.backgroundColor = [UIColor clearColor];
//    self.textView.text = @"Hello World";
//    self.textView.returnKeyType = UIReturnKeyDefault;
//    self.textView.keyboardType = UIKeyboardTypeDefault;
//    self.textView.scrollEnabled = YES;
//    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//    [self.view addSubview: self.textView];
//    }

}


-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *mytouch=[touches anyObject];
    startPoint = [mytouch locationInView:mytouch.view];
    self.stampView.center=CGPointMake(startPoint.x, startPoint.y);
    self.frameView.center=CGPointMake(startPoint.x, startPoint.y);
    
    //self.textView.center=CGPointMake(startPoint.x, startPoint.y);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text

{
    
    if ([text isEqualToString:@"\n"]) {
        
        [self.textView resignFirstResponder];
        return NO;
    }
    return YES;
    
}




-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"frame"])
    {
        [segue.destinationViewController setPostcard:self.postcard];
    }
    
    if([segue.identifier isEqualToString:@"text"])
    {
        [segue.destinationViewController setPostcard:self.postcard];
    }
    
    if([segue.identifier isEqualToString:@"More"])
    {
    
        self.outputImage=[self mergeAlldrawings];
        self.postcard.finalImage=self.outputImage;
        [segue.destinationViewController setPostcard:self.postcard];
    }
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}




- (IBAction)flipCard:(UIButton *)sender {
    
    if(![sender isSelected])//entering the back of the card
    {
        self.postcard.isFront=NO;

        self.imageView.image=self.postcard.cardBack.bkgrdImg;//self.postcard.cardBack.bkgrdImg
        if(self.postcard.cardBack.frame!=nil) {self.frameView.image=self.postcard.cardBack.frame;}else{self.frameView.image=nil;}
        if(self.postcard.cardBack.stamp!=nil) {self.stampView.image=self.postcard.cardBack.stamp;}else{self.stampView.image=nil;}
        if(self.postcard.cardBack.text!=nil) {self.userwords.text=self.postcard.cardBack.text;}else{self.userwords.text=nil;}
        
        sender.titleLabel.text=@"CardBack";
        sender.selected = ![sender isSelected];
        
    }
    else{      //to the front of the card
    
         self.postcard.isFront=YES;
        
        self.imageView.image=self.postcard.cardFront.bkgrdImg;
        if(self.postcard.cardFront.frame!=nil) {self.frameView.image=self.postcard.cardFront.frame;}else{self.frameView.image=nil;}
        if(self.postcard.cardFront.stamp!=nil) {self.stampView.image=self.postcard.cardFront.stamp;}else{self.stampView.image=nil;}
        if(self.postcard.cardFront.text!=nil) {self.userwords.text=self.postcard.cardFront.text;}else{self.userwords.text=nil;}
        
        
        sender.titleLabel.text=@"CardFront";
        sender.selected = ![sender isSelected];
        
    }
    
    
}
@end
