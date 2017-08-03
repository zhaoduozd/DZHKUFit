//
//  DZPersonalCardViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZPersonalCardViewController.h"

@interface DZPersonalCardViewController ()

@property(nonatomic, strong) NSMutableArray *currentCardRecords;
@property(nonatomic, strong) NSMutableArray<UIImageView *> *records;

@end

@implementation DZPersonalCardViewController{
    NSInteger weekday;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = super.pageTitle;
    [self initData];
    [self initUI];
    
}

- (void) initData {
    _currentCardRecords = [[NSMutableArray alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now = [NSDate date];;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitWeekday;
    
    
    
    comps = [calendar components:unitFlags fromDate:now];
    weekday = [comps weekday];
    
    NSUserDefaults *defaults;
    
    NSString *filePath;
    
    filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"/currentCardRecords.plist"];
    
    
    if (![defaults boolForKey:@"reminderList"]) {
        if (_currentCardRecords.count == 0) {
            
            for (int i = 0; i < 7; i++) {
                [_currentCardRecords addObject:@"NO"];
                
                if ( i == 1 ) {
                    [_currentCardRecords addObject:@"YES"];
                }
            }
        }
    } else {
        _currentCardRecords = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    }
}

- (void) initUI {
    UIButton *Card = [[UIButton alloc] initWithFrame:CGRectMake((DZScreenW - 60)/2, 40, 60, 60)];
    UIView *recordsView = [[UIView alloc] initWithFrame:CGRectMake(0, 140, DZScreenW, 120)];
    
    [self setRecords];
    [self setCardButtonUI:Card];
    [self setRecordViewUI:recordsView withRecords:_records];
    
    [self.view addSubview:Card];
    [self.view addSubview:recordsView];
}

- (void) setCardButtonUI:(UIButton *) button {
    NSString *btnIcon;
    
    if ([_currentCardRecords[weekday-1] isEqual: @"YES"]) {
        btnIcon = @"good";
    } else {
        btnIcon = @"goodDefault";
    }
    
    [button setBackgroundImage:[UIImage imageNamed:@"cardDefault"] forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:10.0];

    [button addTarget:self action:@selector(CardDone:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) setRecords {
    _records = [[NSMutableArray alloc] init];
    float recordW = 32;
    float seperateSpace = (DZScreenW - 30 - recordW*7)/6;
    
    
    for (int i = 0; i < 7; i++) {
        UIImage *image;
        
        if ([_currentCardRecords[i] isEqual:@"NO"]) {
            image = [UIImage imageNamed:@"goodDefault"];

        } else {
            image = [UIImage imageNamed:@"good"];
        }
        UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
        imageview.frame = CGRectMake(15 + (seperateSpace + recordW)*i, 50, 32, 32);
        
        [_records addObject:imageview];
    }
}

- (void) setRecordViewUI:(UIView *) view withRecords:(NSMutableArray *) records {
    view.backgroundColor = AppDefaultSubViewBackgroundColor;
    UIView *headerline = [UIView SeperatorLineWithX:0 Y:0];
    UIView *footerline = [UIView SeperatorLineWithX:0 Y:119];
    UILabel *recordTitle = [UILabel DZDefaultTableLabelWithText:@"本周打卡" yPos:10 Height:26 IsBold:YES];
    
    
    [view addSubview:headerline];
    [view addSubview:footerline];
    [view addSubview:recordTitle];
    
    //NSLog(@"%@", records);
    
    for ( int i = 0; i < 7; i++) {
        [view addSubview: [records objectAtIndex:i]];
    }
    
}

- (void) CardDone:(id) sender {
    UIButton *button = (UIButton *)sender;
    [button setBackgroundImage:[UIImage imageNamed:@"card"] forState:UIControlStateNormal];
    
    
    if ([[_currentCardRecords objectAtIndex:weekday-1] isEqual:@"NO"]) {
        [_currentCardRecords setObject:@"YES" atIndexedSubscript:weekday-1];
        [[_records objectAtIndex:weekday-1] setImage:[UIImage imageNamed:@"good"]];
        
    }
    
}



@end
