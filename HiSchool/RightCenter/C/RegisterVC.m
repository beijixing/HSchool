//
//  RegisterVC.m
//  HiSchool
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "RegisterVC.h"
#import "Masonry.h"
#import "CheckButton.h"
#import "RegisterSuccedVC.h"

@interface RegisterVC ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property(nonatomic, strong) UITextField *userNameTF;
@property(nonatomic, strong) UIPickerView *sexPicker;
@property(nonatomic, strong) UITextField *schoolNameTF;
@property(nonatomic, strong) UITextField *entranceTimeTF;
@property(nonatomic, strong) UITextField *passwordTF;
@property(nonatomic, strong) UITextField *confirmPswdTF;
@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createUI];
    [self clearNavigationItemLeftBarButton];
    [self configNavigationItemTitleView];
    self.isRightViewController = YES;
}

- (void)createUI {
    
    UILabel *userNameLB = [[UILabel alloc] init];
    userNameLB.text = @"用户名";
    userNameLB.font = [UIFont fontWithName:@"Arial" size:14.0f];
    
    UILabel *sexLB = [[UILabel alloc] init];
    sexLB.text = @"性别";
    sexLB.font = [UIFont fontWithName:@"Arial" size:14.0f];
    
    UILabel *schoolNameLabel = [[UILabel alloc] init];
    schoolNameLabel.text = @"学校";
    schoolNameLabel.font = [UIFont fontWithName:@"Arial" size:14.0f];
    
    UILabel *entranceLabel = [[UILabel alloc] init];
    entranceLabel.text = @"入学时间";
    entranceLabel.font = [UIFont fontWithName:@"Arial" size:14.0f];
    
    UILabel *passwordLabel = [[UILabel alloc] init];
    passwordLabel.text = @"输入密码";
    passwordLabel.font = [UIFont fontWithName:@"Arial" size:14.0f];
    
    UILabel *confirmPaswdLabel = [[UILabel alloc] init];
    confirmPaswdLabel.text = @"确认密码";
    confirmPaswdLabel.font = [UIFont fontWithName:@"Arial" size:14.0f];
    
    self.userNameTF = [[UITextField alloc] init];
    self.userNameTF.borderStyle = UITextBorderStyleLine;
    
    self.sexPicker = [[UIPickerView alloc] init];
    self.sexPicker.delegate = self;
    self.sexPicker.dataSource = self;
    
    
    self.schoolNameTF = [[UITextField alloc] init];
    self.schoolNameTF.borderStyle = UITextBorderStyleLine;
    
    self.entranceTimeTF = [[UITextField alloc] init];
    self.entranceTimeTF.borderStyle = UITextBorderStyleLine;
    
    self.passwordTF = [[UITextField alloc] init];
    self.passwordTF.borderStyle = UITextBorderStyleLine;
    
    self.confirmPswdTF = [[UITextField alloc] init];
    self.confirmPswdTF.borderStyle = UITextBorderStyleLine;
    
    CheckButton *checkButton = [[CheckButton alloc] init];
    [checkButton setNormalImage:[UIImage imageNamed:@"unselect"] andSelectedImage:[UIImage imageNamed:@"selected"]];
    [checkButton setTitleColor:[UIColor blueColor] andFont:[UIFont fontWithName:@"Arial" size:12.0f] andTitleText:@"同意"];
    [checkButton setSelectedState:NO];
    [self.view addSubview:checkButton];
    
    
    UIButton *userProtocol = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [userProtocol setTitle:@"《Hi School 用户使用协议》" forState:UIControlStateNormal];
    [userProtocol addTarget:self action:@selector(userProtocolButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [userProtocol setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    userProtocol.titleLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
    [self.view addSubview:userProtocol];
    
    UIButton *completeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [completeButton setTitle:@"完成" forState:UIControlStateNormal];
    [completeButton addTarget:self action:@selector(completeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    completeButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:completeButton];
    

    [self.view addSubview:userNameLB];
    [self.view addSubview:self.userNameTF];
    [self.view addSubview:sexLB];
    [self.view addSubview:self.sexPicker];
    [self.view addSubview:schoolNameLabel];
    [self.view addSubview:self.schoolNameTF];
    [self.view addSubview:entranceLabel];
    [self.view addSubview:self.entranceTimeTF];
    [self.view addSubview:passwordLabel];
    [self.view addSubview:self.passwordTF];
    [self.view addSubview:confirmPaswdLabel];
    [self.view addSubview:self.confirmPswdTF];
    //添加约束
    [userNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(20*self.scaleRatio);
        make.left.mas_equalTo(20*self.scaleRatio);
    }];
    
    [self.userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(userNameLB.mas_top);
        make.left.mas_equalTo(userNameLB.mas_right).offset(5);
    }];
    
    [sexLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(userNameLB.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);
    }];
    
    [self.sexPicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 60*self.scaleRatio));
        make.top.mas_equalTo(sexLB.mas_top).offset(-15*self.scaleRatio);
        make.left.mas_equalTo(sexLB.mas_right).offset(5);
    }];
    
    [schoolNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(sexLB.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);
    }];
    
    [self.schoolNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(schoolNameLabel.mas_top);
        make.left.mas_equalTo(schoolNameLabel.mas_right).offset(5);
    }];
    
    [entranceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(schoolNameLabel.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);
    }];
    
    [self.entranceTimeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(entranceLabel.mas_top);
        make.left.mas_equalTo(entranceLabel.mas_right).offset(5);
    }];
    
    
    [passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(entranceLabel.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);

    }];
    
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(passwordLabel.mas_top);
        make.left.mas_equalTo(passwordLabel.mas_right).offset(5);

    }];
    
    [confirmPaswdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(passwordLabel.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);
    }];
    
    [self.confirmPswdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(confirmPaswdLabel.mas_top);
        make.left.mas_equalTo(confirmPaswdLabel.mas_right).offset(5);
    }];
    
    [checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 20*self.scaleRatio));
        make.left.mas_equalTo(confirmPaswdLabel.mas_right).offset(3*self.scaleRatio);
        make.top.mas_equalTo(confirmPaswdLabel.mas_bottom).offset(5*self.scaleRatio);
    }];
    
    [userProtocol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(170*self.scaleRatio, 20*self.scaleRatio));
        make.top.mas_equalTo(confirmPaswdLabel.mas_bottom).offset(8*self.scaleRatio);
        make.left.mas_equalTo(checkButton.mas_right).offset(-20*self.scaleRatio);
    }];
    
    [completeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(userProtocol.mas_bottom).offset(10*self.scaleRatio);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
}

- (void)completeButtonClick:(UIButton *)sender {
    RegisterSuccedVC *registerSuccedVc = [[RegisterSuccedVC alloc] init];
    [self.navigationController pushViewController:registerSuccedVc animated:YES];
}

- (void)userProtocolButtonClick:(UIButton *)sender {
    
}


#pragma mark --UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
}
#pragma mark --UIPickerViewDelegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 60*self.scaleRatio;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (row == 0) {
        return @"男";
    }else if(row == 1){
        return @"女";
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"row=%ld", row);
}


@end
