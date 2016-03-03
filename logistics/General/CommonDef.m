//
//  CommonDef.m
//  wiIos
//
//  Created by xuanwenchao on 11-12-22.
//  Copyright (c) 2011年 Waptech (Beijing) Information Technologies, Ltd. All rights reserved.
//
#import "CommonDef.h"

#import <sys/time.h>




#define kReferBtnCornerRadius 3
#define kReferBtnCornerWidth 0.4
#define kBackImageStr @"backUpCircleIcon"
// 2.获得RGB颜色
#define DQColor(r,g,b) [UIColor colorWithRed:r/ 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]

#define WGHintColor DQColor(144,144,144) //提示字符的颜色  购物车空空 猜你喜欢  商品没有的提示
#define kProductDetailSectionMargin 10  //产品详情页 大项列表间隔
#define kDeliveryBackGroundColor DQColor(158,158,158)
#define WGSectionMarginColor DQColor(237,237,242) //2015.11.20 jd 商品详情的颜色
#define WGWhiteSmoke DQColor(245,245,245)  //烟白色




// 获取应用版本号
NSInteger getAppVersion(void)
{
    NSString *versionStr = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    NSLog(@"from 'Build' -- appVersion: %@", versionStr);   
    NSArray *array = [versionStr componentsSeparatedByString:@"."];
    NSLog(@"array:%@", array);
    
    if (array.count >= 2)
    {
        NSInteger verH = [[array objectAtIndex:0] intValue];
        NSInteger verL = [[array objectAtIndex:1] intValue];
        
        NSInteger version = (verH << 8) + verL;
        return version;
    }
    else
    {
        return 0;
    }
}

void addFrameY(UIView *iid, float aheight)
{
    CGRect frame = iid.frame;
    frame.origin.y += aheight;
    iid.frame = frame;
}

void addFrameHeight(UIView *iid, float aheight)
{
    CGRect frame = iid.frame;
    frame.size.height += aheight;
    iid.frame = frame;
}

void setFrameX(UIView *iid, float x)
{
    CGRect frame = iid.frame;
    frame.origin.x = x;
    iid.frame = frame;
}

void setFrameY(UIView *iid, float y)
{
    CGRect frame = iid.frame;
    frame.origin.y = y;
    iid.frame = frame;
}

void setFrameWidth(UIView *iid , float awidth)
{
    CGRect frame = iid.frame;
    frame.size.width = awidth;
    iid.frame = frame;
}

void setFrameHeight(UIView *iid , float aheight)
{
    
    
    if(isnan(aheight))
    {
        
        NSLog(@"error view %@,height %f in setFrameHeight",iid,aheight);
        return;
    }
    CGRect frame = iid.frame;
    frame.size.height = aheight;
    iid.frame = frame;
}

NSString *getDocumentsDirectoryWithFileName(NSString *fileName)
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

void Set_Write_Debug_Output_To_File(NSString *fileName)
{
    NSString *outputFile = getDocumentsDirectoryWithFileName(fileName);
    const char *pp = [outputFile fileSystemRepresentation];
    freopen(pp , "a", stderr);
}

//NSString *getBundleDirectoryWithFileName(NSString *fileName)
//{
//    return [[NSBundle mainBundle] pathForResource:@"Party" ofType:@"xml"];
//}

NSInteger getImageType(NSData *image)
{
    NSInteger Result;
    NSInteger head;
    [image getBytes:&head range:NSMakeRange(0, 2)];
    
    head = head & 0x0000FFFF;
//    NSLog(@"%d, %x", head, head);
    switch (head)
    {
        case 0x4D42:
            Result = ImageType_BMP;
            break;
            
        case 0xD8FF:
            Result = ImageType_JPEG;
            break;

        case 0x4947:
            Result = ImageType_GIF;
            break;
            
        case 0x050A:
            Result = ImageType_PCX;
            break;
            
        case 0x5089:
            Result = ImageType_PNG;
            break;
            
        case 0x4238:
            Result = ImageType_PSD;
            break;
            
        case 0xA659:
            Result = ImageType_RAS;
            break;
            
        case 0xDA01:
            Result = ImageType_SGI;
            break;
            
        case 0x4949:
            Result = ImageType_TIFF;
            break;
            
        default:
            Result = ImageType_NONE;
            break;
    }
    
    return Result;
}

