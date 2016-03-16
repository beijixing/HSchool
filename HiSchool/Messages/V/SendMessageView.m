//
//  SendMessageView.m
//  HiSchool
//
//  Created by ybon on 16/3/9.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "SendMessageView.h"
#import "Masonry.h"

@interface SendMessageView ()<UITextFieldDelegate>
@property(nonatomic, strong) UITextField *inputTextField;
@property(nonatomic, strong) UIButton *sendButton;
@end

@implementation SendMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.inputTextField = [[UITextField alloc] init];
        self.inputTextField.borderStyle = UITextBorderStyleLine;
        self.inputTextField.delegate = self;
       
        self.sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.sendButton addTarget:self action:@selector(sendButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.sendButton setTitle:@"发送" forState:UIControlStateNormal];
        self.sendButton.backgroundColor = [UIColor greenColor];
        
        [self addSubview:self.inputTextField];
        [self addSubview:self.sendButton];
    }
    return self;
}

- (void)sendButtonClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(getInputText:)]) {
        [self.delegate getInputText:self.inputTextField.text];
    }
}

-(void)layoutSubviews {
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(self.sendButton.mas_left).offset(-5);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
    }];
    
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.right.mas_equalTo(self).offset(-5);
        make.top.mas_equalTo(self.inputTextField.mas_top);
        make.bottom.mas_equalTo(self.inputTextField.mas_bottom);
    }];
}

- (void)addButtonImage:(UIImage *)image andSelectedImage:(UIImage *)selectedImage {
    [self.sendButton setImage:image forState:UIControlStateNormal];
    [self.sendButton setImage:selectedImage forState:UIControlStateSelected];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}
@end
