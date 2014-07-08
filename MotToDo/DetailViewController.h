//
//  DetailViewController.h
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/08.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