void alert(NSString *msg)
{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"系统提示" message:msg delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil ];
    [alert show];
     
    /*
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"系统提示" andMessage:msg];
    [alertView addButtonWithTitle:@"好的"
                             type:SIAlertViewButtonTypeCancel
                          handler:^(SIAlertView *alertView) {
                              
                              NSLog(@"Cancel Clicked");
                              
                          }];
    [alertView show];
     
     */

}



UIView* alertViewController(NSString *msg,UIViewController *vc)
{
    
//    UIView *view = [[UIView alloc]initWithFrame:vc.view.frame];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, vc.view.frame.size.width, vc.view.frame.size.height)];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, view.frame.size.height / 2.0 - 22, view.frame.size.width, 44)];
    
    label.text = msg;
    label.font = [UIFont systemFontOfSize:17];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:label];
    
    view.backgroundColor = [UIColor grayColor]; //WGGray81Color;
    
    [vc.view addSubview:view];
    
    return view;
}



void showAddMessageBaseView(UIView *baseView,NSString *message,CGFloat centerY)
{
    UIView *hideView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 60)];
    
    hideView.center = CGPointMake(baseView.center.x, centerY);
    
    hideView.backgroundColor = [UIColor blackColor];
    hideView.layer.cornerRadius = 5;
    hideView.layer.masksToBounds = YES;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 60)];
    label.text = message;
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    label.backgroundColor = [UIColor clearColor];
    label.alpha = 0.8;
    [hideView addSubview:label];
    
    [baseView addSubview:hideView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [hideView removeFromSuperview];
    });
    
    
}


void saveObjectParameter(id obj,NSString *key)
{
    // 1.存储数据
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    

//    NSString *encryptKey = [key encryptStringWithKey:k3DESKey];
    
//    NSLog(@"saveParameter  encryptString:%@,encryptkey:%@, before string:%@,key:%@",encryptString,encryptKey,content,key);
    
//    [user setObject:obj forKey:encryptKey];
    [user setObject:obj forKey:key];
    
    // 2.马上进行存储(马上进行同步)
    [user synchronize]; //会生成项目目录/Library/Preferences/cn.dqxu.ui-2013-12-10-qqSpaceModeDataSave.plist 文件
}






id readObjectBykey(NSString *key)
{
    // 1.存储数据
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];

    id ret = [user objectForKey:key];

    return ret;
}


void saveParameter(NSString *content,NSString *key)
{
    // 1.存储数据
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    

     [user setObject:content forKey:key];
    
    // 2.马上进行存储(马上进行同步)
    [user synchronize]; //会生成项目目录/Library/Preferences/cn.dqxu.ui-2013-12-10-qqSpaceModeDataSave.plist 文件
}


NSString* readParameterBykey(NSString *key)
{
    // 1.存储数据
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];

    NSString *content = [user objectForKey:key];
    
    NSLog(@"readParameter key:%@,value:%@",key,content);
    return content;
}

void modifyFrameOfArray(NSArray *array)
{
    for (UIView *v in array)
    {
        addFrameY(v, -64);
    }
}

UIView* loopView(UIView *view)
{
    
    UIView *tv;
    for (UIView *v in [view subviews])
    {
        if ([NSStringFromClass([v class]) isEqualToString:@"UILayoutContainerView"])
        {
            return v;
        }
        if ([v subviews])
        {
            tv = loopView(v);
            if (tv)
            {
                return tv;
            }
        }
        
    }
    
    return nil;
}


UIView* loopSepView(UIView *baseview,NSString *viewClassName)
{
    
    UIView *tv;
    for (UIView *v in [baseview subviews])
    {
        
        NSString *str =  NSStringFromClass([v class]);
        NSLog(@"%@",str);
        if ([str isEqualToString:viewClassName])
        {
            return v;
        }
        if ([v subviews])
        {
            tv = loopSepView(v,viewClassName);
            if (tv)
            {
                return tv;
            }
        }
        
    }
    
    return nil;
}

NSTimeInterval intervalFromString(NSString *beginT)
{
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1 = [formater dateFromString:beginT];
    NSDate *date2 = [NSDate date];
    
    NSTimeInterval aTimer = [date2 timeIntervalSinceDate:date1];
    
    return aTimer;
}

