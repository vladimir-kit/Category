#import "NSDateFormatter+DateFormatter.h"

@implementation NSDateFormatter (DateFormatter)

#pragma mark - Get Number Of Years
/** Год/месяц/день рождения пользователя. */
NSDate *dateAllDateUsers = nil;
/** Год рождения пользователя. */
NSString *stringYearsUsers = nil;
/** Месяц и день рождения пользователя. */
NSString *stringMounthAndDayUser = nil;
/** Количество лет пользователю. */
NSString *stringNumbersYearsUser = nil;

/** Сегодняшний год. */
NSString *stringTodayYear = nil;
/** Сегодняшний месяц и день. */
NSString *stringTodayMounthAndDay = nil;

/** Получаю полную дату рожения пользователя. */
+ (NSString *)getNumberOfYearsSetBirthdayDate:(NSString *)birthday; {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-M-dd"];
    dateAllDateUsers = [dateFormatter dateFromString:birthday];

    [self cause];

    return stringNumbersYearsUser;
}

/** Получает год рождения пользователя. */
+ (void)yearsUser {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    stringYearsUsers = [dateFormatter stringFromDate:dateAllDateUsers];
}

/** Получает месяц и день рождения пользователя. */
+ (void)mounthAndDayUser {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"Mdd"];
    stringMounthAndDayUser = [dateFormatter stringFromDate:dateAllDateUsers];
}

/** Получает сегодняшний год. */
+ (void)todayYear {
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy"];
    stringTodayYear = [dateFormatter stringFromDate:todayDate];
}

/** Получает сегодняшний месяц и день. */
+ (void)todayMounthAndDay {
    NSDate *todayDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"Mdd"];
    stringTodayMounthAndDay = [dateFormatter stringFromDate:todayDate];
}

/** Проверяю сегодняшнюю дату с датой рождения пользователя. */
+ (void)checkYear {
    if ([stringTodayMounthAndDay integerValue] == [stringMounthAndDayUser integerValue]) {
        [self notMinusYearUser];
    }
    else if ([stringTodayMounthAndDay integerValue] > [stringMounthAndDayUser integerValue]) {
        [self notMinusYearUser];
    }
    else if ([stringTodayMounthAndDay integerValue] < [stringMounthAndDayUser integerValue]) {
        [self minusYearUser];
    }
}

/** От текущего года отнимает год рождения пользователя и отнимает 1-цу. */
+ (void)minusYearUser {
    stringNumbersYearsUser = [NSString stringWithFormat:@"%d", [stringTodayYear integerValue] - [stringYearsUsers integerValue] - 1];
}

/** От текущего года отнимает год рождения пользователя. */
+ (void)notMinusYearUser {
    stringNumbersYearsUser = [NSString stringWithFormat:@"%d", [stringTodayYear integerValue] - [stringYearsUsers integerValue]];
}

/** Вызывает все необходимые методы, для подсчёта лет. */
+ (void)cause {
    [self yearsUser];
    [self mounthAndDayUser];
    [self todayYear];
    [self todayMounthAndDay];
    [self checkYear];
}

#pragma mark - 
+ (NSString *)todayDateTime {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

@end
