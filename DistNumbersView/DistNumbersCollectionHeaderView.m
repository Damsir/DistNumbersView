/*
 作者：  吴定如 <wudr@dist.com.cn>
 文件：  DistNumbersView.h
 版本：  1.0.0
 地址：  https://github.com/Damsir/DistNumbersView
 描述：  可冻结列的表格视图，类似Numbers(Mac)和Excel(Windows)
 */

#import "DistNumbersCollectionHeaderView.h"

@interface DistNumbersCollectionHeaderView ()

@property (nonatomic, strong) CAShapeLayer *rowSeparatorLayer;

@end

@implementation DistNumbersCollectionHeaderView

#pragma mark - override
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrame];
}

#pragma mark - private
- (void)setup {
    self.backgroundColor = [UIColor clearColor];
    [self.layer addSublayer:self.rowSeparatorLayer];
}

- (void)updateFrame {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.bounds.size.height/2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height/2)];
    
    _rowSeparatorLayer.path = path.CGPath;
}

#pragma mark - getter
- (CAShapeLayer *)rowSeparatorLayer {
    if (!_rowSeparatorLayer) {
        _rowSeparatorLayer = [CAShapeLayer layer];
        _rowSeparatorLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        _rowSeparatorLayer.lineWidth = 1;
    }
    return _rowSeparatorLayer;
}

#pragma mark - setter

- (void)setRowSeparatorStyle:(DistNumbersSeparatorStyle)rowSeparatorStyle {
    if (_rowSeparatorStyle != rowSeparatorStyle) {
        _rowSeparatorStyle = rowSeparatorStyle;
        
        _rowSeparatorLayer.hidden = NO;
        [self layoutIfNeeded];
        if (rowSeparatorStyle == DistNumbersSeparatorStyleNone) {
            _rowSeparatorLayer.hidden = YES;
        } else if (rowSeparatorStyle == DistNumbersSeparatorStyleDotted) {
            _rowSeparatorLayer.lineDashPattern = @[@2];
        } else if (rowSeparatorStyle == DistNumbersSeparatorStyleSolid){
            _rowSeparatorLayer.lineDashPattern = nil;
        }
    }
}

- (void)setRowSeparatorColor:(UIColor *)rowSeparatorColor {
    if (_rowSeparatorColor != rowSeparatorColor) {
        _rowSeparatorColor = rowSeparatorColor;
        
        _rowSeparatorLayer.strokeColor = rowSeparatorColor.CGColor;
    }
}

@end
