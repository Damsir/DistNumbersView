/*
 作者：  吴定如 <wudr@dist.com.cn>
 文件：  DistNumbersView.h
 版本：  1.0.0
 地址：  https://github.com/Damsir/DistNumbersView
 描述：  可冻结列的表格视图，类似Numbers(Mac)和Excel(Windows)
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (DistNumbers)

- (CGSize)dist_sizeWithFont:(UIFont *)font constraint:(CGSize)constraint;

@end
