//
//  VEColorController.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/5/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "VEColorController.h"
#import "UIColor+VCommon.h"

@interface VEColorController ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation VEColorController

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

- (UITextView*)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@"+ (UIColor*)instanceWithString:(NSString*)rgba;\n\n+ (UIColor*)instanceWithIntRed:(NSInteger)red intGreen:(NSInteger)green intBlue:(NSInteger)blue andAlpha:(CGFloat)alpha;\n"];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:[self color1] range:NSMakeRange(0, 47)];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:[self color2] range:NSMakeRange(49, 120)];
        _textView.attributedText = attributedStr;
    }
    return _textView;
}

#pragma mark - ViewLoad

- (void)loadView {
    [super loadView];
    [self.view addSubview:self.textView];
    WS(ws);
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Color";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions Private 
#pragma mark VCommon

- (UIColor*)color1 {
    return [UIColor instanceWithString:@"#006699"];
}

- (UIColor*)color2 {
    return [UIColor instanceWithIntRed:0 intGreen:102 intBlue:102 andAlpha:1.f];
}

@end
