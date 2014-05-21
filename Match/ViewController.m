//
//  ViewController.m
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import "ViewController.h"

#import "HTTeam.h"
#import "HTGroup.h"
#import "HTMatch.h"
#import "HTBigDay.h"
#import "HTBigWeek.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    HTGroup *g1 = [[HTGroup alloc] initWithName:@"A" andCount:4];
    HTGroup *g2 = [[HTGroup alloc] initWithName:@"B" andCount:4];
    HTGroup *g3 = [[HTGroup alloc] initWithName:@"C" andCount:4];
    
    NSMutableArray *allMatches = [NSMutableArray array];
    [allMatches addObjectsFromArray:[g1 matches]];
    [allMatches addObjectsFromArray:[g2 matches]];
    [allMatches addObjectsFromArray:[g3 matches]];
    
    //match day
    NSInteger count = [allMatches count];
    count = (count + 2) / 3;
    
    NSMutableArray *bigDays = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 1; i <= count; i++)
    {
        HTBigDay *day = [[HTBigDay alloc] initWithName:[NSString stringWithFormat:@"day_%d", i]];
        [bigDays addObject:day];
    }
    
    //2 match days a week
    count = (count + 1) / 2;
    NSMutableArray *bigWeeks = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++)
    {
        HTBigWeek *week = [[HTBigWeek alloc] initWithName:[NSString stringWithFormat:@"week_%d", i + 1]];
        [week addMatchDay:[bigDays objectAtIndex:i * 2]];
        if (i * 2 + 1 < [bigDays count])
        {
            [week addMatchDay:[bigDays objectAtIndex: i * 2 + 1]];
        }
        [bigWeeks addObject:week];
    }
    
#if 0 //arrange by day
    for (HTMatch *match in allMatches)
    {
        for (HTBigDay *bigDay in bigDays)
        {
            if ([bigDay addMatch:match])
            {
                break;
            }
        }
    }
    
    for (HTBigDay *day in bigDays)
    {
        NSLog(@"match: %@", day);
    }
#else //arrange by week
    for (HTMatch *match in allMatches)
    {
        for (HTBigWeek *week in bigWeeks)
        {
            if ([week addMatch:match])
            {
                break;
            }
        }
    }
    
    for (HTBigWeek *week in bigWeeks)
    {
        NSLog(@"match: %@", week);
    }
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
