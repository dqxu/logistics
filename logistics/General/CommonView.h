//
//  CommonView.h
//
//
//  Created by dqxu on


#import <UIKit/UIKit.h>



@protocol VCEmptyDelegate <NSObject>

- (void)vcReloadBtnClicked;

@end

@interface CommonView : UIView

+ (UIView *)lineViewWithWidth:(CGFloat)width originY:(CGFloat) y color:(UIColor *)color baseView:(UIView *)base;


+ (void)lineViewFromX:(CGFloat)beginX originY:(CGFloat) y color:(UIColor *)color baseView:(UIView *)base;

+ (UIView *)lineViewWithFrame:(CGRect)frame color:(UIColor *)color baseView:(UIView *)base;

+ (void)addTopAndBottomLineWithColor:(UIColor *)color baseView:(UIView *)base;

+ (UIView *)addTopLineWithColor:(UIColor *)color baseView:(UIView *)base;
+ (UIView *)addBottomLineWithColor:(UIColor *)color baseView:(UIView *)base;
+ (void)addTopLineFromX:(CGFloat)beginX withColor:(UIColor *)color baseView:(UIView *)base;


+ (void)addLeftLineWithColor:(UIColor *)color baseView:(UIView *)base;

+ (void)addRightLineWithColor:(UIColor *)color baseView:(UIView *)base;


@end
