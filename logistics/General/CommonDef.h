//
//  CommonDef.h
//
//
//  Created by dqxu 


// DEBUG开关

#define WI_DEBUG    1

#ifndef IOS_VERSION  
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]  
#endif  

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

enum ImageType
{
    ImageType_NONE = -1,
    ImageType_BMP = 0,
    ImageType_JPEG,
    ImageType_GIF,
    ImageType_PCX,
    ImageType_PNG,
    ImageType_PSD,
    ImageType_RAS,
    ImageType_SGI,
    ImageType_TIFF
};





// 获取应用版本号
NSInteger getAppVersion(void);

float getScreenWidth(void);
float getScreenHeight(void);

// 增加frame的Y坐标
void addFrameY(UIView *iid , float aheight);
// 增加frame的高
void addFrameHeight(UIView *iid , float aheight);
// 设置frame的X坐标
void setFrameX(UIView *iid , float x);
void setFrameY(UIView *iid , float y);
// 设置frame的宽
void setFrameWidth(UIView *iid , float awidth);
void setFrameHeight(UIView *iid , float aheight);

void alert(NSString *msg);
UIView* alertViewController(NSString *msg,UIViewController *vc);


NSTimeInterval intervalFromString(NSString *beginT);
NSString* secondTimeForInterValTime(NSTimeInterval aTimer);


void showAddMessageBaseView(UIView *baseView,NSString *message,CGFloat centerY);

NSString *getDocumentsDirectoryWithFileName(NSString *fileName);
void Set_Write_Debug_Output_To_File(NSString *fileName);

// 获取图片数据类型
NSInteger getImageType(NSData *image);

void saveObjectParameter(id obj,NSString *key);
id readObjectBykey(NSString *key);


void saveParameter(NSString *content,NSString *key);
NSString* readParameterBykey(NSString *key);
void modifyFrameOfArray(NSArray *array);
BOOL isLogin();

unsigned long long getmsForm1970();
unsigned long long  parseDateStr(NSString *str);


NSString *getCommonDate();
NSString* getDateStringForm1970();

NSString *getDateStrFromUs(double number);
NSString *getDateForNow();

BOOL checkMobile(NSString *mobile);
BOOL checkUserCard(NSString *userCard);
BOOL checkPass(NSString *userCard);

void saveUserInfo();

/** 根据baseView计算lineView的高度，CGRectGetMaxY(baseView.frame) - lineChu。  toView:lineView的父view，决定lineView的高度 */
void addLineViewBase(UIView *baseView,UIView *toView);


void setBtnColor(UIButton *btn);
void setBtnColorWithNormalAndClick(UIButton *btn,UIColor *normalColor,UIColor *clickColor);

CGRect getRectBySize(CGSize size);
CGRect getRectBySizeAndMargin(CGSize size,CGFloat hMargin,CGFloat vMargin);
//void printView(UIView *v);
void onCheckVersion(id<UIAlertViewDelegate> vcDelegate);

void setTestLayborder(UIView *v);

void setBtnRefCorner(UIView *v);

void setRefBorderAndRadiusForView(UIView *v,UIColor *color);

void setBorderAndRadiusForView(UIView *v,UIColor *color);
void setBlackBorderAndRadiusForView(UIView *v);
void setDefaultRadiusForView(UIView *v);
void setDefaultBorderForView(UIView *v);

void dumpView(UIView *aView,int indent,NSMutableString *outstring);
NSString * displayViews(UIView * aView);


UIView* loopSepView(UIView *baseview,NSString *viewClassName);

UIView *getFooterHeaderViewWithWidth(CGFloat width);

UIView *getNavgationView();


//创建一个label，占一行
UILabel *createLabel(UIView *baseView,CGFloat beginX,CGFloat beginY,CGFloat tHeight,UIFont *font,UIColor *color,NSTextAlignment alignment);


void setLabel(UILabel *label, UIFont *font,UIColor *color,NSTextAlignment alignment);

UILabel *createLabelWithFrame(UIView *baseView,CGRect rect,UIFont *font,UIColor *color,NSTextAlignment alignment);

// 创建一个label描述和label，总宽度为 tWidth,alignment 为需要设置自负的label的字符对其方式
UILabel *createDesAndLabel(UIView *baseView,CGFloat beginX,CGFloat beginY,CGFloat tHeight,CGFloat tWidth,UIFont *font,CGFloat tHMargin ,UIColor *desColor,UIColor *contentColor,NSTextAlignment alignment);



//创建一个field，占一行
UITextField *createField(UIView *baseView,CGRect frame,UIFont *font,UIColor *color,NSTextAlignment alignment);


// 创建一个label描述和一个field，总宽度为 tWidth,alignment 为需要设置自负的label的字符对其方式
UITextField *createDesAndField(UIView *baseView,CGFloat beginX,CGFloat beginY,CGFloat tHeight,CGFloat tWidth,UIFont *font,CGFloat tHMargin ,UIColor *desColor,UIColor *contentColor,NSTextAlignment alignment);

//创建一个btn，减少设置颜色和文字代码的输入，只需要调整参数
UIButton *createBtn(CGRect rect,NSString *normalText,NSString *hightText,UIColor *nC,UIColor *hC);


//创建一个imageview,减少代码的重复输写
UIImageView *createImageView(UIView *baseView,CGRect rect,UIViewContentMode contentMode);
void displayWindow();

UIButton * setBackNavItemForController(UIViewController *vc);

UIView *createDefaultMarginView(CGFloat y,UIView *baseView);

CGFloat getWidthBase(NSString *str,CGFloat maxW,UIFont *font);

CGFloat getHeightBase(NSString *str,CGFloat maxW,CGFloat rowH,UIFont *font);


UIButton* setLeftNavBtnAndTitle(UIViewController *vc,NSString *btnPic,NSString *titleStr,id target,SEL method1);


UIButton* setRightNavBtnAndTitle(UIViewController *vc,NSString *btn1Pic,NSString *btn1Title,NSString *btn2Pic,NSString *btn2Title,id target,SEL method1,SEL method2);

void adjustLabelHight(UILabel *label,CGFloat baseRowH,CGFloat maxH);

NSString *getOrderState(NSString *stateStr);
NSString *getRefundOrderState(NSString *stateStr);

//调整label的高度
CGFloat heightForLabel(UILabel *label,NSInteger maxCol);

//判断字符串是否越界  如果string的宽度超过width的值，返回真
BOOL checkStringOutWidth(NSString *string,UIFont *font,CGFloat width);

NSString *getKuaiDi100(NSString *key);

UIView *getEmptyPlaceHolderView(UIView *baseView,UIView *distintView,NSString *content,NSString *pic);
BOOL checkStr(NSString *str);

NSString *processCategoryStr(NSString *str);

UILabel *getDeliveryLabel(CGFloat x,CGFloat y,CGFloat h,NSString *str);


NSString *generateDateString(NSString *extentName);

