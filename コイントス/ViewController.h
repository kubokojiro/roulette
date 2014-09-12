//
//  ViewController.h
//  コイントス
//
//  Created by 久保　虎次郎 on 2014/06/20.
//  Copyright (c) 2014年 久保　虎次郎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *imageView;
    IBOutlet UIImageView *imageView2;
    IBOutlet UILabel *label;
    int time;
    int numbers;
}
-(IBAction)start;
-(IBAction)stop;
-(IBAction)kill;

-(void)stopAnimating;
@end
