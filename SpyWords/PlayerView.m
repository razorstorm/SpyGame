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
@property (nonatomic, weak) IBOutlet UITextView *debugText;
@end

@implementation PlayerView

+ (PlayerView *)playerView {
  return [[[NSBundle mainBundle] loadNibNamed:@"PlayerView" owner:self options:nil] objectAtIndex:0];
}

+ (NSString *)reuseIdentifier {
  return @"PlayerView";
}

- (void)viewWillAppear:(BOOL)animated {
  self.debugText.text = [NSString stringWithFormat:@"Spy?: %@, Word: %@, Alive?: %@", self.player.isSpy ? @"YES" : @"NO", self.player.word, self.player.alive ? @"YES" : @"NO"];
}

@end
