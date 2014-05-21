//
//  HTTeam.h
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HTGroup;

@interface HTTeam : NSObject

- (id)initWithName:(NSString *)name andGroup:(HTGroup *)group;

- (BOOL)isEqualToTeam:(HTTeam *)team;
- (BOOL)isOfSameGroup:(HTTeam *)team;
- (NSString *)teamName;

@end
