//
//  GYZCalendarModel.m
//  GYZCalendar
//  日期数据model
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#import "GYZCalendarModel.h"
#import "NSDate+GYZCalendar.h"

@implementation GYZCalendarModel

- (instancetype)initWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day {
    self = [super init];
    if (!self) return nil;
    self.year = year;
    self.month = month;
    self.day = day;
    return self;
}

+ (instancetype)calendarWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day {
    return [[self alloc] initWithYear:year month:month day:day];
}

//返回当前天的NSDate对象
- (NSDate *)date
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.year = self.year;
    c.month = self.month;
    c.day = self.day;
    return [[NSCalendar currentCalendar] dateFromComponents:c];
}

//返回当前天的NSString对象
- (NSString *)toString
{
    NSDate *date = [self date];
    NSString *string = [date stringFromDate:date];
    return string;
}


//返回星期
- (NSString *)getWeek
{
    
    NSDate *date = [self date];
    
    NSString *week_str = [date compareIfTodayWithDate];
    
    return week_str;
}

@end
