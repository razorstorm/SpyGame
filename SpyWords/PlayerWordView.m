//
//  PlayerWordView.m
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "PlayerWordView.h"
#import "PlayerWordBackView.h"
#import "PlayerWordFrontView.h"

@interface PlayerWordView ()
@property (nonatomic, strong) PlayerWordFrontView *side1;
@property (nonatomic, strong) PlayerWordBackView *side2;
@end

@implementation PlayerWordView

- (instancetype)initWithFrame:(CGRect)frame {

  self = [super initWithFrame:frame];
  if (self) {

    self.side1 = [[PlayerWordFrontView alloc] initWithFrame:frame];
    self.side1.parentView = self;
    self.side2 = [[PlayerWordBackView alloc] initWithFrame:frame];
    self.side2.parentView = self;

    self.side2.hidden = YES;
    [self addSubview:self.side1];
  }
  return self;
}

+ (NSString *)reuseIdentifier {
  return @"PlayerWordView";
}

- (NSString *)reuseIdentifier {
  return [PlayerWordView reuseIdentifier];
}

- (void)onTouch {
  if ([self.delegate canActivateCard:self.playerIndex]) {
    self.side2.hidden = NO;
    [UIView transitionFromView:self.side1
                        toView:self.side2
                      duration:0.4f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:NULL];
  }
}

- (void)onReady {
  [self.delegate cellReady];
}

- (void)setWord:(NSString *)word {
  _word = word;
  self.side2.wordLabel.text = word;
}

@end
