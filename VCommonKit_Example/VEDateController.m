//
//  VEDateController.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/5/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "VEDateController.h"

@implementation VEDateController

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

#pragma mark - ViewLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Date";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
