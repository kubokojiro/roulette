//
//  ViewController.m
//  コイントス
//
//  Created by 久保　虎次郎 on 2014/06/20.
//  Copyright (c) 2014年 久保　虎次郎. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //ルーレット用
    CALayer *layer = imageView.layer;
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.toValue = [NSNumber numberWithFloat:M_PI / 2.0];
    animation.duration = 5;           // 0.5秒で90度回転
    animation.repeatCount = MAXFLOAT;   // 無限に繰り返す
    animation.cumulative = YES;         // 効果を累積
    [layer addAnimation:animation forKey:@"ImageViewRotation"];
    
    
    CALayer *layer2 = imageView2.layer;
    
    CABasicAnimation* animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation2.toValue = [NSNumber numberWithFloat:M_PI / -1.0];
    animation2.duration = 5;           // 0.5秒で90度回転
    animation2.repeatCount = MAXFLOAT;   // 無限に繰り返す
    animation2.cumulative = YES;         // 効果を累積
    [layer2 addAnimation:animation2 forKey:@"ImageViewRotation"];

    
/*    for(int i = 0 ; i < 50 ; i = i + 1){
        [[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
        
        
        if(i == timeup){
            CALayer *layer = imageView.layer;
            CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
            layer.speed = 0.0;
            layer.timeOffset = pausedTime;
            
            CALayer *layer2 = imageView2.layer;
            CFTimeInterval pausedTime2 = [layer2 convertTime:CACurrentMediaTime() fromLayer:nil];
            layer2.speed = 0.0;
            layer2.timeOffset = pausedTime;
                        }
*/
    int random_number = arc4random() % 10 ;
    time = random_number;
    


}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)start{
    CALayer *layer = imageView.layer;
    
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;

    CALayer *layer2 = imageView2.layer;
    
    CFTimeInterval pausedTime2 = [layer2 timeOffset];
    layer2.speed = 1.0;
    layer2.timeOffset = 0.0;
    layer2.beginTime = 0.0;
    CFTimeInterval timeSincePause2 = [layer2 convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime2;
    layer2.beginTime = timeSincePause2;
    
    
    
}

-(IBAction)stop{
    
    CALayer *layer = imageView.layer;
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
    
    CALayer *layer2 = imageView2.layer;
    CFTimeInterval pausedTime2 = [layer2 convertTime:CACurrentMediaTime() fromLayer:nil];
    layer2.speed = 0.0;
    layer2.timeOffset = pausedTime2;
    
    CALayer* pLayer = [layer presentationLayer];
    CALayer* pLayer2 = [layer2 presentationLayer];
    
    float angleLarge = [[pLayer valueForKeyPath:@"transform.rotation.z"] floatValue];
    float angleArrow = [[pLayer2 valueForKeyPath:@"transform.rotation.z"] floatValue];
    
    NSLog(@"%f %f", angleLarge, angleArrow);
    
    
    //numberには矢印の角度から円盤の回転角度を引いた数
    float number = angleArrow - angleLarge;
    //→計算した結果、0より大きいか小さいかで
    
    if (number > M_PI) {
        //
        number = -1*(2*M_PI-number);
         NSLog(@"%f", number);
    }else if (number < M_PI) {
        //
        number = -1*number;
         NSLog(@"%f", number);
        
    }else if(number ){
        //
    }else{
         NSLog(@"%f", number);
    }
    
    if (0<=number&&number<0.36941176) {
        //1
        numbers = 11;////////////////
    }else if (0.36941176<=number&&number<0.73882352) {
        //2
        numbers = 22;////////////////
    }else if (0.73882352<=number&&number<1.10823528) {
        //3
        numbers = 33;////////////////
    }else if (1.10823582<=number&&number<1.47764704) {
        //4
        numbers = 44;////////////////
    }else if (1.47764704<=number&&number<1.84705880) {
        //6
        numbers = 66;
    }else if (1.84705880<=number&&number<2.21647056) {
        //7
        numbers = 77;////////////////
    }else if (2.21647056<=number&&number<2.58588232) {
        //8
        numbers = 88;////////////////
    }else if (2.58588232<=number&&number<2.95529408) {
        //9
        numbers = 99;////////////////
    }else if (2.95529408<=number&&number<=3.14) {
        //1
        numbers = 11;////////////////
    }else if (0>number&&number>=-0.36941176) {
        //0
        numbers = 0;////////////////
    }else if (-0.36941176>=number&&number>-0.73882352) {
        //9
        numbers = 1;
    }else if (-0.73882352>=number&&number>-1.10823528) {
        //8
        numbers = 2;
    }else if (-1.10823528>=number&&number>-1.47764704) {
        //7
        numbers = 7;
    }else if (-1.47764704>=number&&number>-1.84705880) {
        //6
        numbers = 4;
    }else if (-1.84705880>=number&&number>-2.21647056) {
        //4
        numbers = 6;
    }else if (-2.21647056>=number&&number>-2.58588232) {
        //3
        numbers = 3;
    }else if (-2.58588232>=number&&number>-2.95529408) {
        //2
        numbers = 9;
    }else if (-2.95529408>=number&&number>-3.14) {
        //1
        numbers = 8
        ;

    }
    label.text=[NSString stringWithFormat:@"%d",numbers];
    
    
    /*
    for(int i = 0 ; i < 10 ; i = i + 1){
    [[NSRunLoop currentRunLoop]
    runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    
    if (i == random) {
        CALayer *layer = imageView.layer;
        CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
        layer.speed = 0.0;
        layer.timeOffset = pausedTime;
        
        CALayer *layer2 = imageView2.layer;
        CFTimeInterval pausedTime2 = [layer2 convertTime:CACurrentMediaTime() fromLayer:nil];
        layer2.speed = 0.0;
        layer2.timeOffset = pausedTime;
    }
        */
        
}

@end

