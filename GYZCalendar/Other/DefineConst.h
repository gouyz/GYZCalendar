//
//  DefineConst.h
//  GYZCalendar
//  定义常量
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#ifndef DefineConst_h
#define DefineConst_h

#define Main_Screen_Width  [[UIScreen mainScreen] bounds].size.width  //主屏幕的宽度
#define Main_Screen_Height [[UIScreen mainScreen] bounds].size.height //主屏幕的高度
#define CATDayLabelWidth  ([UIScreen mainScreen].bounds.size.width/7)

//RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define FontRedColor                 UIColorFromRGB(0xfd5b20)//红色字体
#define FontBlackColor                 UIColorFromRGB(0x222222)//黑色字体
#define LINE_COLOR_GRAY               UIColorFromRGB(0xd7d7d7)//线（灰）
#define FontGaryColor                 UIColorFromRGB(0x999999)//灰色字体

#define kFont(x) [UIFont systemFontOfSize:x]




// View 坐标(x,y)和宽高(width,height)
#define X(v)               (v).frame.origin.x
#define Y(v)               (v).frame.origin.y
#define WIDTH(v)           (v).frame.size.width
#define HEIGHT(v)          (v).frame.size.height

#define MinX(v)            CGRectGetMinX((v).frame) // 获得控件屏幕的x坐标
#define MinY(v)            CGRectGetMinY((v).frame) // 获得控件屏幕的Y坐标

#define MidX(v)            CGRectGetMidX((v).frame) //横坐标加上到控件中点坐标
#define MidY(v)            CGRectGetMidY((v).frame) //纵坐标加上到控件中点坐标

#define MaxX(v)            CGRectGetMaxX((v).frame) //横坐标加上控件的宽度
#define MaxY(v)            CGRectGetMaxY((v).frame) //纵坐标加上控件的高度

#endif /* DefineConst_h */