NSString* secondTimeForInterValTime(NSTimeInterval aTimer)
{
    /*
     int hour = (int)(aTimer/3600);
     int minute = (int)(aTimer - hour*3600)/60;
     int second = aTimer - hour*3600 - minute*60;
     NSString *dural = [NSString stringWithFormat:@"%d时%d分%d秒", hour, minute,second];
     */
    
    int minute = (int)(aTimer)/60;
    int second = aTimer - minute*60;
    NSString *dural = [NSString stringWithFormat:@"%d分%d秒",minute,second];
    
    return dural;
}







/*
 头文件：#include <sys/time.h>    #include <unistd.h>
 
 定义函数：int gettimeofday (struct timeval * tv, struct timezone * tz);
 
 函数说明：gettimeofday()会把目前的时间有tv 所指的结构返回，当地时区的信息则放到tz 所指的结构中。
 
 timeval 结构定义为：
 struct timeval{
 long tv_sec;  //秒
 long tv_usec;  //微秒
 };
 
 timezone 结构定义为：
 struct timezone
 {
 int tz_minuteswest;  //和Greenwich 时间差了多少分钟
 int tz_dsttime;  //日光节约时间的状态
 };
 */
unsigned long long getmsForm1970()
{
    struct timeval start;
    gettimeofday( &start, NULL );
    
    //    printf("time  s: %ld   us: %d\n", start.tv_sec,start.tv_usec);
    
    //    printf("test time: %llu ms\n", 1387584000000);
    
    unsigned long long time = 0;
    
    unsigned long long t = start.tv_sec;
    time = 1000 * t;
    
    t = (start.tv_usec / 1000);
    time = time + t;
    
    printf("time: %llu  ms\n", time);
    
    
    //(44 * 365 * 24 * 60 * 60 * 1000);
    //    unsigned long long temp = 44 *365;
    //
    //    temp = temp * 24;
    //    temp = temp * 3600000;
    //
    //
    //
    //    printf("manual time: %llu ms\n", temp);
    
    
    
    /*
     2014 - 1970 =  44 年
     
     365 天 24小时  60分钟  60 s 1000 ms
     44 * 365 * 24 *    60 *   60 * 1000    //一起算有些问题
     
     
     
     time  s: 1396951164   us: 475219
     test time: 1387584000000 ms
     time: 1 396 951 164 475  ms    //13 位
     manual time: 1 387 584 000 000 ms
     
     */
    return time;
}


//返回 "\/Date(1409581620000+0800)\/"的格式
NSString* getDateStringForm1970()
{
    
    NSString *ret = nil;
    struct timeval start;
    gettimeofday( &start, NULL );
    
    //    printf("time  s: %ld   us: %d\n", start.tv_sec,start.tv_usec);
    
    //    printf("test time: %llu ms\n", 1387584000000);
    
    unsigned long long time = 0;
    
    unsigned long long t = start.tv_sec;
    time = 1000 * t;
    
    t = (start.tv_usec / 1000);
    
    
    int usT = start.tv_sec % 1000;
    
    time = time + t;
    
    printf("time: %llu  ms\n", time);
    
    printf("\\\n");
    
//    ret = [NSString stringWithFormat:@"\\/Date(%llu+%04d)\\/",time,usT]; //调试窗口直接将显示转义后的字符
    ret = [NSString stringWithFormat:@"/Date(%llu+%04d)/",time,usT];
    
    NSLog(@"%@",ret);
    //(44 * 365 * 24 * 60 * 60 * 1000);
    //    unsigned long long temp = 44 *365;
    //
    //    temp = temp * 24;
    //    temp = temp * 3600000;
    //
    //
    //
    //    printf("manual time: %llu ms\n", temp);
    
    
    
    /*
     2014 - 1970 =  44 年
     
     365 天 24小时  60分钟  60 s 1000 ms
     44 * 365 * 24 *    60 *   60 * 1000    //一起算有些问题
     
     
     
     time  s: 1396951164   us: 475219
     test time: 1387584000000 ms
     time: 1 396 951 164 475  ms    //13 位
     manual time: 1 387 584 000 000 ms
     
     */
    return ret;
}



