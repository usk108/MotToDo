//
//  Sound.m
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/10.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import "Sound.h"

@implementation Sound{
    //音のファイルの所在を示すURL
    CFURLRef soundURL;
    //サウンドIDを生成、iOSはこの値をもとに再生する音を識別する
    SystemSoundID soundID;
    NSMutableArray *praiseSoundIDs;
    NSMutableArray *cheerSoundIDs;

}

-(void)setSound{
    praiseSoundIDs = [NSMutableArray array];
    cheerSoundIDs = [NSMutableArray array];
    
    int i;
    NSArray *cheerSoundFiles = @[@"ganbareganbare",@"oikaketemasuka",@"ganbareyo",@"atsukunareyo",@"gakeppuri",@"chancegakuru"];
    NSArray *praiseSoundFiles = @[@"hitoyasumi",@"fujisanda",@"fight-shibasaki"];
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    
    for(i=0;i<cheerSoundFiles.count;i++){
        soundURL = CFBundleCopyResourceURL(mainBundle,(__bridge CFStringRef)cheerSoundFiles[i],CFSTR("wav"),nil);
        //soundURLをもとに、soundIDを生成
        AudioServicesCreateSystemSoundID(soundURL, &soundID);
        [cheerSoundIDs addObject:@(soundID)];
        
    }
    for(i=0;i<praiseSoundFiles.count;i++){
        soundURL = CFBundleCopyResourceURL(mainBundle,(__bridge CFStringRef)praiseSoundFiles[i],CFSTR("wav"),nil);
        //soundURLをもとに、soundIDを生成
        AudioServicesCreateSystemSoundID(soundURL, &soundID);
        [praiseSoundIDs addObject:@(soundID)];
    }
    
}

//soundIDが示す音を再生する
-(void)cheerPlay{
    int i = arc4random()%6;
    float showTime = 0.0;
    soundID = [[cheerSoundIDs objectAtIndex:i] unsignedLongValue];
    AudioServicesPlaySystemSound(soundID);
    
    NSString *message;
    switch(i){
        case 0:
            message = @"「そこで諦めるな絶対に頑張れ\n積極的にポジティブに頑張れ頑張れ」";
            showTime = 3.0f;
            break;
        case 1:
            message = @"「夢、追いかけてますか」";
            showTime = 1.5f;
            break;
        case 2:
            message = @"「頑張れよ。」";
            showTime = 1.0f;
            break;
        case 3:
            message = @"「もっと！！\nアツくなれよ！！！」";
            showTime = 2.5f;
            break;
        case 4:
            message = @"「その崖っぷちが\n最高のチャンスなんだぜ」";
            showTime = 3.5f;
            break;
        case 5:
            message = @"「そこで頑張れば\n絶対必ずチャンスがくる！」";
            showTime = 3.8f;
            break;
    }
    
    // １行で書くタイプ（１ボタンタイプ）
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"1/2達成！" message:message
                              delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    
    //Timer 設定
    [NSTimer scheduledTimerWithTimeInterval:showTime target:self selector:@selector(performDismiss:) userInfo:alert repeats:NO];
}

//Timer終了でアラートを閉じる
-(void)performDismiss:(NSTimer*)timer
{
    UIAlertView *alt = [timer userInfo];
    [alt dismissWithClickedButtonIndex:0 animated:NO];
}

//soundIDが示す音を再生する
-(void)praisePlay{
    int i = arc4random()%3;
    float showTime = 0.0;
    soundID = [[praiseSoundIDs objectAtIndex:i] unsignedLongValue];
    AudioServicesPlaySystemSound(soundID);
    
    
    NSString *message;
    UIAlertView *alert;
    switch(i){
        case 0:
            message = @"「焦らない、焦らない。\n一休み、一休み。」";
            showTime = 5.0f;
            alert =
            [[UIAlertView alloc] initWithTitle:@"タスク完全達成！" message:message
                                      delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
            break;
        case 1:
            message = @"「今日からお前は\n富士山だ！！」";
            showTime = 3.5f;
            alert =
            [[UIAlertView alloc] initWithTitle:@"タスク完全達成！" message:message
                                      delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
            break;
        case 2:
            message = @"「ファイトっ！」";
            showTime = 5.0f;
            alert =
            [[UIAlertView alloc] initWithTitle:@"タスク完全達成！" message:message
                                      delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
            alert.tag = 2;
            UIImageView* image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shibasaki1.jpg"]];
            [alert setValue:image forKey:@"accessoryView"]; //自己責任で使うこと
            break;
    }
    
    [alert show];
    
    //Timer 設定
    [NSTimer scheduledTimerWithTimeInterval:showTime target:self selector:@selector(performDismiss:) userInfo:alert repeats:NO];

}

- (void)willPresentAlertView:(UIAlertView *)alertView{
    if (alertView.tag == 2) {
        CGRect frame = alertView.frame;
        frame.origin.y = 20;
        frame.size.height = 450;
        alertView.frame = frame;
        
        for (UIView* view in alertView.subviews){
            frame = view.frame;
            if (frame.origin.y > 44) {
                frame.origin.y += 310;
                view.frame = frame;
            }
        }
    }
}

+(id)initSound{
    return[[self alloc] init];
}

-(id)init{
    self = [super init];
    [self setSound]; //「-(void)setSound」を呼び、音を設定
    return self;
}

@end
