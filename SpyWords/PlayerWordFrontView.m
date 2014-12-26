//
//  PlayerWordFrontView.m
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "PlayerWordFrontView.h"

@implementation PlayerWordFrontView

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  if ([self.delegate canActivateCard:self.playerIndex]) {
    [UIView transitionFromView:self.side1
                        toView:self.side2
                      duration:0.4f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:NULL];
  }
}

@end