NSString *getCommonDate()
{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    //    [dateformatter setDateFormat:@"HH:mm"];  //time:09:31
    
    //    [dateformatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];// time:2014-09-12-09-33-17
    
    [dateformatter setDateFormat:@"YYYY-MM-dd  HH:mm:ss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSLog(@"time:%@",locationString);
    
    return locationString;
}


NSString *getDateStrFromUs(double number)
{

    
     NSDate *  date = [[NSDate alloc]initWithTimeIntervalSince1970:number / 1000000];
    
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    //    [dateformatter setDateFormat:@"HH:mm"];  //time:09:31
    
    //    [dateformatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];// time:2014-09-12-09-33-17
    
    [dateformatter setDateFormat:@"YYYY-MM-dd  HH:mm:ss"];
    NSString *  locationString=[dateformatter stringFromDate:date];
    
    NSLog(@"--time:%@",locationString);
    
    return locationString;
}


NSString *getDateForNow()
{
    NSDate *  date = [NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    //    [dateformatter setDateFormat:@"HH:mm"];  //time:09:31
    
    //    [dateformatter setDateFormat:@"YYYY-MM-dd-HH-mm-ss"];// time:2014-09-12-09-33-17
    
    [dateformatter setDateFormat:@"YYYY-MM-dd  HH:mm:ss"];
    NSString *  locationString=[dateformatter stringFromDate:date];
    
    NSLog(@"--time:%@",locationString);
    
    return locationString;
}


//"_lastLoginDate":"\/Date(1406730420000+0800)\/"
unsigned long long  parseDateStr(NSString *str)
{
    
    
    NSArray *array = [str componentsSeparatedByString:@"("];
    
    if (array.count > 1)
    {
         array = [array[1]  componentsSeparatedByString:@")"];
        
        if (array.count > 1)
        {
            array = [array[0] componentsSeparatedByString:@"+"];
        }
    }
   
    if (array.count > 1)
    {
    
        unsigned long long n1 = [array[0] longLongValue];
        unsigned long long n2 = [array[1] longLongValue];
        
        unsigned long long number = n1 * 1000 + n2;
        
        NSLog(@"--time:%llu",number);
        return number;


    }
    
    return 0;
}


BOOL checkMobile(NSString *mobile)
{
    

    
    NSString *regex = @"^((13[0123456789])|(15[012356789])|147|(18[012356789])|176|178)[0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:mobile];
    
    NSLog(@"mobile:%@ match %d",mobile,isMatch);
    
    return isMatch;
}


BOOL checkUserCard(NSString *userCard)
{

    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X|x)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userCard];
    NSLog(@"mobile:%@ match %d",userCard,isMatch);
    return isMatch;

}

BOOL checkPass(NSString *userCard)
{
    
    
    
    NSString *pattern = @"[0-9a-zA-Z_]{6,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userCard];
    NSLog(@"mobile:%@ match %d",userCard,isMatch);
    return isMatch;
    
}






NSDictionary* dictWithNSDataAndKey(NSData *data, NSString *key)
{
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSDictionary *dict = [unarchiver decodeObjectForKey:key];
    [unarchiver finishDecoding];
    
    NSLog(@"func:%s dict:%@",__func__,dict);
    return dict;
}


NSData * dataWithDict(NSDictionary *dict,NSString *key)
{
    
    NSLog(@"%s",__func__);
    
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:dict forKey:key];
    [archiver finishEncoding];
    
    return data;
}




void setBtnColor(UIButton *btn)
{
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
}


//根据baseView计算lineView的高度，CGRectGetMaxY(baseView.frame) - lineChu。  toView:lineView的父view，决定lineView的高度
void addLineViewBase(UIView *baseView,UIView *toView)
{
    CGFloat lineChu = 0.5;
    
    CGFloat beginY = 0;
    if (baseView == toView)  //如果参考view和父view是同一个view，则 用baseview的高度就可以了
    {
        beginY = baseView.frame.size.height;
    }
    else //如果不是同一个view,用baseview的y ＋ baseview的高度
    {
        beginY = CGRectGetMaxY(baseView.frame) - lineChu;
    }
    
    
    NSLog(@"baseView:%@",baseView);
    
    NSLog(@"beginY:%f",beginY);
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0,beginY, toView.frame.size.width, lineChu)];
    line.backgroundColor = [UIColor lightGrayColor];
    [toView addSubview:line];
}

void setBtnColorWithNormalAndClick(UIButton *btn,UIColor *normalColor,UIColor *clickColor)
{
    [btn setTitleColor:normalColor forState:UIControlStateNormal];
    [btn setTitleColor:clickColor forState:UIControlStateSelected];
    [btn setTitleColor:clickColor forState:UIControlStateHighlighted];
    [btn setTitleColor:clickColor forState:UIControlStateDisabled];
}





