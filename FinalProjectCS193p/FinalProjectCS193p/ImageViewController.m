//
//  ImageViewController.m
//  Shutterbug
//
//  Created by CS193p Instructor.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "ImageViewController.h"
//#import "AttributedStringViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation ImageViewController
@synthesize photo=_photo;
-(void) setPhoto:(UIImage *)photo{

if(_photo!=photo)
{
    _photo=photo;
}
}


- (void)resetImage
{
    
    if (self.scrollView) {
        
        self.scrollView.contentSize = CGSizeZero;
        self.imageView.image = nil;
        UIImage *image = self.photo;
        
        
        if (image) {
            self.scrollView.zoomScale = 1.0;
            self.scrollView.contentSize = image.size;
            self.imageView.image = image;
            self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
           
        }
    }
    
}
    
    
- (UIImageView *)imageView
{
        if (!_imageView) _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        return _imageView;
}
    
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
        return self.imageView;
}
    
    - (void)viewDidLoad
    {
        [super viewDidLoad];
        [self.scrollView addSubview:self.imageView];
        self.scrollView.minimumZoomScale = 0.2;
        self.scrollView.maximumZoomScale = 5.0;
        self.scrollView.delegate = self;
        [self resetImage];
    }
    
- (IBAction)Done:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}

    
@end
