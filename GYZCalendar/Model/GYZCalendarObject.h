//
//  GYZCalendarObject.h
//  GYZCalendar
//
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GYZCalendarModel.h"

/**
 *  日历显示的月数
 */
typedef NS_ENUM(NSInteger, CalendarShowType){
    /**
     *  只显示当月
     */
    CalendarShowTypeSingle,
    /**
     *  显示多个月数
     */
    CalendarShowTypeMultiple
};

@interface GYZCalendarObject : NSObject

-(NSMutableArray *)reloadCalendarView:(NSDate *)date selectDate:(NSDate *)selectDate needDays:(int)days showType:(CalendarShowType)type isEnable:(BOOL)isEnable isChineseCalendar:(BOOL)isChineseCalendar;

-(NSMutableArray *)reloadCalendarView:(NSDate *)date selectDate:(NSDate *)selectDate needDays:(int)days showType:(CalendarShowType)type isEnable:(BOOL)isEnable;

- (NSMutableArray *)reloadCalendarView:(NSDate *)date selectDate:(NSDate *)selectDate needDays:(int)days showType:(CalendarShowType)type;

- (void)selectLogic:(GYZCalendarModel *)dayModel;

@end
