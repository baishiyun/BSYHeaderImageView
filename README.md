# BSYHeaderImageView
是用的时候需要引入#import "BSYHeaderImageView.h"头文件，具体用法如下：

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
   OK，打完收工！
    
    
}
