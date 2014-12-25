//
//  PlayerView.m
//  SpyWords
//
//  Created by Jason Jiang on 12/22/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "PlayerView.h"
#import "Player.h"
#import "PlayerCardBackView.h"

@interface PlayerView ()
@property (weak, nonatomic) IBOutlet UIButton *executeButton;
@property (nonatomic, strong) UICollectionViewCell *side1;
@property (nonatomic, strong) PlayerCardBackView *side2;
@end

@implementation PlayerView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor blackColor];
    self.side1 = [[NSBundle mainBundle] loadNibNamed:@"PlayerView" owner:self options:nil][0];
    self.side1.backgroundColor = [UIColor whiteColor];

    self.side2 = [[PlayerCardBackView alloc] initWithFrame:frame];

    [self.contentView addSubview:self.side1];
  }
  return self;
}

+ (PlayerView *)playerView {
  return [[[NSBundle mainBundle] loadNibNamed:@"PlayerView" owner:self options:nil] objectAtIndex:0];
}

+ (NSString *)reuseIdentifier {
  return @"PlayerView";
}

- (NSString *)reuseIdentifier {
  return [PlayerView reuseIdentifier];
}

- (void)setPlayer:(Player *)player {
  _player = player;
  [self.side2 setupInnocence:player.isSpy];
}

- (IBAction)execute:(id)sender {
  self.player.alive = false;

  [UIView transitionFromView:self.side1
                      toView:self.side2
                    duration:0.4f
                     options:UIViewAnimationOptionTransitionFlipFromRight
                  completion:NULL];
}
@end
