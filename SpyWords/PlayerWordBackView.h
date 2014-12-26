//
//  PlayerWordBackView.h
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerWordBackView : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (nonatomic, strong) void (^block)(void);
@end