void setBtnRefCorner(UIView *v)
{
    v.layer.borderWidth = kReferBtnCornerWidth;
    v.layer.cornerRadius = kReferBtnCornerRadius;
    v.layer.masksToBounds = YES;
}


void setTestLayborder(UIView *v)
{
    v.layer.borderColor = [[UIColor blueColor]CGColor];
    v.layer.borderWidth = 0.8;
}
void setDefaultRadiusForView(UIView *v)
{
    v.layer.cornerRadius = 5;
    v.clipsToBounds = YES;
}

void setDefaultBorderForView(UIView *v)
{
    v.layer.borderColor = [[UIColor grayColor]CGColor];
    v.layer.borderWidth = 0.5;
}


void setBlackBorderAndRadiusForView(UIView *v)
{
    v.layer.borderColor = [[UIColor blackColor]CGColor];
    v.layer.borderWidth = 0.7;
    v.layer.cornerRadius = 5;
    v.clipsToBounds = YES;
}



void setBorderAndRadiusForView(UIView *v,UIColor *color)
{
    v.layer.borderColor = [color CGColor];
    v.layer.borderWidth = 0.7;
    v.layer.cornerRadius = 5;
    v.clipsToBounds = YES;
}


void setRefBorderAndRadiusForView(UIView *v,UIColor *color)
{
    v.layer.borderColor = [color CGColor];
    v.layer.borderWidth = kReferBtnCornerWidth;
    v.layer.cornerRadius = kReferBtnCornerRadius;
    v.layer.masksToBounds = YES;
}

//打印view
void dumpView(UIView *aView,int indent,NSMutableString *outstring)
{
    for (int i = 0; i < indent; i++) [outstring appendString:@"--"];
    
    
   
    [outstring appendFormat:@"[%2d] %@ frame:%@\n", indent, [[aView class] description], NSStringFromCGRect(aView.frame)];
    for (UIView *view in [aView subviews])
        dumpView(view,indent + 1,outstring);
}

// Start the tree recursion at level 0 with the root view   [self displayViews:self.window]);
NSString *displayViews(UIView * aView)
{
    NSMutableString *outstring = [[NSMutableString alloc] init];
    dumpView(aView,0,outstring);
    
    NSLog(@"%@",outstring);
    return outstring ;
}




//创建一个label，占一行
UILabel *createLabel(UIView *baseView,CGFloat beginX,CGFloat beginY,CGFloat tHeight,UIFont *font,UIColor *color,NSTextAlignment alignment)
{

    //第一行左边
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(beginX, beginY, baseView.frame.size.width - 2 * beginX, tHeight)];
    if (font)
    {
        label.font = font;
    }

    label.textColor =   color;
    label.textAlignment = alignment;
    [baseView addSubview:label];

    return label;
}



UILabel *createLabelWithFrame(UIView *baseView,CGRect rect,UIFont *font,UIColor *color,NSTextAlignment alignment)
{
    
    //第一行左边
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    
    if (font)
    {
        label.font = font;
    }
    
    label.textColor =   color;
    label.textAlignment = alignment;
    [baseView addSubview:label];
    
    return label;
}


void setLabel(UILabel *label, UIFont *font,UIColor *color,NSTextAlignment alignment)
{
    
    if (font)
    {
        label.font = font;
    }
    
    label.textColor =   color;
    label.textAlignment = alignment;

}




// 创建一个label描述和label，总宽度为 tWidth,alignment 为需要设置自负的label的字符对其方式
UILabel *createDesAndLabel(UIView *baseView,CGFloat beginX,CGFloat beginY,CGFloat tHeight,CGFloat tWidth,UIFont *font,CGFloat tHMargin ,UIColor *desColor,UIColor *contentColor,NSTextAlignment alignment)
{

    CGFloat childLabelDesW = tWidth * 0.4;
    CGFloat childLabelW = tWidth * 0.58 ;
    UILabel *labelDes = [[UILabel alloc]initWithFrame:CGRectMake(beginX + tHMargin  , beginY,childLabelDesW, tHeight)];
    labelDes.font = font;
    labelDes.textAlignment = NSTextAlignmentLeft;
    if (desColor) {
        labelDes.textColor = desColor;
    }
    [baseView addSubview:labelDes];

    //间隔为2
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(beginX + tHMargin + childLabelDesW +2 , beginY,childLabelW, tHeight)];
    label.font = font;
    label.textAlignment = alignment;
    if (contentColor) {
        label.textColor = contentColor;
    }
    [baseView addSubview:label];
    return label;
}


