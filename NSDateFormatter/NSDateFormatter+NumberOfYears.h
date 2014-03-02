#import <Foundation/Foundation.h>

@interface NSDateFormatter (NumberOfYears)

/** По году/месяцу/дню пользователя например:(1991-12-29) высчитывает количество лет. */
+ (NSString *)getNumberOfYearsSetBirthdayDate:(NSString *)birthday;

@end
