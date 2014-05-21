//
//  HTMatch.h
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTeam.h"
#import "HTMatch.h"

@interface HTMatch : NSObject

- (id)initWithTeam1:(HTTeam *)t1 andTream2:(HTTeam *)t2;

- (BOOL)isTeamExist:(HTTeam *)team;
- (bool)isGroupExist:(HTTeam *)team;

- (NSArray *)teams;

@end
