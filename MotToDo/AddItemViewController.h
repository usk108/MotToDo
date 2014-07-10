//
//  AddItemViewController.h
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/08.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddItemViewControllerDelegate;

@interface AddItemViewController : UITableViewController

@property (weak, nonatomic) id<AddItemViewControllerDelegate> delegate;

@end

@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;

- (void)addItemViewControllerDidFinish:(AddItemViewController *)controller item:(NSString *)item;

@end
