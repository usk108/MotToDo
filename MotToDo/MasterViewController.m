//
//  MasterViewController.m
//  MotToDo
//
//  Created by 鳥羽 祐輔 on 2014/07/08.
//  Copyright (c) 2014年 Yusuke Toba. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "AddItemViewController.h"

#import "Sound.h"
#import "UITableViewCellAsTodo.h"

@interface MasterViewController () <AddItemViewControllerDelegate>{
    NSMutableArray *_objects;
    Sound *soundInstance;
    
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    soundInstance = [Sound initSound];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller
{
    NSLog(@"addItemViewControllerDIdCancel");
    
    //画面を閉じるメソッドを呼ぶ
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)addItemViewControllerDidFinish:(AddItemViewController *)controller item:(NSString *)item
{
    NSLog(@"addItemViewControllerDIdFinishd");
    
    //保存するための配列の準備ができていない場合は、配列を生成し、初期化する
    if(!_objects){
        _objects = [[NSMutableArray alloc] init];
    }
    
    //受け取ったitemを配列に格納する
    [_objects insertObject:item atIndex:0];
    
    //TableViewに行を挿入する
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    
    //画面を閉じるメソッドを呼ぶ
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowAddItemView"]) {
        
        // 遷移先のAddItemViewControllerのインスタンスを取得
        AddItemViewController *addItemViewController = (AddItemViewController *)[[[segue destinationViewController]viewControllers]objectAtIndex:0];
        
        // delegateプロパティにself(MasterViewController自身)をセット
        addItemViewController.delegate = self;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除をします。
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    //音声再生
    [soundInstance play];
}

@end
