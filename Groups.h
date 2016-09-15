//
//  Groups.h
//  UITableViewDynamicCells
//
//  Created by EnzoF on 15.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>


@class UIColor;
@class Group;

@interface Groups : NSObject

@property (strong,nonatomic) NSMutableArray<Group*> *mArrayAllStudentGroups;

-(instancetype)initWithNumberOfStudents:(NSInteger)numberOfStudents;

@end
