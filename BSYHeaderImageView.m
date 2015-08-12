//
//  BSYHeaderImageView.m
//  BSYHeaderImageView
//
//  Created by chenchen on 15/8/10.
//  Copyright (c) 2015年 BSY. All rights reserved.
//

#import "BSYHeaderImageView.h"
#define BSYImageHight 200.0f
#define With  [UIScreen mainScreen].bounds.size.width
@implementation BSYHeaderImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    {
    
       //背景图片
        self = [[BSYHeaderImageView alloc]initWithImage:[UIImage imageNamed:@"car.png"]];
        self.frame = CGRectMake(0, -BSYImageHight, With, BSYImageHight);
        self.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
        
        //设置autoresizesSubviews让子类自动布局
        self.autoresizesSubviews = YES;
        
        self.headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, BSYImageHight-50, 40, 40)];
         self.headerImageView.backgroundColor = [UIColor redColor];
         self.headerImageView.layer.cornerRadius = 7.5f;
         self.headerImageView.image = [UIImage imageNamed:@"car.jpg"];
         self.headerImageView.clipsToBounds = YES;
         self.headerImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动布局，自适应顶部
         [self addSubview: self.headerImageView];
        
        self.nameLable = [[UILabel alloc]initWithFrame:CGRectMake(60, BSYImageHight-40, 280, 20)];
        self.nameLable.textColor = [UIColor whiteColor];
        self.nameLable.text = @"namelabel";
        self.nameLable.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动布局，自适应顶部
        [self addSubview:self.nameLable];

        
    
    }
    return self;
}
@end
