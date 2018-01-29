//
//  HudView.m
//  Exercise
//
//  Created by 王少帅 on 2018/1/29.
//  Copyright © 2018年 王少帅. All rights reserved.
//

#import "HudView.h"

@implementation HudView

- (void)setLabelText:(NSString *)labelText {
    self.label.text = labelText;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
                
        self.backgroundColor = [UIColor colorWithWhite:0.05 alpha:0.9];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 6.0f;
        
        
        self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_icon5"]];
        self.imgView.frame = CGRectMake(25, 25, self.frame.size.width-50, self.frame.size.height-25-30-5);
        [self addSubview:self.imgView];
        
        NSMutableArray *images = [NSMutableArray arrayWithCapacity:6];
        for (int i = 0; i < 6; i ++) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"loading_icon%d",i]];
            [images addObject:img];
        }
        self.imgView.animationImages = images;
        self.imgView.animationDuration = 1.0f;
        self.imgView.animationRepeatCount = 0;
//        self.imgView.backgroundColor = [UIColor redColor];
        [self.imgView startAnimating];


        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imgView.frame.origin.y + self.imgView.frame.size.height, self.frame.size.width, 30)];
        [self addSubview:self.label];
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:14.0f];
        
    }
    return self;
}

@end
