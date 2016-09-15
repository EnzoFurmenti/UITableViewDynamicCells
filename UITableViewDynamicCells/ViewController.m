//
//  ViewController.m
//  UITableViewDynamicCells
//
//  Created by EnzoF on 13.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "ViewController.h"
#import "CellColor.h"
#import "Groups.h"
#import "Group.h"
#import "Student.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) Groups *studentGroups;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger countStudents = arc4random() % 30 + 20;
    self.studentGroups = [[Groups alloc]initWithNumberOfStudents:countStudents];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.studentGroups.mArrayAllStudentGroups count];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    Group *currentGroup = [self.studentGroups.mArrayAllStudentGroups objectAtIndex:section];
    return currentGroup.titleOfHeader;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    Group *currentGroup = [self.studentGroups.mArrayAllStudentGroups objectAtIndex:section];
    return [currentGroup.mArrayStudents count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"CellColor";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    Group *currentGroup = [self.studentGroups.mArrayAllStudentGroups objectAtIndex:indexPath.section];
    Student *currentStudent = [currentGroup.mArrayStudents objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f",currentStudent.averageMark];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",currentStudent.lastName,currentStudent.firstName];
    
    cell.detailTextLabel.textColor = currentGroup.groupColor;
    cell.textLabel.textColor = currentGroup.groupColor;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.f;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 50)];
    headerView.backgroundColor = [[UIColor alloc] initWithRed:1 / 255.f * 100.f green:1 / 255.f *165.f blue:1.f alpha:0.5f];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, headerView.bounds.size.width, headerView.bounds.size.height)];
    [headerView addSubview:label];
    Group *currentStudentGroup = [self.studentGroups.mArrayAllStudentGroups objectAtIndex:section];
    label.text =currentStudentGroup.titleOfHeader;
    label.textColor = currentStudentGroup.groupColor;
    label.font = [UIFont systemFontOfSize:20.f weight:(3.f)];
    return headerView;
}


@end
