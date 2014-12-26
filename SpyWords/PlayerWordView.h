//
//  PlayerWordView.h
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlayerWordViewDelegate <NSObject>
@required
- (void)cellReady;
- (BOOL)canActivateCard:(NSInteger)index;
@end

@interface PlayerWordView : UICollectionViewCell
@property (nonatomic, strong) NSString *word;
@property (nonatomic) NSInteger playerIndex;
@property (nonatomic, weak) id<PlayerWordViewDelegate> delegate;

+ (NSString *)reuseIdentifier;
@end

