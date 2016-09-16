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

@property (strong,nonatomic) NSMutableArray *mArrayCellColors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger countStudents = arc4random() % 10 + 20;
    self.studentGroups = [[Groups alloc]initWithNumberOfStudents:countStudents];
    for(int n = 0; n < 10;n++)
    {
        CellColor *cellColor = [[CellColor alloc]initWithRandomColor];
        [self.mArrayCellColors addObject:cellColor];
    }
}
#pragma mark - Lazy inintialization

-(NSMutableArray*)mArrayCellColors{
    if(!_mArrayCellColors)
    {
        _mArrayCellColors = [[NSMutableArray alloc]init];
    }
    return _mArrayCellColors;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger numberOfSection = [self.studentGroups.mArrayAllStudentGroups count] + 1;
    return numberOfSection;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *titleForHeader;
    if(section <= [self.studentGroups.mArrayAllStudentGroups count])
    {
        Group *currentGroup = [self.studentGroups.mArrayAllStudentGroups objectAtIndex:section];
        titleForHeader = currentGroup.titleOfHeader;
    }
    else
    {
        titleForHeader = @"Цвета";
    }
    return titleForHeader;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger numberOfRows;
    if(section < [self.studentGroups.mArrayAllStudentGroups count])
    {
        Group *currentGroup = [self.studentGroups.mArrayAllStudentGroups objectAtIndex:section];
        numberOfRows = [currentGroup.mArrayStudents count];
    }
    else
    {
        numberOfRows = [self.mArrayCellColors count];
    }


   // Group *currentGroup = [self.studentGroups.mArrayAllStudentGroups objectAtIndex:section];
    return numberOfRows;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"CellStudent";
    
    static NSString *identifier1 = @"CellColor";
    UITableViewCell *cell;
    if(indexPath.section < [self.studentGroups.mArrayAllStudentGroups count])
    {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];

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
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier1];
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier1];
        }
        CellColor *cellColor = [self.mArrayCellColors objectAtIndex:indexPath.row];
        cell.textLabel.text = cellColor.colorRGB;
        cell.textLabel.textColor = cellColor.color;
    }
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.f;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 50)];
    headerView.backgroundColor = [[UIColor alloc] initWithRed:1 / 255.f * 100.f green:1 / 255.f *165.f blue:1.f alpha:0.5f];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, headerView.bounds.size.width, headerView.bounds.size.height)];
    [headerView addSubview:label];
    if(section < [self.studentGroups.mArrayAllStudentGroups count])
    {
        Group *currentStudentGroup = [self.studentGroups.mArrayAllStudentGroups objectAtIndex:section];
        label.text =currentStudentGroup.titleOfHeader;
        label.textColor = currentStudentGroup.groupColor;
    }
    else
    {
        label.text = @"Цвета";
        label.textColor = [[UIColor alloc] initWithRed:1 / 255.f * 91.f green:1 / 255.f *213.f blue:1 / 255.f *41.f alpha:0.5f];
    }
    label.font = [UIFont systemFontOfSize:20.f weight:(3.f)];
    return headerView;
}


@end
