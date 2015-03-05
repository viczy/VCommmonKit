//
//  VEBaseController.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/5/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "VEBaseController.h"

@implementation VEBaseController

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
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
