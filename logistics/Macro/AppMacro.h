//
//  AppMacro.h
//  logistics
//
//  Created by wgyp on 16/3/3.
//  Copyright © 2016年 dqxu. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

// 1.判断是否为iOS7
#define IOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)


// 2.获得RGB颜色
#define DQColor(r,g,b) [UIColor colorWithRed:r/ 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]

#define GlobalBG DQColor(255,255,255)
#define kNavgationH 64

#define Gray101Color DQColor(236,240,242)

#define Gray91Color DQColor(232,232,232)// gray91  232 232 232

#define Gray81Color DQColor(207,207,207)//gray81 	207 207 207

#define Gray71Color DQColor(181,181,181)//grey71 	181 181 181 	#B5B5B5

#define Gray61Color DQColor(156,156,156) // grey61      //156

//#define kCustomTopMargin  (([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)? (0) :(0)) //无渲染时


#define kLineViewW 0.52
#define kLineColor  DQColor(240,240,240)


#endif /* AppMacro_h */
