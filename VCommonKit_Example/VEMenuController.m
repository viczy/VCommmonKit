//
//  ViewController.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/2/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "VEMenuController.h"

typedef enum {
    menuIndexColor,
}menuIndex;

@interface VEMenuController ()

@property (nonatomic, strong) NSMutableArray *menuArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation VEMenuController

#pragma mark - NSObject

- (id)init {
    self = [super init];
    if (self) {
        //
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        //
    }
    return self;
}

#pragma mark - Getter

- (NSMutableArray *)menuArray {
    if (!_menuArray) {
        _menuArray = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return _menuArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    }
    return _tableView;
}

#pragma mark - ViewLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    WS(ws);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.menuArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const cellIndificater = @"menuCellIndificater";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndificater];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndificater];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {

        case menuIndexColor: {
            break;
        }

        default:
            break;
    }
}


@end
