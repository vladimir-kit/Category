#import <UIKit/UIKit.h>

@interface UIImage (Image)

/** Mеняет размер изображения. */
+ (UIImage *)imageWithResizeImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
