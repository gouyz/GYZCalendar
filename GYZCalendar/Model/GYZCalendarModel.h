//
//  GYZCalendarModel.h
//  GYZCalendar
//
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, CellDayType) {
    CellDayTypeEmpty,   //不显示
    CellDayTypePast,    //过去的日期
    CellDayTypeFutur,   //将来的日期
    CellDayTypeWeek,    //周末
    CellDayTypeClick    //被点击的日期
    
};

@interface GYZCalendarModel : NSObject

/**
 *  显示样式
 */
@property (assign, nonatomic) CellDayType style;
/**
 *  年
 */
@property (nonatomic, assign) NSUInteger year;
/**
 *  月
 */
@property (nonatomic, assign) NSUInteger month;
/**
 *  周
 */
@property (nonatomic, assign) NSUInteger week;
/**
 *  日
 */
@property (nonatomic, assign) NSUInteger day;

/**
 *  判断如果当前日期，是否可以被点击
 */
@property (nonatomic, assign) BOOL isEnable;

@property (nonatomic, strong) NSString *Chinese_calendar;//农历
@property (nonatomic, assign) BOOL isChineseCalendar;
@property (nonatomic, strong) NSString *holiday;//节日


+ (instancetype)calendarWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;
- (instancetype)initWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;
- (NSDate *)date;//返回当前天的NSDate对象
- (NSString *)toString;//返回当前天的NSString对象
- (NSString *)getWeek; //返回星期

@end
