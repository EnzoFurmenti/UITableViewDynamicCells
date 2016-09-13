//
//  ViewController.m
//  UITableViewDynamicCells
//
//  Created by EnzoF on 13.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@property (strong,nonatomic) NSMutableArray<UIColor*> *mArrayColors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for(int n = 0; n <= 999; n++)
    {
        [self.mArrayColors addObject:[self randomColor]];
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
    
    UIColor *currentCellColor = [self.mArrayColors objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@" Ячейка - %ld",(long)indexPath.row];
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    [currentCellColor getRed:&red green:&green blue:&blue alpha:nil];
    
    cell.textLabel.text = [NSString stringWithFormat:@"RGB (%1.2f,%1.2f,%1.2f,1.f)",red,green,blue];
    cell.textLabel.textColor = currentCellColor;
    return cell;
}


#pragma mark - metods

-(UIColor*)randomColor{

    CGFloat red = (float)(arc4random() % 256) / 255.f;
    CGFloat green = (float)(arc4random() % 256) / 255.f;
    CGFloat blue = (float)(arc4random() % 256) / 255.f;
    
    return [[UIColor alloc]initWithRed:red green:green blue:blue alpha:1.f];
}

@end
