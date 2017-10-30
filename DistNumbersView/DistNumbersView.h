/*
 作者：  吴定如 <wudr@dist.com.cn>
 文件：  DistNumbersView.h
 版本：  1.0.0
 地址：  https://github.com/Damsir/DistNumbersView
 描述：  可冻结列的表格视图，类似Numbers(Mac)和Excel(Windows)
 */

#import <UIKit/UIKit.h>
#import "DistNumbersViewEnum.h"

NS_ASSUME_NONNULL_BEGIN

@class DistNumbersView;

@protocol DistNumbersViewDataSource<NSObject>

@required
- (NSInteger)numberOfRowsInNumbersView:(DistNumbersView *)numbersView;
- (NSInteger)numberOfColumnsInNumbersView:(DistNumbersView *)numbersView;
- (__kindof NSAttributedString * _Nullable)numbersView:(DistNumbersView *)numbersView attributedStringForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
- (__kindof UICollectionViewCell * _Nullable)numbersView:(DistNumbersView *)numbersView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@protocol DistNumbersViewDelegate <NSObject>

@optional
- (CGFloat)numbersView:(DistNumbersView *)numbersView heightForRow:(NSInteger)row;
- (CGFloat)numbersView:(DistNumbersView *)numbersView widthForColumn:(NSInteger)column;
- (void)numbersView:(DistNumbersView *)numbersView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

///automatic caculate width, base on text length and textHorizontalMargin
UIKIT_EXTERN const CGFloat DistNumbersViewAutomaticDimension;

@interface DistNumbersView : UIView

@property (nonatomic, weak, nullable) IBInspectable id<DistNumbersViewDataSource> dataSource;
@property (nonatomic, weak, nullable) IBInspectable id<DistNumbersViewDelegate> delegate;

///the columns need to freeze, default is 1
@property (nonatomic) IBInspectable NSInteger columnsToFreeze;
///if the first row needs to freeze, default is NO
@property (nonatomic) IBInspectable BOOL isFreezeFirstRow;

///default is BSNumbersSeparatorStyleSolid
@property (nonatomic) IBInspectable DistNumbersSeparatorStyle rowSeparatorStyle;
@property (nonatomic, strong) IBInspectable UIColor *rowSeparatorColor;

@property (nonatomic) IBInspectable DistNumbersSeparatorStyle columnSeparatorStyle;
@property (nonatomic, strong) IBInspectable UIColor *columnSeparatorColor;

- (void)reloadData;
- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;

///default is 100
@property (nonatomic) IBInspectable CGFloat itemMinWidth;
///default is 150
@property (nonatomic) IBInspectable CGFloat itemMaxWidth;
///default is 50
@property (nonatomic) IBInspectable CGFloat rowHeight;
///default is 10
@property (nonatomic) IBInspectable CGFloat textHorizontalMargin;

/* if - (__kindof UICollectionViewCell *)numbersView:(BSNumbersView *)numbersView cellForItemAtIndexPath:(NSIndexPath *)indexPath;  need to implementation, register cell first.
 */
- (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

@end

@interface NSIndexPath (DistNumbersView)

+ (instancetype)indexPathForColumn:(NSInteger)column inRow:(NSInteger)row;

@property (nonatomic, readonly) NSInteger column;

- (NSString *)dist_description;

@end

NS_ASSUME_NONNULL_END
