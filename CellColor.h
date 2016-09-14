//
//  CellColor.h
//  UITableViewDynamicCells
//
//  Created by EnzoF on 14.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIColor;

@interface CellColor : NSObject

@property (strong,nonatomic) UIColor *color;
@property (strong,nonatomic) NSString *colorRGB;


-(instancetype)initWithRandomColor;
@end
