@interface UIImage (ImageResize)

/** Mеняет размер изображения. */
+ (UIImage *)imageWithResizeImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
