//
//  HTMatch.m
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import "HTMatch.h"

@interface HTMatch ()
@property (nonatomic, retain) NSMutableArray *teamList;
@end

@implementation HTMatch

- (id)initWithTeam1:(HTTeam *)t1 andTream2:(HTTeam *)t2
{
    self = [super init];
    if (self)
    {
        NSMutableArray *list = [NSMutableArray arrayWithCapacity:2];
        [list addObject:t1];
        [list addObject:t2];
        self.teamList = list;
    }
    
    return self;
}

- (BOOL)isTeamExist:(HTTeam *)t1
{
    for (HTTeam *team in self.teamList)
    {
        if ([team isEqualToTeam:t1])
        {
            return YES;
        }
    }
    
    return NO;
}

- (bool)isGroupExist:(HTTeam *)t1
{
    for (HTTeam *team in self.teamList)
    {
        if ([team isOfSameGroup:t1])
        {
            return YES;
        }
    }
    
    return NO;
}

- (NSArray *)teams
{
    return self.teamList;
}

- (NSString *)description
{
    if ([self.teamList count] != 2)
    {
        return nil;
    }
    
    HTTeam *t1 = [self.teamList objectAtIndex:0];
    HTTeam *t2 = [self.teamList objectAtIndex:1];
    
    NSString *text = [NSString stringWithFormat:@"%@ vs %@", [t1 teamName], [t2 teamName]];
    return text;
}

@end
