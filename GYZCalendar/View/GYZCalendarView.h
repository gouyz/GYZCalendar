//
//  GYZCalendarView.h
//  GYZCalendar
//
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYZCalendarObject.h"


/**
 *  选中日期，回掉结果
 *
 *  @param model 返回模型
 */
typedef void (^CalendarBlock)(GYZCalendarModel *model);

@interface GYZCalendarView : UIView

/**
 *  UICollectionView 对象，用于显示布局，类似UITableView
 */
@property(nonatomic ,strong) UICollectionView* collectionView;
/**
 *  用于存放日期模型数组
 */
@property(nonatomic ,strong) NSMutableArray *calendarMonth;
/**
 *  逻辑处理
 */
@property(nonatomic ,strong) GYZCalendarObject *calendarLogic;
/**
 *  回调
 */
@property(nonatomic, copy) CalendarBlock calendarBlock;

/**
 *  初始化对象
 *
 *  @param days                     显示总天数，默认365天,可根据需要自定义天数
 *  @param type                     显示类型，详细请见 枚举的定义
 *  @param frame                    显示位置
 *  @param isEnable                 是否可点击
 *  @param isDisplayChineseCalendar 是否显示农历
 *
 *  @return 当前对象
 */
- (instancetype)initWithDays:(int)days showType:(CalendarShowType)type frame:(CGRect)frame selectEnable:(BOOL)isEnable showChineseCalendar:(BOOL)isDisplayChineseCalendar;

+ (instancetype)calendarWithDays:(int)days showType:(CalendarShowType)type frame:(CGRect)frame selectEnable:(BOOL)isEnable showChineseCalendar:(BOOL)isDisplayChineseCalendar;


@end
