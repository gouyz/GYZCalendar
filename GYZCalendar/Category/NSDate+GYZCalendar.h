//
//  NSDate+GYZCalendar.h
//  GYZCalendar
//
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GYZCalendar)
/**
 *  计算这个月有多少天
 *
 *  @return 天数
 */
- (NSUInteger)numberOfDaysInCurrentMonth;
/**
 *  获取这个月有多少周
 *
 *  @return 周数
 */
- (NSUInteger)numberOfWeeksInCurrentMonth;
/**
 *  计算这个月的第一天是礼拜几
 *
 *  @return 礼拜几
 */
- (NSUInteger)weeklyOrdinality;
/**
 *  计算这个月最开始的一天
 *
 *  @return 最开始的一天
 */
- (NSDate *)firstDayOfCurrentMonth;
/**
 *  计算这个月最后的一天
 *
 *  @return 最后的一天
 */
- (NSDate *)lastDayOfCurrentMonth;
/**
 *  上一个月
 *
 *  @return 上一个月
 */
- (NSDate *)dayInThePreviousMonth;
/**
 *  下一个月
 *
 *  @return 下一个月
 */
- (NSDate *)dayInTheFollowingMonth;
/**
 *  获取当前日期之后的几个月
 *
 *  @param month 当前月
 *
 *  @return 当前日期之后的几个月
 */
- (NSDate *)dayInTheFollowingMonth:(int)month;
/**
 *  获取当前日期之后的几天
 *
 *  @param day 当前天
 *
 *  @return 当前日期之后的几天
 */
- (NSDate *)dayInTheFollowingDay:(int)day;
/**
 *  获取年月日对象
 *
 *  @return 年月日对象
 */
- (NSDateComponents *)YMDComponents;
/**
 *  NSString转NSDate
 *
 *  @param dateString 日期字符串
 *
 *  @return 日期
 */
- (NSDate *)dateFromString:(NSString *)dateString;
/**
 *  NSDate转NSString
 *
 *  @param date 日期
 *
 *  @return 日期字符串
 */
- (NSString *)stringFromDate:(NSDate *)date;
/**
 *  两个日期之间相差多少月
 *
 *  @param today    第一个日期
 *  @param beforday 第二个日期
 *
 *  @return 两个日期之间相差多少月
 */
+ (int)getDayNumbertoDay:(NSDate *)today beforDay:(NSDate *)beforday;
/**
 *  周日是“1”，周一是“2”...
 *
 *  @return
 */
-(int)getWeekIntValueWithDate;



/**
 *  判断日期是今天,明天,后天,周几
 *
 *  @return
 */
-(NSString *)compareIfTodayWithDate;
/**
 *  通过数字返回星期几
 *
 *  @param week 周日是“1”，周一是“2”...
 *
 *  @return
 */
+(NSString *)getWeekStringFromInteger:(int)week;


@end
