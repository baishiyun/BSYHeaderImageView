//
//  ViewController.m
//  BSYHeaderImageView
//
//  Created by chenchen on 15/8/10.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "ViewController.h"
#import "BSYHeaderImageView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tt = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tt.dataSource = self;
    tt.delegate = self;
    tt.tableFooterView = [[UIView alloc]init];
    tt.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    [self.view addSubview:tt];
    
    _imageView = [[BSYHeaderImageView alloc]init];
    [tt addSubview:_imageView];
    _imageView.nameLable.text = @"WOCAOCAO";

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    if (y < -200) {
        CGRect frame = _imageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        _imageView.frame = frame;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",(long)indexPath.row];
    return cell;
}

@end
