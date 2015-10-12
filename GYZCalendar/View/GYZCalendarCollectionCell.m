//
//  GYZCalendarCollectionCell.m
//  GYZCalendar
//
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#import "GYZCalendarCollectionCell.h"
#import "DefineConst.h"

@interface GYZCalendarCollectionCell()

/**
 *  显示日期
 */
@property (nonatomic, weak) UILabel *dayLabel;
/**
 *  显示农历
 */
@property (nonatomic, weak) UILabel *chineseCalendar;

@end

@implementation GYZCalendarCollectionCell
- (nonnull instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    [self initCellView];
    return self;
}

- (void)initCellView {
    
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height*0.6)];
    dayLabel.font = kFont(14);
    dayLabel.textAlignment = NSTextAlignmentCenter;
    self.dayLabel = dayLabel;
    [self addSubview:dayLabel];
    
    UILabel *chineseCalendar = [[UILabel alloc] initWithFrame:CGRectMake(X(dayLabel), MaxY(dayLabel), WIDTH(dayLabel), self.bounds.size.height*0.4)];
    chineseCalendar.font = kFont(9);
    chineseCalendar.textAlignment = NSTextAlignmentCenter;
    self.chineseCalendar = chineseCalendar;
    [self addSubview:chineseCalendar];
}

- (void)setModel:(GYZCalendarModel *)model {
    _model = model;

    self.chineseCalendar.text = model.Chinese_calendar;
    self.chineseCalendar.hidden = NO;
    /**
     *  如果不展示农历，则日期居中
     */
    if (!model.isChineseCalendar) {
        self.dayLabel.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    }
    
    switch (model.style) {
        case CellDayTypeEmpty:
            self.dayLabel.hidden = YES;
            self.chineseCalendar.hidden = YES;
            self.backgroundColor = [UIColor whiteColor];
            break;
        case CellDayTypePast:
            self.dayLabel.hidden = NO;
            if (model.holiday) {
                self.dayLabel.text = model.holiday;
//                self.dayLabel.width = self.bounds.size.width;
                self.chineseCalendar.hidden = YES;
            } else {
                self.dayLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
            }
            self.chineseCalendar.textColor = FontGaryColor;
            self.dayLabel.textColor = FontGaryColor;
            self.backgroundColor = [UIColor whiteColor];
            break;
            
        case CellDayTypeWeek:
            // 以下内容暂时无用  将来可以设置 周六 日 特殊颜色时 可用
            //            self.dayLabel.hidden = NO;
            //            self.selectImageView.hidden = YES;
            //            if (model.holiday) {
            //                self.dayLabel.text = model.holiday;
            //                self.dayLabel.textColor = COLOR_HIGHLIGHT;
            //            } else {
            //                self.dayLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
            //                self.dayLabel.textColor = COLOR_NOAML;
            //            }
            //            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CalendarNormalDate"]];
            //            self.chineseCalendar.textColor = [UIColor blackColor];
            //            break;
            
        case CellDayTypeFutur:
            self.dayLabel.hidden = NO;
            if (model.holiday) {
                self.dayLabel.text = model.holiday;
//                self.dayLabel.width = self.bounds.size.width;
//                self.chineseCalendar.hidden = YES;
                self.dayLabel.textColor = FontRedColor;
            } else {
                self.dayLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
                self.dayLabel.textColor = FontBlackColor;
            }
            self.chineseCalendar.textColor = [UIColor blackColor];
            self.backgroundColor = [UIColor whiteColor];
            break;
            
        case CellDayTypeClick:
            self.dayLabel.hidden = NO;
            self.backgroundColor = FontRedColor;
            self.dayLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
            self.dayLabel.textColor = [UIColor whiteColor];
            self.chineseCalendar.textColor = [UIColor whiteColor];
            break;
            
        default:
            break;
    }
    
}
@end
