//
//  VEStringController.m
//  VCommonKit_Example
//
//  Created by Vic Zhou on 3/5/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

#import "VEStringController.h"
#import "NSString+VCommon.h"

@interface VEStringController ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation VEStringController

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
        _textView.editable = NO;
        UIFont *boldFont = [UIFont boldSystemFontOfSize:17.f];
        //md5
        NSString *md5 = [NSString stringWithFormat:@"- (NSString *)md5String;\n\n123456转换的MD5为:%@\n\n\n", [self MD5]];
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:md5];
        [attributedStr addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0, 24)];

        //replace special char
        NSString *special = [NSString stringWithFormat:@"- (NSString*)specialCharReplace;\n\n1&lt;2&gt;3&amp;4&apos;5&quot;6替换为:%@\n\n\n", [self specialReplace]];
        NSMutableAttributedString *sepcialAttributed = [[NSMutableAttributedString alloc] initWithString:special];
        [sepcialAttributed addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0, 32)];

        //date compare
        NSString *compare = [NSString stringWithFormat:@"- (BOOL)earlierToString:(NSString*)dateString stringFormat:(NSString *)stringFormat selfFormat:(NSString *)selfFormat\n\n2014-5-25%@2015-3-2\n\n\n", [self compareDate]];
        NSMutableAttributedString *compareAttributed = [[NSMutableAttributedString alloc] initWithString:compare];
        [compareAttributed addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0, 117)];

        //phone
        NSString *phone = [NSString stringWithFormat:@"- (BOOL)isPhoneNumber\n\n12345678901%@\n18114352765%@\n\n\n", [self isPhone:@"12345678901"], [self isPhone:@"18114352765"]];
        NSMutableAttributedString *phoneAttributed = [[NSMutableAttributedString alloc] initWithString:phone];
        [phoneAttributed addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0, 21)];

        //email
        NSString *email = [NSString stringWithFormat:@"- (BOOL)isEmail\n\nvic.mail%@\nvic@vic.com%@\n\n\n", [self isEmail:@"vic.mail"], [self isEmail:@"vic@vic.com"]];
        NSMutableAttributedString *emailAttributed = [[NSMutableAttributedString alloc] initWithString:email];
        [emailAttributed addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0, 15)];

        //phone
        NSString *net = [NSString stringWithFormat:@"- (BOOL)isNetAddress\n\nhttp:net.%@\nhttp://net.com%@\n\n\n", [self isNet:@"http:net."], [self isNet:@"http://net.com"]];
        NSMutableAttributedString *netAttributed = [[NSMutableAttributedString alloc] initWithString:net];
        [netAttributed addAttribute:NSFontAttributeName value:boldFont range:NSMakeRange(0, 20)];

        [attributedStr appendAttributedString:sepcialAttributed];
        [attributedStr appendAttributedString:compareAttributed];
        [attributedStr appendAttributedString:phoneAttributed];
        [attributedStr appendAttributedString:emailAttributed];
        [attributedStr appendAttributedString:netAttributed];
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
    self.title = @"String";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions Private
#pragma mark VCommon

- (NSString*)MD5 {
    return [@"123456" md5String];
}

- (NSString*)specialReplace {
    return [@"1&lt;2&gt;3&amp;4&apos;5&quot;6" specialCharReplace];
}

- (NSString*)compareDate {
    if ([@"2014-5-25" earlierToString:@"2015-3-2" stringFormat:@"yyyy-mm-dd" selfFormat:@"yyyy-mm--dd"]) {
        return @"早于";
    }else {
        return @"晚于";
    }
}

- (NSString*)isPhone:(NSString*)phone{
    if ([phone isPhoneNumber]) {
        return @"国内手机号码";
    }else {
        return @"非国内手机号码";
    }
}

- (NSString*)isEmail:(NSString*)email {
    if ([email isEmail]) {
        return @"邮箱合法";
    }else {
        return @"邮箱无效";
    }
}

- (NSString*)isNet:(NSString*)net {
    if ([net isNetAddress]) {
        return @"网址合法";
    }else {
        return @"网址无效";
    }
}

@end
