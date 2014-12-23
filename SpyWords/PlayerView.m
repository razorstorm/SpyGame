//
//  PlayerView.m
//  SpyWords
//
//  Created by Jason Jiang on 12/22/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "PlayerView.h"
#import "Player.h"

@interface PlayerView ()
@property (weak, nonatomic) IBOutlet UIButton *executeButton;
@property (nonatomic, strong) UICollectionViewCell *side1;
@property (nonatomic, strong) UICollectionViewCell *side2;
@end

@implementation PlayerView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor blackColor];
    NSArray *contentViewNib = [[NSBundle mainBundle] loadNibNamed:@"PlayerView" owner:self options:nil];
    self.side1 = contentViewNib[0];

    self.side2 = [[UICollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.side2.backgroundColor = [UIColor whiteColor];

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
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 80, 30)];
  label.text = self.player.isSpy ? @"Spy!" : @"Innocent!";
  label.textAlignment = NSTextAlignmentCenter;
  if (self.player.isSpy) {
    self.side2.backgroundColor = [UIColor greenColor];
  }
  else {
    self.side2.backgroundColor = [UIColor redColor];
  }
  [self.side2.contentView addSubview:label];
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
