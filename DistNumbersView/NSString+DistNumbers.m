/*
 作者：  吴定如 <wudr@dist.com.cn>
 文件：  DistNumbersView.h
 版本：  1.0.0
 地址：  https://github.com/Damsir/DistNumbersView
 描述：  可冻结列的表格视图，类似Numbers(Mac)和Excel(Windows)
 */

#import "NSString+DistNumbers.h"

@implementation NSString (DistNumbers)

- (CGSize)dist_sizeWithFont:(UIFont *)font constraint:(CGSize)constraint {
    
    NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
    NSDictionary *attributes = @{ NSFontAttributeName: font };
    CGRect bounds = [self boundingRectWithSize:constraint options:options attributes:attributes context:nil];
    CGSize size = bounds.size;
    return size;
}

@end
