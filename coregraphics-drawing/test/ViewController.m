//
//  ViewController.m
//  test
//
//  Created by Emir on 16/03/2020.
//  Copyright © 2020 GeneCode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


-(void)updateMainImageWithAngle:(CGFloat)angle andX:(CGFloat)x andY:(CGFloat)y {
    CGFloat bodyW = self.mainImgView.frame.size.width; // 600
    CGFloat bodyH = self.mainImgView.frame.size.height; // 300
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGSize size = CGSizeMake(bodyW, bodyH);
    UIGraphicsBeginImageContextWithOptions(size, NO, screenScale); // 1200 x 600
    CGContextRef cn = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(cn);
    CGContextScaleCTM(cn, 1.0, -1.0);
    CGContextTranslateCTM(cn, x, -y);
    CGContextRotateCTM(cn, -angle);

 //   [self.rectImgView.image drawAtPoint:CGPointMake(-self.rectImgView.image.size.width/2.0, -self.rectImgView.image.size.height/2.0)];
   // [self.rectImgView.image drawInRect:CGRectMake(-self.rectImgView.image.size.width/2.0, -self.rectImgView.image.size.height/2.0, self.rectImgView.image.size.width, self.rectImgView.image.size.height)];
    CGContextDrawImage(cn, CGRectMake(-self.rectImgView.image.size.width/2.0, -self.rectImgView.image.size.height/2.0, self.rectImgView.image.size.width, self.rectImgView.image.size.height), self.rectImgView.image.CGImage);
   
    CGContextRestoreGState(cn);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.mainImgView.image = image;
}

- (IBAction)rotateRect:(id)sender {
    
    UISlider *seg = (UISlider*)sender;
    self.angle = seg.value;
    [self updateMainImageWithAngle:self.angle andX:self.panX andY:self.panY];
 
}
                          
-(IBAction)moveRectX:(id)sender {
    UISlider *seg = (UISlider*)sender;
    self.panX = seg.value;
    [self updateMainImageWithAngle:self.angle andX:self.panX andY:self.panY];
}

-(IBAction)moveRectY:(id)sender {
    UISlider *seg = (UISlider*)sender;
    self.panY = seg.value;
    [self updateMainImageWithAngle:self.angle andX:self.panX andY:self.panY];
    
}
                          
@end
