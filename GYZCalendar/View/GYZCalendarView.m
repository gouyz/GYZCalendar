//
//  GYZCalendarView.m
//  GYZCalendar
//  自定义日期选择控件
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#import "GYZCalendarView.h"
#import "GYZCalendarCollectionViewLayout.h"
#import "GYZCalendarMonthHeaderView.h"
#import "GYZCalendarCollectionCell.h"
#import "DefineConst.h"

@interface GYZCalendarView ()<UICollectionViewDataSource, UICollectionViewDelegate>
/**
 *  天数
 */
@property(nonatomic, assign) int days;
/**
 *  展示类型
 */
@property(nonatomic, assign) CalendarShowType type;
/**
 *  日期是否可点击  默认为NO
 */
@property(nonatomic, assign) BOOL isEnable;
/**
 *  是否展示农历  默认为NO
 */
@property(nonatomic, assign) BOOL isDisplayChineseCalendar;
@end

static NSString *MonthHeader = @"MonthHeaderView";

static NSString *DayCell = @"DayCell";

@implementation GYZCalendarView

- (NSMutableArray *)calendarMonth {
    if (!_calendarMonth) {
        _calendarMonth = [NSMutableArray array];
    }
    return _calendarMonth;
}

- (GYZCalendarObject *)calendarLogic {
    if (!_calendarLogic) {
        _calendarLogic = [[GYZCalendarObject alloc] init];
    }
    return _calendarLogic;
}

- (instancetype)initWithDays:(int)days showType:(CalendarShowType)type frame:(CGRect)frame selectEnable:(BOOL)isEnable showChineseCalendar:(BOOL)isDisplayChineseCalendar{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    self.days = days;
    self.type = type;
    self.isEnable = isEnable;
    self.isDisplayChineseCalendar = isDisplayChineseCalendar;
    
    [self initView];
    return self;
}
+ (instancetype)calendarWithDays:(int)days showType:(CalendarShowType)type frame:(CGRect)frame selectEnable:(BOOL)isEnable showChineseCalendar:(BOOL)isDisplayChineseCalendar{
    return [[self alloc] initWithDays:days showType:type frame:frame selectEnable:isEnable showChineseCalendar:isDisplayChineseCalendar];
}

-(void)initView{
    // 定义Layout对象
    GYZCalendarCollectionViewLayout *layout = [[GYZCalendarCollectionViewLayout alloc] init];
    
    // 初始化CollectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    
#if !__has_feature(objc_arc)
    [layout release];
#endif
    
    // 注册CollectionView的Cell
    [self.collectionView registerClass:[GYZCalendarCollectionCell class] forCellWithReuseIdentifier:DayCell];
    
    [self.collectionView registerClass:[GYZCalendarMonthHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MonthHeader];
    
    self.collectionView.bounces = NO;//将网格视图的下拉效果关闭
    
    self.collectionView.delegate = self;//实现网格视图的delegate
    
    self.collectionView.dataSource = self;//实现网格视图的dataSource
    
    self.collectionView.backgroundColor = LINE_COLOR_GRAY;
    
    [self addSubview:self.collectionView];
    
    self.calendarMonth = [self getMonthArrayOfDays:self.days showType:self.type isEnable:self.isEnable];
}

/**
 *  获取Days天数内的数组
 *
 *  @param days 天数
 *  @param type 显示类型
 *  @return 数组
 */
- (NSMutableArray *)getMonthArrayOfDays:(int)days showType:(CalendarShowType)type isEnable:(BOOL)isEnable
{
    NSDate *date = [NSDate date];
    
    NSDate *selectdate  = [NSDate date];
    //返回数据模型数组
    return [self.calendarLogic reloadCalendarView:date selectDate:selectdate needDays:days showType:type isEnable:isEnable isChineseCalendar:self.isDisplayChineseCalendar];
}

#pragma mark - CollectionView 数据源

// 返回组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.calendarMonth.count;
}
// 返回每组行数
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *arrary = [self.calendarMonth objectAtIndex:section];
    return arrary.count;
}

#pragma mark - CollectionView 代理

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GYZCalendarCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DayCell forIndexPath:indexPath];
    NSArray *months = [self.calendarMonth objectAtIndex:indexPath.section];
    GYZCalendarModel *model = [months objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        NSMutableArray *month_Array = [self.calendarMonth objectAtIndex:indexPath.section];
        GYZCalendarModel *model = [month_Array objectAtIndex:15];
        
        GYZCalendarMonthHeaderView *monthHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MonthHeader forIndexPath:indexPath];
        monthHeader.masterLabel.text = [NSString stringWithFormat:@"%lu年 %lu月",(unsigned long)model.year,(unsigned long)model.month];//@"日期";
        monthHeader.backgroundColor = [LINE_COLOR_GRAY colorWithAlphaComponent:0.8f];
        reusableview = monthHeader;
    }
    return reusableview;
    
}

- (void)collectionView:(nonnull UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSArray *months = [self.calendarMonth objectAtIndex:indexPath.section];
    GYZCalendarModel *model = [months objectAtIndex:indexPath.row];
    if (model.style == CellDayTypeClick || model.style == CellDayTypeFutur || model.style == CellDayTypeWeek) {
        [self.calendarLogic selectLogic:model];
        if (self.calendarBlock) {
            self.calendarBlock(model);
        }
    }
    [self.collectionView reloadData];
}

- (BOOL)collectionView:(nonnull UICollectionView *)collectionView shouldSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return YES;
}
@end
