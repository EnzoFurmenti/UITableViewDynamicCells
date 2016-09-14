//
//  ViewController.m
//  UITableViewDynamicCells
//
//  Created by EnzoF on 13.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "ViewController.h"
#import "CellColor.h"
#import "Student.h"

@interface ViewController ()<UITableViewDataSource>

@property (strong,nonatomic) NSMutableArray *mArrayStudent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    for(int n = 0;n <=30; n++)
    {
        Student *student = [[Student alloc] initRandomStudent];
        [self.mArrayStudent addObject:student];
    }
    [self.mArrayStudent sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Student *student1 = (Student*)obj1;
        Student *student2 = (Student*)obj2;
        NSString *student1Name = [student1.lastName stringByAppendingString:student1.firstName];
        NSString *student2Name = [student2.lastName stringByAppendingString:student2.firstName];
        return [student1Name localizedCompare:student2Name];
    }];
}

#pragma mark - lazy initialization

-(NSArray*)mArrayStudent{
    if(!_mArrayStudent)
    {
        _mArrayStudent = [[NSMutableArray alloc] init];
    }
    return _mArrayStudent;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.mArrayStudent count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"CellColor";
    CGFloat  passMark = 3.5f;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    Student *currentStudent = [self.mArrayStudent objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f",currentStudent.averageMark];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",currentStudent.lastName,currentStudent.firstName];
    
    UIColor *currentColor = [UIColor blackColor];
    if(currentStudent.averageMark < passMark)
    {
        currentColor = [UIColor redColor];
    }
    
    cell.detailTextLabel.textColor = currentColor;
    cell.textLabel.textColor = currentColor;
    return cell;
}


@end
