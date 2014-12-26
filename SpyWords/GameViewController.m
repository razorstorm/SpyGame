//
//  GameViewController.m
//  SpyWords
//
//  Created by Jason Jiang on 12/22/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import "GameViewController.h"
#import "PlayerView.h"
#import "Player.h"

@interface GameViewController ()
@property (nonatomic, strong) NSArray *players;
@property (nonatomic) NSInteger numSpies;
@end

@implementation GameViewController

- (instancetype)initWithPlayers:(NSArray *)players
                    regularWord:(NSString *)regularWord
                        spyWord:(NSString *)spyWord {
  UICollectionViewFlowLayout *aFlowLayout = [[UICollectionViewFlowLayout alloc] init];
  [aFlowLayout setItemSize:CGSizeMake(100, 140)];
  [aFlowLayout setSectionInset:UIEdgeInsetsMake(20, 20, 20, 20)];
  [aFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

  return [self initWithCollectionViewLayout:aFlowLayout players:players regularWord:regularWord spyWord:spyWord];
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
                                     players:(NSArray *)players
                                 regularWord:(NSString *)regularWord
                                     spyWord:(NSString *)spyWord {

  self = [super initWithCollectionViewLayout:layout];
  if (self) {
    self.players = players;
  }
  return self;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
  [self.collectionView registerClass:[PlayerView class]
          forCellWithReuseIdentifier:[PlayerView reuseIdentifier]];
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.players.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

  PlayerView *cell = (PlayerView *)[collectionView dequeueReusableCellWithReuseIdentifier:[PlayerView reuseIdentifier] forIndexPath:indexPath];

  if (indexPath.row >= 0 && indexPath.row < self.players.count) {
    cell.player = self.players[indexPath.row];
  }
  else {
    return nil;
  }

  return cell;
}

@end
