//
//  PlayerView.h
//  SpyWords
//
//  Created by Jason Jiang on 12/22/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Player;

@interface PlayerView : UICollectionViewCell
@property (nonatomic, strong) Player *player;
+ (PlayerView *)playerView;
+ (NSString *)reuseIdentifier;
@end
