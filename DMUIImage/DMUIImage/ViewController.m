//
//  ViewController.m
//  DMUIImage
//
//  Created by lbq on 2017/9/13.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+DM.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *origalImageView;
@property (weak, nonatomic) IBOutlet UIImageView *cropedImageView;
@property (weak, nonatomic) IBOutlet UIImageView *scaleImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self demo];
}

- (void)demo
{
    CGSize maxSize = CGSizeMake(200, 200);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpg"];
    UIImage *origal = [UIImage imageWithContentsOfFile:path];
    self.origalImageView.image = origal;
    UIImage *newImage = [UIImage imageWithCGImage:origal.CGImage scale:origal.scale*2 orientation:origal.imageOrientation];
    
    UIImage *cropedImage = [newImage cropImageToMaxSize:maxSize scale:YES];
    self.cropedImageView.image = cropedImage;
    
    UIImage *scaleImage = [newImage cropImageToMaxSize:maxSize scale:NO];
    self.scaleImageView.image = scaleImage;
    NSLog(@"%@---\n%@---\n%@----\n%@-----",origal,newImage,cropedImage,scaleImage);
}
@end
