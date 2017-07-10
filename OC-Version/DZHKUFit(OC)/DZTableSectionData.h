//
//  DZTableSectionData.h
//  DZHKUFit(OC)
//
//  Created by Xinhou Jiang on 10/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//  表格分区数据

#import <Foundation/Foundation.h>
@class DZFoodContentData;

@interface DZTableSectionData : NSObject

@property(nonatomic, copy) NSString *sectionTile; // 分取名
@property(nonatomic, strong) NSMutableArray<DZFoodContentData *> *sectionData; // 分区数据

// 类工具函数
+ (instancetype)section;

@end
