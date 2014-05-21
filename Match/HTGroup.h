//
//  HTGroup.h
//  Match
//
//  Created by samuel on 14-5-21.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTGroup : NSObject

- (id)initWithName:(NSString *)name andCount:(NSInteger)count;
- (NSArray *)matches;
- (BOOL)isEqualToGroup:(HTGroup *)group;
- (NSString *)groupName;
@end