//创建一个field，占一行
UITextField *createField(UIView *baseView,CGRect frame,UIFont *font,UIColor *color,NSTextAlignment alignment)
{
    
    //第一行左边
    UITextField *field = [[UITextField alloc]initWithFrame:frame];
    if (font)
    {
        field.font = [UIFont boldSystemFontOfSize:17];
    }
    
    field.textColor =   color;
    field.textAlignment = alignment;
    [baseView addSubview:field];
    
    return field;
}

// 创建一个label描述和一个field，总宽度为 tWidth,alignment 为需要设置自负的label的字符对其方式
UITextField *createDesAndField(UIView *baseView,CGFloat beginX,CGFloat beginY,CGFloat tHeight,CGFloat tWidth,UIFont *font,CGFloat tHMargin ,UIColor *desColor,UIColor *contentColor,NSTextAlignment alignment)
{
    
    CGFloat childLabelDesW = tWidth * 0.4;
    CGFloat childLabelW = tWidth * 0.58 ;
    UILabel *labelDes = [[UILabel alloc]initWithFrame:CGRectMake(beginX + tHMargin  , beginY,childLabelDesW, tHeight)];
    labelDes.font = font;
    labelDes.textAlignment = NSTextAlignmentLeft;
    if (desColor) {
        labelDes.textColor = desColor;
    }
    [baseView addSubview:labelDes];
    
    //间隔为2
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(beginX + tHMargin + childLabelDesW +2 , beginY,childLabelW, tHeight)];
    field.font = font;
    field.textAlignment = alignment;
    if (contentColor) {
        field.textColor = contentColor;
    }
    [baseView addSubview:field];
    return field;
}


//创建一个btn，减少设置颜色和文字代码的输入，只需要调整参数
UIButton *createBtn(CGRect rect,NSString *normalText,NSString *hightText,UIColor *nC,UIColor *hC)
{
    UIButton * btn = [[UIButton alloc] initWithFrame:rect];
    
    [btn setTitle:normalText forState:UIControlStateNormal];
    if (hightText == nil) {
        hightText = normalText;
    }
    [btn setTitle:hightText forState:UIControlStateHighlighted];
    [btn setTitle:hightText forState:UIControlStateSelected];
    [btn setTitleColor:nC forState:UIControlStateNormal];
    [btn setTitleColor:hC forState:UIControlStateHighlighted];
    [btn setTitleColor:hC forState:UIControlStateSelected];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    
    return btn;
   
}

//创建一个imageview,减少代码的重复输写
UIImageView *createImageView(UIView *baseView,CGRect rect,UIViewContentMode contentMode)
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    imageView.contentMode = contentMode;
    [baseView addSubview:imageView];
    
    return imageView;
}


UIButton * setBackNavItemForController(UIViewController *vc)
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    CGFloat btnWidth = 30;
    CGFloat btnHeight = 30;
    //        UIImage *image = [UIImage resizedImageWithCapInsets:@"left_jiantou_white" left:40 right:2 top:14 botton:14];
    
    //        UIImage *image = [UIImage imageNamed:@"jiantouBlack"];
    UIImage *image = [UIImage imageNamed:kBackImageStr];
    
    
    //        UIImage *image2 = [image TransformtoSize:CGSizeMake(btnWidth, btnWidth)];
    
    btn.frame=CGRectMake(0, 0, btnWidth, btnHeight);
    
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:image forState:UIControlStateHighlighted];

    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    vc.navigationItem.leftBarButtonItem = backItem;
    
    return btn;
    
}





CGFloat getWidthBase(NSString *str,CGFloat maxW,UIFont *font)
{
    CGSize fontSize = [str sizeWithFont:font];
    if (fontSize.width < maxW) {
        return fontSize.width;
    }
    
    return maxW;
}


CGFloat getHeightBase(NSString *str,CGFloat maxW,CGFloat rowH,UIFont *font)
{
    CGSize fontSize = [str sizeWithFont:font constrainedToSize:CGSizeMake(maxW, MAXFLOAT)];
    
    NSInteger beishu = (fontSize.height + rowH - 1) / rowH;
    
    return beishu * rowH;
}

UIView *getFooterHeaderViewWithWidth(CGFloat width)
{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width,kProductDetailSectionMargin)];

    footerView.backgroundColor =  WGSectionMarginColor; //WGGrayWhiteColor;

    return footerView;
}

//- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

UIButton* setLeftNavBtnAndTitle(UIViewController *vc,NSString *btnPic,NSString *titleStr,id target,SEL method1)
{
    
    
    CGFloat leftRightW = 100;
    CGFloat leftRightH = 44;
    
    CGFloat btnWidth = 48;
    CGFloat btnMargin = 1;
//    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(-20, 0, btnWidth + btnMargin + leftRightW, 44)];
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(-20, 0, btnWidth, 44)];
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, btnWidth, 44)];
    
    
    if (btnPic)
    {
        [btn1 setImage:[UIImage imageNamed:btnPic] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:btnPic] forState:UIControlStateHighlighted];
    }
    
    
    
    //    [btn1 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft]; //图片显示在左边
    [btn1 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter]; //图片显示在左边
    btn1.backgroundColor = [UIColor clearColor];

    [btn1 addTarget:target action:method1 forControlEvents:UIControlEventTouchUpInside];
    
    
    //    setTestLayborder(leftView);
    
    [leftView addSubview:btn1];
    
    
    //左边的bar item
    
    if (titleStr && ![titleStr isEqualToString:@""])
    {
        UIFont *labelFont = [UIFont systemFontOfSize:22];
        //    CGSize fontSize = [str sizeWithFont:labelFont];
        
        setFrameWidth(leftView, btnWidth + btnMargin + leftRightW);
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(btnWidth + btnMargin, 0, leftRightW, leftRightH)];
        label.text = titleStr;
        label.font = labelFont;
        label.textColor = WGWhiteSmoke;
        label.backgroundColor = [UIColor clearColor];
        [leftView addSubview:label];
    }
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -16;
    
    UIBarButtonItem *leftBarItem =  [[UIBarButtonItem alloc]initWithCustomView:leftView];
    
    vc.navigationItem.leftBarButtonItems = @[negativeSpacer,leftBarItem];
    
    return btn1;
}


UIButton* setRightNavBtnAndTitle(UIViewController *vc,NSString *btn1Pic,NSString *btn1Title,NSString *btn2Pic,NSString *btn2Title,id target,SEL method1,SEL method2)
{
    

    
    CGFloat btnWidth = 48;
    CGFloat btnMargin = 1;
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    
    //    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(-20, 0, btnWidth + btnMargin + leftRightW, 44)];
    
    CGFloat totalW = 2 * btnWidth + btnMargin;
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(bounds.size.width - totalW - 10, 0, totalW, 44)];
    
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(totalW - btnWidth, 0, btnWidth, 44)];
    
    
    if (btn1Pic)
    {
        [btn1 setImage:[UIImage imageNamed:btn1Pic] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:btn1Pic] forState:UIControlStateHighlighted];
    }
    else if (btn1Title)
    {
        [btn1 setTitle:btn1Title forState:UIControlStateNormal];
        [btn1 setTitle:btn1Title forState:UIControlStateHighlighted];

    }
    
    
    //    [btn1 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft]; //图片显示在左边
    [btn1 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter]; //图片显示在左边
    btn1.backgroundColor = [UIColor clearColor];
    
    [btn1 addTarget:target action:method1 forControlEvents:UIControlEventTouchUpInside];
    
    
    //    setTestLayborder(leftView);
    
    [leftView addSubview:btn1];
    
    
    //左边的bar item
    
    if ((btn2Pic && ![btn2Pic isEqualToString:@""])  || (btn2Title && ![btn2Title isEqualToString:@""]))
    {

        //    CGSize fontSize = [str sizeWithFont:labelFont];
        
//        setFrameWidth(leftView, btnWidth + btnMargin + leftRightW);
        
        UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, btnWidth, 44)];

        if (btn2Pic)
        {
            [btn2 setImage:[UIImage imageNamed:btn2Pic] forState:UIControlStateNormal];
            [btn2 setImage:[UIImage imageNamed:btn2Pic] forState:UIControlStateHighlighted];
        }
        else if (btn2Title)
        {
            [btn2 setTitle:btn2Title forState:UIControlStateNormal];
            [btn2 setTitle:btn2Title forState:UIControlStateHighlighted];
            
        }
        
        
    }
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -16;
    
    UIBarButtonItem *leftBarItem =  [[UIBarButtonItem alloc]initWithCustomView:leftView];
    
    vc.navigationItem.rightBarButtonItems = @[negativeSpacer,leftBarItem];
    
    return btn1;
}




