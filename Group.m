//
//  Group.m
//  UITableViewDynamicCells
//
//  Created by EnzoF on 15.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Group.h"

@implementation Group

-(instancetype)init{
    self = [super init];
    if(self)
    {
    
    }
    return self;
}


#pragma mark - Lazy initialization
-(NSMutableArray*)mArrayStudents{
    if(!_mArrayStudents)
    {
        _mArrayStudents = [[NSMutableArray alloc]init];
    }
    return _mArrayStudents;
}

@end
