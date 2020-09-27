//
//  ViewController.h
//  test
//
//  Created by Emir on 16/03/2020.
//  Copyright © 2020 GeneCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *mainImgView;
@property (weak, nonatomic) IBOutlet UIImageView *rectImgView;
@property (nonatomic) CGFloat angle, panX, panY;

- (IBAction)rotateRect:(id)sender;
-(IBAction)moveRectX:(id)sender;
-(IBAction)moveRectY:(id)sender;
@end

