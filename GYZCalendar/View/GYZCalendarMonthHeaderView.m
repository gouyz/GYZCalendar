//
//  GYZCalendarMonthHeaderView.m
//  GYZCalendar
//  头部 显示年月
//  Created by wito on 15/10/12.
//  Copyright © 2015年 gouyz. All rights reserved.
//

#import "GYZCalendarMonthHeaderView.h"
#import "DefineConst.h"

@implementation GYZCalendarMonthHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initWithHeader];
    }
    return self;
}

- (void)initWithHeader
{
    self.clipsToBounds = YES;
    CGFloat headerWidth = Main_Screen_Width;
    //月份
    UILabel *masterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 10.0f, headerWidth, 30.f)];
    [masterLabel setTextAlignment:NSTextAlignmentCenter];
    [masterLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17.0f]];
    self.masterLabel = masterLabel;
    self.masterLabel.textColor = FontBlackColor;
    [self addSubview:self.masterLabel];
    CGFloat yOffset = 45.0f;
    NSArray *textArray = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    for (int i = 0; i < textArray.count; i++) {
        UIColor *color = FontBlackColor;
        if (i == 0 || i== 6) {
            color = FontRedColor;
        }
        [self initHeaderWeekText:textArray[i] titleColor:color x:CATDayLabelWidth * i y:yOffset];
    }
    
}

// 初始化数据
- (void)initHeaderWeekText:(NSString *)text titleColor:(UIColor *)color x:(CGFloat)x y:(CGFloat)y {
    UILabel *titleText = [[UILabel alloc]initWithFrame:CGRectMake(x, y, CATDayLabelWidth, 20.0f)];
    [titleText setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f]];
    titleText.textAlignment = NSTextAlignmentCenter;
    titleText.textColor = color;
    titleText.text = text;
    [self addSubview:titleText];
}
@end
