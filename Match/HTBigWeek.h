//
//  HTBigWeek.h
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTAddMatchDelegate.h"

@class HTBigDay;

@interface HTBigWeek : NSObject <HTAddMatchDelegate>

- (id)initWithName:(NSString *)name;

- (void)addMatchDay:(HTBigDay *)day;

//同一个队不能同周2场比赛
- (BOOL)addMatch:(HTMatch *)match;

- (BOOL)isMatch:(HTMatch *)m1 conflictToMatch:(HTMatch *)m2;

@end
