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
        return delta == 1 ? NSLocalizedString(@"One second ago", nil) : [NSString stringWithFormat:@"%d %@", (int)delta, NSLocalizedString(@"Seconds ago", nil)];
    }
    if (delta < 2 * MINUTE) {
        return NSLocalizedString(@"A minute ago", nil);
    }
    if (delta < 45 * MINUTE) {
        int minutes = floor((double)delta/MINUTE);
        return [NSString stringWithFormat:@"%d %@", minutes, NSLocalizedString(@"Minutes ago", nil)];
    }
    if (delta < 90 * MINUTE) {
        return NSLocalizedString(@"An hour ago", nil);
    }
    if (delta < 24 * HOUR) {
        int hours = floor((double)delta/HOUR);
        return [NSString stringWithFormat:@"%d %@", hours, NSLocalizedString(@"Hours ago", nil)];
    }
    if (delta < 48 * HOUR) {
        return NSLocalizedString(@"Yesterday", nil);
    }
    if (delta < 30 * DAY) {
        int days = floor((double)delta/DAY);
        return [NSString stringWithFormat:@"%d %@", days, NSLocalizedString(@"Days ago", nil)];
    }
    if (delta < 12 * MONTH) {
        int months = floor((double)delta/MONTH);
        return months <= 1 ? NSLocalizedString(@"One month ago", nil) : [NSString stringWithFormat:@"%d %@", months, NSLocalizedString(@"months_ago", nil)];
    }
    else {
        int years = floor((double)delta/MONTH/12.0);
        return years <= 1 ? NSLocalizedString(@"One year ago", nil) : [NSString stringWithFormat:@"%d %@", years, NSLocalizedString(@"Years ago", nil)];
    }
}

@end
