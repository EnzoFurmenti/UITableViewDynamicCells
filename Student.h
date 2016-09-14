//
//  Student.h
//  UITableViewDynamicCells
//
//  Created by EnzoF on 14.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@interface Student : NSObject

@property (strong,nonatomic) NSString *firstName;
@property (strong,nonatomic) NSString *lastName;
@property (assign,nonatomic) CGFloat averageMark;

-(instancetype)initRandomStudent;

@end
