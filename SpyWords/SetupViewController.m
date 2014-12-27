//
//  SetupViewController.m
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "SetupViewController.h"
#import "Player.h"
#import "PlayerWordView.h"

@interface SetupViewController ()
@property (nonatomic, strong) NSString *regularWord;
@property (nonatomic, strong) NSString *spyWord;
@property (nonatomic, strong) NSArray *players;
@property (nonatomic, strong) NSDictionary *playerViews;
@property (nonatomic) int currIndex;
@end

#define OFFSET 3
#define CARD_WIDTH 100
#define CARD_HEIGHT 140

@implementation SetupViewController

- (instancetype)initWithNumPlayers:(NSInteger)numPlayers
                  regularWord:(NSString *)regularWord
                      spyWord:(NSString *)spyWord {
  self = [super init];

  if (self) {
    self.regularWord = regularWord;
    self.spyWord = spyWord;
    [self buildPlayers:numPlayers];
    self.currIndex = 0;
    self.view.backgroundColor = [UIColor blackColor];
  }

  return self;
}

- (void)viewDidLoad {
  NSMutableDictionary *playerViews = [[NSMutableDictionary alloc] init];

  int height = self.view.frame.size.height;
  int width = self.view.frame.size.width;
  int xPos = width/2.0 - CARD_WIDTH/2.0;
  int yPos = height/2.0 - CARD_HEIGHT/2.0;

  for (int i = (int)self.players.count-1; i >= 0; i--) {
    PlayerWordView *cell = [[PlayerWordView alloc] initWithFrame:CGRectMake(xPos-OFFSET*i,yPos,100,140)];

    cell.word = ((Player *)self.players[i]).word;
    cell.delegate = self;
    cell.playerIndex = i;

    [playerViews setObject:cell forKey:@(i)];
    [self.view addSubview:cell];
  }
  self.playerViews = playerViews;
}

- (void)buildPlayers:(NSInteger)numPlayers {
  int numSpies = 0;
  if (numPlayers < 6) {
    numSpies = 1;
  }
  else if (numPlayers < 11) {
    numSpies = 2;
  }
  else {
    numSpies = numPlayers * 0.2;
  }

  NSMutableSet *spyIndexes = [[NSMutableSet alloc] init];

  for (int spyNum = 0; spyNum < numSpies; spyNum++) {
    NSInteger randomIndex = arc4random_uniform((u_int32_t)numPlayers);

    while ([spyIndexes containsObject:@(randomIndex)]) {
      randomIndex++;
      if (randomIndex >= numSpies) {
        randomIndex = 0;
      }
    }
    [spyIndexes addObject:@(randomIndex)];
  }

  NSMutableArray *players = [[NSMutableArray alloc] init];

  for (int i = 0; i < numPlayers; i++) {
    BOOL isSpy = NO;
    if ([spyIndexes containsObject:@(i)]) {
      isSpy = YES;
    }
    Player *player = [[Player alloc] init];
    player.isSpy = isSpy;
    player.alive = YES;
    player.word = isSpy ? self.spyWord : self.regularWord;
    [players addObject:player];
  }

  self.players = players;
}

- (void)cellReady {
  PlayerWordView *topCardView = self.playerViews[@(self.currIndex)];
  [topCardView removeFromSuperview];

  self.currIndex++;

  if (self.currIndex >= self.players.count) {
    [self showGameView];
  }
}

- (void)showGameView {
  //TODO
}

- (BOOL)canActivateCard:(NSInteger)index {
  return index == self.currIndex;
}
@end
