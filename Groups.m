//
//  Groups.m
//  UITableViewDynamicCells
//
//  Created by EnzoF on 15.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Groups.h"
#import "Group.h"
#import "Student.h"


#import <UIKit/UIColor.h>

typedef enum{
    ViewControllerExcellentStudentMark                = 5,
    ViewControllerStudentWithPredominantGoodMarksMark = 4,
    ViewControllerMediocreStudentMark                 = 3,
}ViewControllerStudentMarkType;
@implementation Groups

-(instancetype)initWithNumberOfStudents:(NSInteger)numberOfStudents{
    self = [super init];
    if(self)
    {

        NSMutableArray *mArrayStudentsSorted = [[NSMutableArray alloc]init];
        for(int n = 0;n <= numberOfStudents; n++)
        {
            Student *student = [[Student alloc] initRandomStudent];
            [mArrayStudentsSorted addObject:student];
        }
        
        mArrayStudentsSorted = [self sortedArray:mArrayStudentsSorted];
        [self markGroupDistribution:mArrayStudentsSorted];
        
    
    
    }
    return self;
}

#pragma  mark - Lazy initialization
-(NSMutableArray*)mArrayAllStudentGroups{
    if(!_mArrayAllStudentGroups)
    {
        _mArrayAllStudentGroups = [[NSMutableArray alloc]init];
    }
    return _mArrayAllStudentGroups;
}

#pragma mark - metods
-(NSMutableArray*)sortedArray:(NSMutableArray*)mArray{
    [mArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Student *student1 = (Student*)obj1;
        Student *student2 = (Student*)obj2;
        NSString *student1Name = [student1.lastName stringByAppendingString:student1.firstName];
        NSString *student2Name = [student2.lastName stringByAppendingString:student2.firstName];
        return [student1Name localizedCompare:student2Name];
    }];

    return mArray;
}

-(void)markGroupDistribution:(NSMutableArray*)mArray{
    
    UIColor *excellentStudentColor = [UIColor yellowColor];
    UIColor *studentWithPredominantGoodMarksColor = [UIColor greenColor];
    UIColor *mediocreStudentColor = [UIColor orangeColor];
    UIColor *poorStudentColor = [UIColor redColor];
    
    Group *groupExcellentStudent = [[Group alloc]init];
    Group *groupStudentWithPredominantGoodMarks = [[Group alloc]init];
    Group *groupMediocreStudent = [[Group alloc]init];
    Group *groupPoorStudent = [[Group alloc]init];
    [self.mArrayAllStudentGroups addObject:groupExcellentStudent];
    [self.mArrayAllStudentGroups addObject:groupStudentWithPredominantGoodMarks];
    [self.mArrayAllStudentGroups addObject:groupMediocreStudent];
    [self.mArrayAllStudentGroups addObject:groupPoorStudent];
    
    for (Student *currentStudent in mArray)
    {
        if(currentStudent.averageMark == ViewControllerExcellentStudentMark)
        {
            [groupExcellentStudent.mArrayStudents addObject:currentStudent];
            groupExcellentStudent.groupColor = excellentStudentColor;
            groupExcellentStudent.titleOfHeader = @"Отличники";
        }
        else if(currentStudent.averageMark > ViewControllerStudentWithPredominantGoodMarksMark)
        {
            [groupStudentWithPredominantGoodMarks.mArrayStudents addObject:currentStudent];
            groupStudentWithPredominantGoodMarks.groupColor = studentWithPredominantGoodMarksColor;
            groupStudentWithPredominantGoodMarks.titleOfHeader = @"Хорошисты";

        }
        else if(currentStudent.averageMark > ViewControllerMediocreStudentMark)
        {
            [groupMediocreStudent.mArrayStudents addObject:currentStudent];
            groupMediocreStudent.groupColor = mediocreStudentColor;
            groupMediocreStudent.titleOfHeader = @"Троечники";
        }
        else
        {
            [groupPoorStudent.mArrayStudents addObject:currentStudent];
            groupPoorStudent.groupColor = poorStudentColor;
            groupPoorStudent.titleOfHeader = @"Двоечники";
        }
    }
    for (int i = 0; i < [self.mArrayAllStudentGroups count]; i++)
    {
        Group *currentGroup = [self.mArrayAllStudentGroups objectAtIndex:i];
        if([currentGroup.mArrayStudents count] == 0)
        {
            [self.mArrayAllStudentGroups removeObject:currentGroup];
        }
    }
    
}



@end
