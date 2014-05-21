//
//  HTAddMatchDelegate.h
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTMatch.h"

@protocol HTAddMatchDelegate <NSObject>

- (BOOL)addMatch:(HTMatch *)match;
- (BOOL)isFull;

@end
