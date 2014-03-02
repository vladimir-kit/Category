//
//  NSDate+Date.m
//  test
//
//  Created by Alex on 3/2/14.
//  Copyright (c) 2014 Alex. All rights reserved.
//

//#define SECOND 1
//#define MINUTE (60 * SECOND)
//#define HOUR (60 * MINUTE)
//#define DAY (24 * HOUR)
//#define MONTH (30 * DAY)

#import "NSDate+Date.h"

@implementation NSDate (Date)

#pragma mark - Get Seconds/Minutes/Hours/Days Interval

#define SECOND 1
#define MINUTE (60 * SECOND)
#define HOUR (60 * MINUTE)
#define DAY (24 * HOUR)
#define MONTH (30 * DAY)

/** Принимает дату в формате строки [yyy-M-dd hh:mm:ss] возвращает количество сукунд/минут/дней назад. */
+ (NSString *)timeIntervalWithStartDate:(NSString *)date1 {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSDate *d1 = [dateFormatter dateFromString:date1];
    NSDate *d2 = [NSDate date];

    NSTimeInterval delta = [d2 timeIntervalSinceDate:d1];

    if (delta < 1 * MINUTE) {
        return delta == 1 ? NSLocalizedString(@"one_second_ago", nil) : [NSString stringWithFormat:@"%d %@", (int)delta, NSLocalizedString(@"seconds_ago", nil)];
    }
    if (delta < 2 * MINUTE) {
        return NSLocalizedString(@"a_minute_ago", nil);
    }
    if (delta < 45 * MINUTE) {
        int minutes = floor((double)delta/MINUTE);
        return [NSString stringWithFormat:@"%d %@", minutes, NSLocalizedString(@"minutes_ago", nil)];
    }
    if (delta < 90 * MINUTE) {
        return NSLocalizedString(@"an_hour_ago", nil);
    }
    if (delta < 24 * HOUR) {
        int hours = floor((double)delta/HOUR);
        return [NSString stringWithFormat:@"%d %@", hours, NSLocalizedString(@"hours_ago", nil)];
    }
    if (delta < 48 * HOUR) {
        return NSLocalizedString(@"YESTERDAY", nil);
    }
    if (delta < 30 * DAY) {
        int days = floor((double)delta/DAY);
        return [NSString stringWithFormat:@"%d %@", days, NSLocalizedString(@"days_ago", nil)];
    }
    if (delta < 12 * MONTH) {
        int months = floor((double)delta/MONTH);
        return months <= 1 ? NSLocalizedString(@"one_month_ago", nil) : [NSString stringWithFormat:@"%d %@", months, NSLocalizedString(@"months_ago", nil)];
    }
    else {
        int years = floor((double)delta/MONTH/12.0);
        return years <= 1 ? NSLocalizedString(@"one_year_ago", nil) : [NSString stringWithFormat:@"%d %@", years, NSLocalizedString(@"years_ago", nil)];
    }
}

@end
