//
//  HTBigWeek.m
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import "HTBigWeek.h"
#import "HTBigDay.h"

@interface HTBigWeek ()
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSMutableArray *dayList;

- (BOOL)matchExist:(HTMatch *)match;

@end

@implementation HTBigWeek

- (id)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.dayList = [NSMutableArray arrayWithCapacity:2];
    }
    
    return self;
}

- (void)addMatchDay:(HTBigDay *)day
{
    [self.dayList addObject:day];
}

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

//同一个队不能同周2场比赛
- (BOOL)addMatch:(HTMatch *)match
{
    if ([self isFull])
    {
        return NO;
    }
    else
    {
        //2 days no this match team
        if ([self teamExist:match])
        {
            return NO;
        }
        else
        {
            for (HTBigDay *bigDay in self.dayList)
            {
                if ([bigDay addMatch:match])
                {
                    return YES;
                }
            }
            
            return NO;
        }
    }
}

- (BOOL)isFull
{
    for (HTBigDay *day in self.dayList)
    {
        if (![day isFull])
        {
            return NO;
        }
    }
    
    return YES;
}

- (NSString *)description
{
    NSMutableString *text = [NSMutableString stringWithString:self.name];
    
    [text appendString:@":\n"];
    for (HTBigDay *day in self.dayList)
    {
        [text appendFormat:@"%@\n", day];
    }
    [text appendString:@"-------------------------\n"];
    return text;
}

- (BOOL)teamExist:(HTMatch *)m1
{
    for (HTTeam *team in [m1 teams])
    {
        for (HTBigDay *day in self.dayList)
        {
            NSArray *list = [day matches];
            for (HTMatch *match in list)
            {
                if ([match isTeamExist:team])
                {
                    return YES;
                }
            }
        }
    }
    
    return NO;
}

@end
