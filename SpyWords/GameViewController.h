//
//  GameViewController.h
//  SpyWords
//
//  Created by Jason Jiang on 12/22/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UICollectionViewController
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
                                     players:(NSArray *)players
                                 regularWord:(NSString *)regularWord
                                     spyWord:(NSString *)spyWord;
@end
