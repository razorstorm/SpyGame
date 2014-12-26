//
//  PlayerWordView.m
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "PlayerWordView.h"
#import "PlayerWordBackView.h"

@interface PlayerWordView ()
@property (nonatomic, strong) UICollectionViewCell *side1;
@property (nonatomic, strong) PlayerWordBackView *side2;
@end

@implementation PlayerWordView

- (instancetype)initWithFrame:(CGRect)frame {

  self = [super initWithFrame:frame];
  if (self) {
    self.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);

    self.side1 = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    bgView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    [self.side1 addSubview:bgView];

    self.side2 = [[NSBundle mainBundle] loadNibNamed:@"PlayerWordBackView" owner:self options:nil][0];

    __weak PlayerWordView *wself = self;
    self.side2.block = ^{
      [wself.delegate cellReady];
    };

    [self.contentView addSubview:self.side1];

  }
  return self;
}

+ (NSString *)reuseIdentifier {
  return @"PlayerWordView";
}

- (NSString *)reuseIdentifier {
  return [PlayerWordView reuseIdentifier];
}

-(void)setWord:(NSString *)word {
  _word = word;
  self.side2.wordLabel.text = word;
}

@end
