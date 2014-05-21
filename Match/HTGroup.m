//
//  HTGroup.m
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import "HTGroup.h"
#import "HTTeam.h"
#import "HTMatch.h"

@interface HTGroup ()
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSMutableArray *teamList;
@property (nonatomic, retain) NSMutableArray *matchList;
@end

@implementation HTGroup

- (id)initWithName:(NSString *)name andCount:(NSInteger)count
{
    self = [super init];
    if (self)
    {
        self.name = name;
        NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
        
        for (NSInteger i = 1; i <= count; i++)
        {
            HTTeam *team = [[HTTeam alloc] initWithName:[NSString stringWithFormat:@"%@%d", name, i] andGroup:self];
            [list addObject:team];
        }
        
        self.teamList = list;
    }
    
    return self;
}

- (NSArray *)matches
{
    if (self.matchList == nil)
    {
        NSInteger count = [self.teamList count];
        
        NSMutableArray *list = [NSMutableArray arrayWithCapacity:count * (count - 1) / 2];
        
        for (NSInteger i = 0; i < count - 1; i++)
        {
            for (NSInteger j = i + 1; j < count; j++)
            {
                HTMatch *match = [[HTMatch alloc] initWithTeam1:[self.teamList objectAtIndex:i] andTream2:[self.teamList objectAtIndex:j]];
                [list addObject:match];
            }
        }
        
        self.matchList = list;
    }
    
    return self.matchList;
}

- (BOOL)isEqualToGroup:(HTGroup *)group
{
    if ([self.name isEqualToString:[group groupName]])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (NSString *)groupName
{
    return self.name;
}
@end
