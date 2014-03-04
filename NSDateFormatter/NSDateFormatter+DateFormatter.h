#import <Foundation/Foundation.h>

@interface NSDateFormatter (DateFormatter)

/** По году/месяцу/дню пользователя например:(1991-12-29) высчитывает количество лет. */
+ (NSString *)getNumberOfYearsSetBirthdayDate:(NSString *)birthday;

+ (NSString *)todayDateTime;

@end
