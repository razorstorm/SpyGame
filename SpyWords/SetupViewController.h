//
//  SetupViewController.h
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PlayerWordViewDelegate;

@interface SetupViewController : UICollectionViewController <PlayerWordViewDelegate>
- (instancetype)initWithNumPlayers:(NSInteger)numPlayers
                       regularWord:(NSString *)regularWord
                           spyWord:(NSString *)spyWord;
@end
