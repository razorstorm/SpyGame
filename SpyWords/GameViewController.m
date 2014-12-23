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
@property (nonatomic, strong) NSArray *playerViews;
@property (nonatomic, strong) NSString *regularWord;
@property (nonatomic, strong) NSString *spyWord;
@property (nonatomic) NSInteger numSpies;
@end

@implementation GameViewController

- (instancetype)init {
  self = [super init];
  if (self) {
    [self buildPlayers:5 photos:nil];

    self.regularWord = @"Box";
    self.spyWord = @"Block";
  }
  return self;
}

- (void)buildPlayers:(NSInteger)numPlayers photos:(NSArray *)photos {
  if (numPlayers < 6) {
    self.numSpies = 1;
  }
  else if (numPlayers < 11) {
    self.numSpies = 2;
  }
  else {
    self.numSpies = numPlayers * 0.2;
  }

  NSMutableSet *spyIndexes = [[NSMutableSet alloc] init];

  for (int spyNum = 0; spyNum < self.numSpies; spyNum++) {
    NSInteger randomIndex = arc4random_uniform((u_int32_t)self.numSpies);

    while ([spyIndexes containsObject:@(randomIndex)]) {
      randomIndex++;
      if (randomIndex >= self.numSpies) {
        randomIndex = 0;
      }
      [spyIndexes addObject:@(randomIndex)];
    }
  }

  NSMutableArray *players = [[NSMutableArray alloc] init];

  for (int i = 0; i < numPlayers; i++) {
    BOOL isSpy = NO;
    if ([spyIndexes containsObject:@(i)]) {
      isSpy = YES;
    }
    Player *player = [[Player alloc] init];
    player.isSpy = isSpy;
    player.photo = nil; // For now
    player.alive = YES;
    player.word = isSpy ? self.spyWord : self.regularWord;
    PlayerView *pv = [PlayerView playerViewWithPlayer:player];
    [players addObject:pv];
  }
}


#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return self.playerViews.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  AFCollectionViewCell *cell = (AFCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
  NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
  [cell setImage:[UIImage imageWithData:[object valueForKey:@"photoImageData"]]];
  return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
    NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
    NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    [[segue destinationViewController] setDetailItem:object];
  }
}


@end
