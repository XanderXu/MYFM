//
//  MYMiddleView.m
//  MYFM
//
//  Created by Mac on 17/1/7.
//  Copyright © 2017年 baidu. All rights reserved.
//

#import "MYMiddleView.h"
#import "CALayer+PauseAimate.h"
@interface MYMiddleView()
@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end
@implementation MYMiddleView
static MYMiddleView *_shareInstance;
+ (instancetype)shareInstance {
    if (_shareInstance == nil) {
        _shareInstance = [MYMiddleView middleView];
    }
    return _shareInstance;
}
+ (instancetype)middleView {
    MYMiddleView *middleView = [[NSBundle mainBundle] loadNibNamed:@"MYMiddleView" owner:nil options:nil].firstObject;
    return middleView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.middleImageView.layer.masksToBounds = YES;
    self.middleImage = self.middleImageView.image;
    
    [self.middleImageView.layer removeAnimationForKey:@"playAnnimation"];
    CABasicAnimation *basicAnimation = [[CABasicAnimation alloc] init];
    basicAnimation.keyPath = @"transform.rotation.z";
    basicAnimation.fromValue = @0;
    basicAnimation.fromValue = @(M_PI * 2);
    basicAnimation.duration = 30;
    basicAnimation.repeatCount = MAXFLOAT;
    basicAnimation.removedOnCompletion = NO;
    [self.middleImageView.layer addAnimation:basicAnimation forKey:@"playAnnimation"];
    [self.middleImageView.layer pauseAnimate];
    
    [self.playButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    //监听播放状态的通知,更改自己的状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayerPlaying:) name:@"playState" object:nil];
    //监听播放图片的通知,更改显示的图片
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setPlayImage:) name:@"playImage" object:nil];
}

- (void)isPlayerPlaying:(NSNotification *)notification {
    BOOL isPlaying = [notification.object boolValue];
    self.isPlaying = isPlaying;
}
- (void)setPlayImage:(NSNotification *)notification {
    UIImage *image = notification.object;
    self.middleImage = image;
}
- (void)btnClick:(UIButton *)btn {
    if (self.middleClickBlock) {
        self.middleClickBlock(self.isPlaying);
    }
}
-(void)setIsPlaying:(BOOL)isPlaying {
    if (_isPlaying == isPlaying) {
        return;
    }
    _isPlaying = isPlaying;
    if (isPlaying) {//移除红色播放标识,显示出下面的歌曲封面
        [self.playButton setImage:nil forState:UIControlStateNormal];
        [self.middleImageView.layer resumeAnimate];
    } else {
        UIImage *image = [UIImage imageNamed:@"tabbar_np_play"];
        [self.playButton setImage:image forState:UIControlStateNormal];
        [self.middleImageView.layer pauseAnimate];
    }
}
-(void)setMiddleImage:(UIImage *)middleImage {
    _middleImage = middleImage;
    self.middleImageView.image = middleImage;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.middleImageView.layer.cornerRadius = self.middleImageView.frame.size.width * 0.5;
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
