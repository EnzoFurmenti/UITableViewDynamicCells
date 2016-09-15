//
//  Group.h
//  UITableViewDynamicCells
//
//  Created by EnzoF on 15.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIColor;

@interface Group : NSObject

@property (strong,nonatomic) NSMutableArray *mArrayStudents;

@property (strong,nonatomic) UIColor *groupColor;
@property (strong,nonatomic) NSString *titleOfHeader;

@end
