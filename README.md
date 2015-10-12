# GYZCalendar
自定义日期选择日历,可以自定义显示天数

![image](https://github.com/gouyz/GYZCalendar/blob/master/demo1.png)
![image](https://github.com/gouyz/GYZCalendar/blob/master/demo2.png)


# 使用方法    

将项目下的Category、Model、Other、View等文件夹复制到项目中
导入对应头文件  #import "GYZCalendarView.h" 入口


创建对象   (有多种方法，具体看代码）
```
// CalendarShowTypeMultiple 显示多月
// CalendarShowTypeSingle   显示单月
GYZCalendarView *calendarView = [GYZCalendarView calendarWithDays:365 showType:CalendarShowTypeMultiple frame:self.view.frame selectEnable:YES showChineseCalendar:NO];

calendarView.calendarBlock = ^(GYZCalendarModel *model) {
NSLog(@"%lu-%lu-%lu",(unsigned long)model.year,(unsigned long)model.month,(unsigned long)model.day);
};

[self.view addSubview:calendarView];


#目录结构   
Category    一些扩展的方法       
Model       模型    
Other       资源    
View        视图