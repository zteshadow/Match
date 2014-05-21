//
//  HTTeam.m
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import "HTTeam.h"
#import "HTGroup.h"

@interface HTTeam ()
@property (nonatomic, assign) HTGroup *group;
@property (nonatomic, retain) NSString *name;
@end

@implementation HTTeam

- (id)initWithName:(NSString *)name andGroup:(HTGroup *)group
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.group = group;
    }
    
    return self;
}

- (BOOL)isEqualToTeam:(HTTeam *)team
{
    if ([self.name isEqualToString:[team teamName]])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)isOfSameGroup:(HTTeam *)team
{
    if ([self.group isEqualToGroup:team.group])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (NSString *)teamName
{
    return self.name;
}

- (NSString *)description
{
    return self.name;
}

@end
