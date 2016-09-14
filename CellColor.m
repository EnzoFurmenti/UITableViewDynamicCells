//
//  CellColor.m
//  UITableViewDynamicCells
//
//  Created by EnzoF on 14.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "CellColor.h"
#import <UIKit/UIColor.h>

@implementation CellColor

-(instancetype)initWithRandomColor{
    self = [super init];
    if(self)
    {
        self.color = [self randomColor];
        self.colorRGB = [self colorRGB:self.color];
    }
    return self;
}

#pragma mark - metods

-(UIColor*)randomColor{
    
    CGFloat red = (float)(arc4random() % 256) / 255.f;
    CGFloat green = (float)(arc4random() % 256) / 255.f;
    CGFloat blue = (float)(arc4random() % 256) / 255.f;
    
    return [[UIColor alloc]initWithRed:red green:green blue:blue alpha:1.f];
}


-(NSString*)colorRGB:(UIColor*)color{
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    [color getRed:&red green:&green blue:&blue alpha:nil];
    
    return [NSString stringWithFormat:@"RGB (%1.2f,%1.2f,%1.2f,1.f)",red,green,blue];
}


@end
