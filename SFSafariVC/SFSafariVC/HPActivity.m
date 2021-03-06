//
//  HPActivity.m
//  SFSafariVC
//
//  Created by Jason on 16/4/27.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "HPActivity.h"

@implementation HPActivity

//初始化方法
-(instancetype)initWithImage:(UIImage *)shareImage atURL:(NSString *)URL atTitle:(NSString *)title atShareContentArray:(NSArray *)shareContentArray
{
    if(self = [super init]){
        _shareImage = shareImage;
        _URL = URL;
        _title = title;
        _getShareArray = [[NSArray alloc]initWithArray:shareContentArray];
    }
    return self;
}
//以下方法都是自定义UiActivity需要重写的方法
+(UIActivityCategory)activityCategory
{
    return UIActivityCategoryShare;
//    return UIActivityCategoryAction;
}
//设置类型
-(NSString *)activityType
{
    return _title;
}
//设置现实的标题
-(NSString *)activityTitle
{
    return _title;
}
//图片
-(UIImage *)activityImage
{
    return _shareImage;
}
//返回yes就行，这个表示该分享是不是在controller中显示
-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}
//是不是自定义的controller，如果为空，则调用performActivity方法
- (UIViewController *)activityViewController
{
    NSLog(@"hahah ");
    return nil;
}

//点击分享图标之后触发的方法
-(void)performActivity
{
    if(nil == _title) {
        return;
    }
    NSLog(@"要分享的内容-----%@",_getShareArray);
    NSLog(@"分享的类型------ %@",_title);
    if([_title isEqualToString:@"share Renren"]){
        NSLog(@"---^^^   renren");
        //调用人人的sdk
    }else if([_title isEqualToString:@"share Sina"]){
        //调用新浪sdk
    }
}
- (void)activityDidFinish:(BOOL)completed{
    NSLog(@"分享完成");
}   // activity must call this when activity is finished
- (void)prepareWithActivityItems:(NSArray *)activityItems;{
    NSLog(@"准备");
}

@end
