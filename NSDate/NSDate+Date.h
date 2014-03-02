#import <Foundation/Foundation.h>

@interface NSDate (Date)

/** Принимает дату в формате строки [yyy-M-dd hh:mm:ss] возвращает количество сукунд/минут/дней назад. */
+ (NSString *)timeIntervalWithStartDate:(NSString *)date1;

@end
