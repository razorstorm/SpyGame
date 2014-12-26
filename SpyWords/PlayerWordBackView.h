//
//  PlayerWordBackView.h
//  SpyWords
//
//  Created by Jason Jiang on 12/26/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PlayerWordView;

@interface PlayerWordBackView : UIView
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (nonatomic, weak) PlayerWordView *parentView;
@end
