//
//  Player.h
//  SpyWords
//
//  Created by Jason Jiang on 12/22/14.
//  Copyright (c) 2014 spywords. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Player : NSObject

@property (nonatomic) BOOL isSpy;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic) BOOL alive;
@property (nonatomic, weak) NSString *word;

@end
