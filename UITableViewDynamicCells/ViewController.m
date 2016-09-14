//
//  ViewController.m
//  UITableViewDynamicCells
//
//  Created by EnzoF on 13.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "ViewController.h"
#import "CellColor.h"

@interface ViewController ()<UITableViewDataSource>

@property (strong,nonatomic) NSMutableArray *mArrayColors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for(int n = 0; n <= 999; n++)
    {
        CellColor *cellColor = [[CellColor alloc] initWithRandomColor];
        [self.mArrayColors addObject:cellColor];
    }

}

#pragma mark - lazy initialization

-(NSMutableArray*)mArrayColors{
    if(!_mArrayColors)
    {
        _mArrayColors = [[NSMutableArray alloc] init];
    }
    return _mArrayColors;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.mArrayColors count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"CellColor";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.detailTextLabel.text = [NSString stringWithFormat:@" Ячейка - %ld",(long)indexPath.row];
    CellColor *currentCellColor = [self.mArrayColors objectAtIndex:indexPath.row];
    cell.textLabel.text = currentCellColor.colorRGB;
    cell.textLabel.textColor = currentCellColor.color;

    return cell;
}

@end
