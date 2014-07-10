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
    NSMutableArray *soundIDs;
}

-(void)setSound{
//    //[clap.wav]というファイルを読みこんで、soundURLを生成
//    CFBundleRef mainBundle = CFBundleGetMainBundle();
//    //soundURL = CFBundleCopyResourceURL(mainBundle,CFSTR("oikaketemasuka"),CFSTR("wav"),nil);
//    soundURL = CFBundleCopyResourceURL(mainBundle,CFSTR("ganbareganbare"),CFSTR("wav"),nil);
//    //soundURLをもとに、soundIDを生成
//    AudioServicesCreateSystemSoundID(soundURL, &soundID);

    //[clap.wav]というファイルを読みこんで、soundURLを生成
   
    soundIDs = [NSMutableArray array];
    
    int i;
    NSArray *soundFiles = @[@"ganbareganbare",@"oikaketemasuka",@"fujisanda"];
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    
    for(i=0;i<soundFiles.count;i++){
        soundURL = CFBundleCopyResourceURL(mainBundle,(__bridge CFStringRef)soundFiles[i],CFSTR("wav"),nil);
        //soundURLをもとに、soundIDを生成
        AudioServicesCreateSystemSoundID(soundURL, &soundID);
        [soundIDs addObject:@(soundID)];
    }
    
    
    
}

//soundIDが示す音を再生する
-(void)play{
    int i = arc4random()%3;
    soundID = [[soundIDs objectAtIndex:i] unsignedLongValue];
    AudioServicesPlaySystemSound(soundID);
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
