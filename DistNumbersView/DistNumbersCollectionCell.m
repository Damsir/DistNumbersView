/*
 作者：  吴定如 <wudr@dist.com.cn>
 文件：  DistNumbersView.h
 版本：  1.0.0
 地址：  https://github.com/Damsir/DistNumbersView
 描述：  可冻结列的表格视图，类似Numbers(Mac)和Excel(Windows)
 */

#import "DistNumbersCollectionCell.h"

@interface DistNumbersCollectionCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation DistNumbersCollectionCell

#pragma mark - Override
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

#pragma mark - Private
- (void)setup {
    [self.contentView addSubview:self.label];
}

- (void)updateFrame {
    _label.frame = CGRectMake(_textHorizontalMargin, 0, self.bounds.size.width - 2 * _textHorizontalMargin, self.bounds.size.height);
}

#pragma mark - Getter

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 0;
        _label.backgroundColor = [UIColor clearColor];
    }
    return _label;
}

#pragma mark - Setter
- (void)setTextHorizontalMargin:(CGFloat)textHorizontalMargin {
    if (_textHorizontalMargin != textHorizontalMargin) {
        _textHorizontalMargin = textHorizontalMargin;
        [self updateFrame];
    }
}

#pragma mark - public
- (void)setAttributedString:(NSAttributedString *)attributedString {
    _label.attributedText = attributedString;
}

@end
