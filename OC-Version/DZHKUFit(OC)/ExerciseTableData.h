//
//  ExerciseTableData.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 18/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseListData.h"

@class ExerciseTableData;

@interface ExerciseTableData : NSObject

@property(nonatomic, copy) NSString *sectionTile; // 分取名
@property(nonatomic, strong) NSMutableArray<ExerciseListData *> *sectionData; // 分区数据

// 类工具函数
+ (instancetype)section;

@end
