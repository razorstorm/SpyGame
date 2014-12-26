//
//  PlayerWordBackView.m
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "PlayerWordBackView.h"
#import "PlayerWordView.h"

@implementation PlayerWordBackView
- (IBAction)readyButton:(id)sender {
  [self.parentView onReady];
}

@end
