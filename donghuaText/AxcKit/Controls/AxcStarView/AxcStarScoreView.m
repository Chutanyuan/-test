//
//  Axc框架封装工程
//
//  Created by ZhaoXin on 16/3/9.
//  Copyright © 2016年 Axc5324. All rights reserved.
//


#import "AxcStarScoreView.h"
#import "AxcStarView.h"

@interface AxcStarScoreView ()
@property (nonatomic, strong) NSMutableArray *starArray;
@property (nonatomic, assign) CGFloat starMargin;
@property (nonatomic, assign) CGFloat singleWH;

@property (nonatomic, assign) NSInteger starCount;
@property (nonatomic, assign) CGFloat totalWidth;
@end


@implementation AxcStarScoreView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.maxScore = 10;

    }
    return self;
}

- (NSMutableArray *)starArray{
    if (!_starArray) {
        _starArray = [NSMutableArray array];
    }
    return _starArray;
}

- (void)setUpStarViewsWithFrame{
    for (int i = 0; i < self.starCount; i++) {
        AxcStarView *starView = [[AxcStarView alloc] init];
        [self addSubview:starView];
        starView.fillColor = self.fillColor;
        starView.lineWidth = self.lineWidth;
        starView.lineColor = self.lineColor;
        starView.tag = i;
        [self.starArray addObject:starView];
    }
}

// 初始化后 已经根据星星的宽高和margin 计算出了scoreView 的size
// 如果调整位置，只需要改变X 和Y 值即可
+ (instancetype)starScoreViewWithSingleStarWH:(CGFloat)singleWH starMargin:(CGFloat)margin starCount:(NSInteger)starCount addedTo:(UIView *)superView{

    AxcStarScoreView *scoreView = [[AxcStarScoreView alloc] init];
    scoreView.singleWH = singleWH;
    scoreView.starCount = starCount;
    scoreView.starCount = starCount;
    [scoreView setUpStarViewsWithFrame];
    scoreView.userInteractionEnabled = scoreView.isAllowTouch;
    // 计算出scoreView的frame
    scoreView.frame = CGRectMake(0, 0, singleWH * starCount + margin * (starCount - 1), singleWH);
    superView.frame = CGRectMake(0, 0, singleWH * starCount + margin * (starCount - 1), singleWH);
    scoreView.totalWidth = singleWH * starCount + margin * (starCount - 1);
    // 设置间距
    scoreView.starMargin = margin;
    [superView addSubview:scoreView];
    return scoreView;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat starW = self.singleWH;
    CGFloat starH = self.singleWH;
    __block  CGFloat starX = 0;
    CGFloat starY = 0;
    [self.starArray enumerateObjectsUsingBlock:^(AxcStarView *starView, NSUInteger idx, BOOL * _Nonnull stop) {
        starX = (starW + self.starMargin) * idx;
        starView.frame = CGRectMake(starX, starY, starW, starH);
        
    }];
    
}
- (void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    [self.starArray enumerateObjectsUsingBlock:^(AxcStarView *starView, NSUInteger idx, BOOL * _Nonnull stop) {
        starView.lineWidth = lineWidth;
        
    }];
}
- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    [self.starArray enumerateObjectsUsingBlock:^(AxcStarView *starView, NSUInteger idx, BOOL * _Nonnull stop) {
        starView.lineColor = lineColor;
        
    }];
}
- (void)setFillColor:(UIColor *)fillColor{
    _fillColor = fillColor;
    [self.starArray enumerateObjectsUsingBlock:^(AxcStarView *starView, NSUInteger idx, BOOL * _Nonnull stop) {
        starView.fillColor = fillColor;
        
    }];
}

- (void)setScore:(CGFloat)score{
    _score = score;
    [self updateViewsWithScore:score];
}
/**
 *  根据分数更新scoreView
 *
 */
- (void)updateViewsWithScore:(CGFloat)score{

    __block CGFloat starScore = score;
    
    CGFloat percentScore = self.maxScore / self.starCount;
    
    [self.starArray enumerateObjectsUsingBlock:^(AxcStarView *starView, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (starScore >= percentScore *(idx+1)) {
            starView.percent = 1;
        }else{
            
            if (self.halfMode == NO) {
                CGFloat percent = (starScore -percentScore * idx)/ percentScore;
                starView.percent = percent;
            }else{
                CGFloat percent = (starScore -percentScore * idx)/ percentScore;
                if (percent <= 0.5) {
                    starView.percent = 0.5;
                }else{
                    starView.percent = 1;
                }
                
            }
        }
    }];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    CGFloat newRating =  (point.x / self.self.totalWidth) * self.maxScore;

    
    if (newRating >= self.maxScore) {
        newRating = self.maxScore;
    }
    [self updateViewsWithScore:newRating];
    if (self.scoreBlock) {
        self.scoreBlock(newRating);
    }
    if ([_delegate respondsToSelector:@selector(AxcStarScoreView:didSelectAtNewRating:)]) {
        [_delegate AxcStarScoreView:self didSelectAtNewRating:newRating];
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    
    CGPoint point = [[touches anyObject] locationInView:self];
    CGFloat newRating =  (point.x / self.totalWidth) * self.maxScore;
    
    if (newRating >= self.maxScore) {
        newRating = self.maxScore;
    }
 
    [self updateViewsWithScore:newRating];
    
    if (self.scoreBlock) {
        self.scoreBlock(newRating);
    }
    if ([_delegate respondsToSelector:@selector(AxcStarScoreView:didSelectAtNewRating:)]) {
        [_delegate AxcStarScoreView:self didSelectAtNewRating:newRating];
    }
}
- (void)setIsAllowTouch:(BOOL)isAllowTouch{
    _isAllowTouch = isAllowTouch;
    self.userInteractionEnabled = isAllowTouch;
}

@end
