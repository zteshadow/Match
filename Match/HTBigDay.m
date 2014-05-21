//
//  HTBigDay.m
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import "HTBigDay.h"

@interface HTBigDay ()
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSMutableArray *matchList;

- (BOOL)isMatch:(HTMatch *)m1 conflictToMatch:(HTMatch *)m2;

@end

@implementation HTBigDay

- (id)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.matchList = [NSMutableArray arrayWithCapacity:3];
    }
    
    return self;
}

//同一个小组的队不能在同一天
- (BOOL)isMatch:(HTMatch *)m1 conflictToMatch:(HTMatch *)m2
{
    for (HTTeam *team in m1.teams)
    {
        //if ([match isTeamExist:team])
        if ([m2 isGroupExist:team])
        {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)addMatch:(HTMatch *)match
{
    //full
    if ([self.matchList count] == 3)
    {
        return NO;
    }
    else
    {
        for (HTMatch *m in self.matchList)
        {
            if ([self isMatch:m conflictToMatch:match])
            {
                return NO;
            }
        }
        
        [self.matchList addObject:match];
        return YES;
    }
}

- (BOOL)isFull
{
    if ([self.matchList count] == 3)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (NSString *)description
{
    NSMutableString *text = [NSMutableString stringWithString:self.name];
    
    [text appendString:@":\n"];
    for (HTMatch *match in self.matchList)
    {
        [text appendFormat:@"%@\n", match];
    }
    [text appendString:@"-------------------------"];
    return text;
}

- (NSArray *)matches
{
    return self.matchList;
}

@end
