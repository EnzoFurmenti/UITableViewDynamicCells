//
//  Student.m
//  UITableViewDynamicCells
//
//  Created by EnzoF on 14.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Student.h"

static NSString *firstNames[] = {
                                @"Милена",
                                @"Инна",
                                @"Богдан",
                                @"Анатолий",
                                @"Тимофей",
                                @"Родион",
                                @"Альбина",
                                @"Семён",
                                @"Глеб",
                                @"Вячеслав",
                                @"Алла",
                                @"Василиса",
                                @"Анжелика",
                                @"Марат",
                                @"Владислав",
                                @"Ярослав",
                                @"Маргарита",
                                @"Матвей",
                                @"Тимур",
                                @"Виталий",
                                @"Степан"
};
static int firstNameCount = 21;


static NSString *lastNames[] = {
                                @"Шуткевич",
                                @"Робинович",
                                @"Тореро",
                                @"Айбу",
                                @"Хосе",
                                @"Каншау",
                                @"Франсуа",
                                @"Тойбухаа",
                                @"Качаа",
                                @"Зиа",
                                @"Хожулаа",
                                @"Дурново",
                                @"Дубяго",
                                @"Черных",
                                @"Сухих",
                                @"Чутких",
                                @"Белаго",
                                @"Хитрово",
                                @"Бегун",
                                @"Мельник",
                                @"Шевченко"
};
static int lastNameCount = 21;


@implementation Student

-(instancetype)initRandomStudent{
   self = [super init];
    if(self)
    {
        self.firstName = firstNames[arc4random() % firstNameCount];
        self.lastName = lastNames[arc4random() % lastNameCount];
        self.averageMark = [self randomMark];
    }
    return self;
}

-(CGFloat)randomMark{
    return (CGFloat)(arc4random() % 500) / 100.f;
}


@end