void adjustLabelHight(UILabel *label,CGFloat baseRowH,CGFloat maxH)
{
    
    
    
    CGSize size = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(label.frame.size.width,MAXFLOAT)];
    
    CGFloat height = size.height;
    
    NSInteger beiShu = (height + baseRowH - 1) / baseRowH;
    height = beiShu * baseRowH;
    
    if (size.height >= maxH)
    {
        height = maxH;
    }
    setFrameHeight(label, height);
}


BOOL checkStr(NSString *str)
{
    if (str && ![str isEqualToString:@""]) {
        return YES;
    }
    
    return NO;
    
}



//调整label的高度
CGFloat heightForLabel(UILabel *label,NSInteger maxCol)
{
    UILabel *label3 = label;
    CGRect rect = [label.text boundingRectWithSize:CGSizeMake(label3.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label3.font} context:nil];
    
    CGFloat height = label3.frame.size.height;
    if (rect.size.height > label3.frame.size.height)
    {
//        height = maxCol * height;
        height = rect.size.height + 10; //高度太小了，有时第2行显示不出来
        label3.numberOfLines = maxCol;
        setFrameHeight(label3, height);
    }
    return height;
}

//判断字符串是否越界  如果string的宽度超过width的值，返回真
BOOL checkStringOutWidth(NSString *string,UIFont *font,CGFloat width)
{
    CGSize textSize = [string sizeWithAttributes:@{ NSFontAttributeName : font }];
    if(textSize.width > width)
    {
        return YES;
    }
    return NO;
}



UIView *getEmptyPlaceHolderView(UIView *baseView,UIView *distintView,NSString *content,NSString *pic)
{
    if (distintView == nil)
    {
        UIView *view = [[UIView alloc]init];
        
        //        view.backgroundColor = [UIColor blueColor];
        
        
        view.frame = CGRectMake(0, 0, baseView.frame.size.width, baseView.frame.size.height);
        
//        CGFloat imageWH = 60;
        //        UIImageView *imageView =  createImageView(view, CGRectMake((view.ddWidth - imageWH) / 2.0, view.ddHeight *0.25 - imageWH, imageWH, imageWH), UIViewContentModeScaleAspectFit);
        //        imageView.image = [UIImage imageNamed:@"bear.jpg"];
        //
        //        setTestLayborder(imageView);
        
        CGFloat width = baseView.frame.size.width;
        CGFloat hMargin = 20;
//        CGFloat vMargin = 20;
        
        CGFloat startY = view.frame.size.height / 2.0 - 15;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(hMargin, startY, width - 2 *hMargin, 30)];
        
        label.text =  content;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = WGHintColor;
        
        //        label.backgroundColor = [UIColor redColor];
        [view addSubview:label];
        distintView= view;

    }
    [baseView addSubview:distintView];
    
    return distintView;
}





//{"DataList":[{"GoodsClassName":"母婴<i>•<\/i>玩具"
NSString *processCategoryStr(NSString *str)
{
   return  [str stringByReplacingOccurrencesOfString:@"<i>•</i>" withString:@""];
}


UILabel *getDeliveryLabel(CGFloat x,CGFloat y,CGFloat h,NSString *str)
{
    UIFont *font = [UIFont boldSystemFontOfSize:15];
    
    CGSize size = [str sizeWithFont:font];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x, y, size.width + 15, h)];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = kDeliveryBackGroundColor;
//    label.layer.borderColor = [kDeliveryBackGroundColor CGColor];
//    label.layer.borderWidth = 0.8;
    label.layer.cornerRadius = h / 2.0;
    label.layer.masksToBounds = YES;
    
    label.text = str;
    return label;
    
}

NSString *generateDateString(NSString *extentName)
{
    
    //转换时间格式
    
    NSDateFormatter*df2 = [[NSDateFormatter alloc]init];//格式化
    
    [df2 setDateFormat:@"yyyyMMddHHmmss"];
    
    [df2 setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    
    NSDate *date = [NSDate date];
    NSLog(@"%@",[df2 stringFromDate:date]);
    
    NSString *ret = [df2 stringFromDate:date];
    
    NSInteger  number = arc4random_uniform(1000);
    return [NSString stringWithFormat:@"%@%zd.%@",ret,number,extentName];
}
