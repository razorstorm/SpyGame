//
//  PlayerWordFrontView.m
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "PlayerWordFrontView.h"
#import "PlayerWordView.h"

@implementation PlayerWordFrontView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
  if (self) {
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    bgView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    [self addSubview:bgView];
  }
  return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  [self.parentView onTouch];
}

@end
