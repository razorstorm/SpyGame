//
//  PlayerCardSideView.m
//  SpyWords
//
//  Created by Jason Jiang on 12/25/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "PlayerCardBackView.h"

@interface PlayerCardBackView ()
@property (weak, nonatomic) IBOutlet UIImageView *spyPic;
@property (weak, nonatomic) IBOutlet UIImageView *innocentPic;
@property (weak, nonatomic) IBOutlet UILabel *roleLabel;
@end

@implementation PlayerCardBackView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [[NSBundle mainBundle] loadNibNamed:@"PlayerCardBackView" owner:self options:nil][0];
  if (self) {
    self.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
  }
  return self;
}

- (void)setupInnocence:(BOOL)isSpy {
  if (!isSpy) {
    self.spyPic.hidden = YES;
    self.innocentPic.hidden = NO;
    self.roleLabel.text = @"Innocent!";
    self.backgroundColor = [UIColor redColor];
  }
}

@end
