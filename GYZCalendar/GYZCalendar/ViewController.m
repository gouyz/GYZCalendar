//
//  ViewController.m
//  GYZCalendar
//  自定义日期选择日历
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#import "ViewController.h"
#import "GYZCalendarView.h"
#import "DefineConst.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LINE_COLOR_GRAY;
    
    // CalendarShowTypeMultiple 显示多月
    // CalendarShowTypeSingle   显示单月
    GYZCalendarView *calendarView = [GYZCalendarView calendarWithDays:30 showType:CalendarShowTypeMultiple frame:self.view.frame selectEnable:YES showChineseCalendar:YES];
    
    calendarView.calendarBlock = ^(GYZCalendarModel *model) {
        NSLog(@"%lu-%lu-%lu",(unsigned long)model.year,(unsigned long)model.month,(unsigned long)model.day);
    };
    
    [self.view addSubview:calendarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
