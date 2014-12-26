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
@property (nonatomic) int currIndex;
@end

@implementation SetupViewController

- (instancetype)initWithNumPlayers:(NSInteger)numPlayers
                       regularWord:(NSString *)regularWord
                           spyWord:(NSString *)spyWord {
  //TODO
  UICollectionViewFlowLayout *aFlowLayout = [[UICollectionViewFlowLayout alloc] init];
  [aFlowLayout setItemSize:CGSizeMake(100, 140)];
  [aFlowLayout setSectionInset:UIEdgeInsetsMake(20, 20, 20, 20)];
  [aFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

  return [self initWithCollectionViewLayout:aFlowLayout
                                 numPlayers:numPlayers
                                regularWord:regularWord
                                    spyWord:spyWord];
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
                                  numPlayers:(NSInteger)numPlayers
                                 regularWord:(NSString *)regularWord
                                     spyWord:(NSString *)spyWord {
  self = [super initWithCollectionViewLayout:layout];

  if (self) {
    self.regularWord = regularWord;
    self.spyWord = spyWord;
    [self buildPlayers:numPlayers];
    self.currIndex = 0;
  }

  return self;
}

- (void)viewDidLoad {
  [self.collectionView registerClass:[PlayerWordView class]
          forCellWithReuseIdentifier:[PlayerWordView reuseIdentifier]];
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

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.players.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  PlayerWordView *cell = (PlayerWordView *)[collectionView dequeueReusableCellWithReuseIdentifier:[PlayerWordView reuseIdentifier] forIndexPath:indexPath];

  if (indexPath.row >= 0 && indexPath.row < self.players.count) {
    cell.word = ((Player *)self.players[indexPath.row]).word;
    cell.playerIndex = indexPath.row;
    cell.delegate = self;

    if (indexPath.row < self.currIndex) {
      cell.hidden = YES;
    }
  }
  else {
    return nil;
  }

  return cell;
}

- (void)cellReady {
  self.currIndex++;
  [self.collectionView reloadData];
}

- (BOOL)canActivateCard:(NSInteger)index {
  return index == self.currIndex;
}
@end
