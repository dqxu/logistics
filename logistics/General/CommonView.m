//
//  CommonView.m

//
//  Created by dqxu on


#import "CommonView.h"
#import "AppMacro.h"


@implementation CommonView



+ (UIView *)lineViewWithWidth:(CGFloat)width originY:(CGFloat) y color:(UIColor *)color baseView:(UIView *)base
{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, y, width, kLineViewW)]; //0.4有时显示不出来线
    if (color == nil) {
//        color = [UIColor lightGrayColor];
        color = kLineColor;
    }
    lineView.backgroundColor = color;
    [base addSubview:lineView];
    
    
    return lineView;
}


+ (UIView *)lineViewWithFrame:(CGRect)frame color:(UIColor *)color baseView:(UIView *)base
{
    UIView *lineView = [[UIView alloc]initWithFrame:frame];
    if (color == nil) {
//        color = [UIColor lightGrayColor];
        color = kLineColor;
    }
    lineView.backgroundColor = color;
    [base addSubview:lineView];
    return lineView;
    
}


+ (void)addTopAndBottomLineWithColor:(UIColor *)color baseView:(UIView *)base
{
    [self lineViewWithWidth:base.frame.size.width originY:0 color:nil baseView:base];
    [self lineViewWithWidth:base.frame.size.width originY:base.frame.size.height - kLineViewW color:nil baseView:base];
    
    return;

}


+ (void)lineViewFromX:(CGFloat)beginX originY:(CGFloat)y color:(UIColor *)color baseView:(UIView *)base
{
    
    [self lineViewWithFrame:CGRectMake(beginX, y, base.frame.size.width - beginX, kLineViewW) color:nil baseView:base];
    return;
}

+ (void)addTopLineFromX:(CGFloat)beginX withColor:(UIColor *)color baseView:(UIView *)base
{
    [self lineViewWithFrame:CGRectMake(beginX, 0, base.frame.size.width - beginX, kLineViewW) color:nil baseView:base];
    return;
}

+ (UIView *)addTopLineWithColor:(UIColor *)color baseView:(UIView *)base
{
    return [self lineViewWithWidth:base.frame.size.width originY:0 color:color baseView:base];
}


+ (void)addLeftLineWithColor:(UIColor *)color baseView:(UIView *)base
{
    [self lineViewWithFrame:CGRectMake(0, 0, kLineViewW,base.frame.size.height) color:nil baseView:base];
    return;
}


+ (void)addRightLineWithColor:(UIColor *)color baseView:(UIView *)base
{

    [self lineViewWithFrame:CGRectMake(base.frame.size.width  - kLineViewW, 0, kLineViewW,base.frame.size.height) color:nil baseView:base];
    return;
}


+ (UIView *)addBottomLineWithColor:(UIColor *)color baseView:(UIView *)base
{
    return [self lineViewWithWidth:base.frame.size.width originY:base.frame.size.height - kLineViewW color:color baseView:base];
}





@end
