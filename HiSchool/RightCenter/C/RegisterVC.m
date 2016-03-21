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
//@property(nonatomic, strong) UIPickerView *sexPicker;
@property(nonatomic, strong) UITextField *schoolNameTF;
@property(nonatomic, strong) UITextField *entranceTimeTF;
@property(nonatomic, strong) UITextField *passwordTF;
@property(nonatomic, strong) UITextField *confirmPswdTF;
@property(nonatomic, strong) CheckButton *agreeCheckButton;
@property(nonatomic, strong) CheckButton *boyCheckButton;
@property(nonatomic, strong) CheckButton *girlCheckButton;
@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createUI];
    [self clearNavigationItemLeftBarButton];
    [self configNavigationItemWithTitle:@"注册"];
    self.isRightViewController = YES;
}

- (void)createUI {
    UIScrollView *scrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60)];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 568-64);
    [self.view addSubview:scrollView];
    
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
    self.userNameTF.borderStyle = UITextBorderStyleNone;
    self.userNameTF.placeholder = @"用户名";
    
    self.schoolNameTF = [[UITextField alloc] init];
    self.schoolNameTF.borderStyle = UITextBorderStyleNone;
    self.schoolNameTF.placeholder = @"输入学校";
    
    self.entranceTimeTF = [[UITextField alloc] init];
    self.entranceTimeTF.borderStyle = UITextBorderStyleNone;
    self.entranceTimeTF.placeholder = @"入学年份，如2015";

    
    self.passwordTF = [[UITextField alloc] init];
    self.passwordTF.borderStyle = UITextBorderStyleNone;
    self.passwordTF.placeholder = @"输入密码";
    
    self.confirmPswdTF = [[UITextField alloc] init];
    self.confirmPswdTF.borderStyle = UITextBorderStyleNone;
    self.confirmPswdTF.placeholder = @"确认密码";
    
    UIImageView *line1 = [[UIImageView alloc] init];
    line1.backgroundColor = ColorWithRGB(240, 240, 240);
    [scrollView addSubview:line1];
    
    UIImageView *line2 = [[UIImageView alloc] init];
    line2.backgroundColor = ColorWithRGB(240, 240, 240);
    [scrollView addSubview:line2];
    
    UIImageView *line3 = [[UIImageView alloc] init];
    line3.backgroundColor = ColorWithRGB(240, 240, 240);
    [scrollView addSubview:line3];
    
    
    UIImageView *line4 = [[UIImageView alloc] init];
    line4.backgroundColor = ColorWithRGB(240, 240, 240);
    [scrollView addSubview:line4];
    
    UIImageView *line5 = [[UIImageView alloc] init];
    line5.backgroundColor = ColorWithRGB(240, 240, 240);
    [scrollView addSubview:line5];
    
    UIImageView *line6 = [[UIImageView alloc] init];
    line6.backgroundColor = ColorWithRGB(240, 240, 240);
    [scrollView addSubview:line6];
    
    self.agreeCheckButton = [[CheckButton alloc] init];
    [self.agreeCheckButton setNormalImage:[UIImage imageNamed:@"register_Unselected"] andSelectedImage:[UIImage imageNamed:@"register_selectedAgree"]];
    [self.agreeCheckButton setTitleColor:ColorWithRGB(196, 197, 198) andFont:[UIFont fontWithName:@"Arial" size:12.0f] andTitleText:@"同意"];
    [self.agreeCheckButton setSelectedState:YES];
    [scrollView addSubview:self.agreeCheckButton];
    
    self.boyCheckButton = [[CheckButton alloc] init];
    [self.boyCheckButton setNormalImage:[UIImage imageNamed:@"register_Unselected"] andSelectedImage:[UIImage imageNamed:@"register_selectedNan"]];
    [self.boyCheckButton setTitleColor:[UIColor blackColor] andFont:[UIFont fontWithName:@"Arial" size:17.0f] andTitleText:@"男"];
    [self.boyCheckButton setSelectedState:YES];
    [scrollView addSubview:self.boyCheckButton];

    self.girlCheckButton = [[CheckButton alloc] init];
    [self.girlCheckButton setNormalImage:[UIImage imageNamed:@"register_Unselected"] andSelectedImage:[UIImage imageNamed:@"register_selectedNv"]];
    [self.girlCheckButton setTitleColor:[UIColor blackColor] andFont:[UIFont fontWithName:@"Arial" size:17.0f] andTitleText:@"女"];
    [self.girlCheckButton setSelectedState:NO];
    [scrollView addSubview:self.girlCheckButton];
    
    
    UIButton *userProtocol = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [userProtocol setTitle:@"《Hi School 用户使用协议》" forState:UIControlStateNormal];
    [userProtocol addTarget:self action:@selector(userProtocolButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [userProtocol setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    userProtocol.titleLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
    [userProtocol setTitleColor: ColorWithRGB(196, 197, 198) forState:UIControlStateNormal];
    [scrollView addSubview:userProtocol];
    
    UIButton *completeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [completeButton setTitle:@"完成" forState:UIControlStateNormal];
    [completeButton addTarget:self action:@selector(completeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    completeButton.backgroundColor = ColorWithRGB(73, 139, 239);
    [completeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [scrollView addSubview:completeButton];
    

    [scrollView addSubview:userNameLB];
    [scrollView addSubview:self.userNameTF];
    [scrollView addSubview:sexLB];
//    [scrollView addSubview:self.sexPicker];
    [scrollView addSubview:schoolNameLabel];
    [scrollView addSubview:self.schoolNameTF];
    [scrollView addSubview:entranceLabel];
    [scrollView addSubview:self.entranceTimeTF];
    [scrollView addSubview:passwordLabel];
    [scrollView addSubview:self.passwordTF];
    [scrollView addSubview:confirmPaswdLabel];
    [scrollView addSubview:self.confirmPswdTF];
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
    
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userNameLB.mas_bottom).offset(10*self.scaleRatio);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    [sexLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(line1.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);
    }];
    
    
    [self.boyCheckButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 18*self.scaleRatio));
        make.top.mas_equalTo(sexLB.mas_top).offset(5*self.scaleRatio);
        make.left.mas_equalTo(sexLB.mas_right).offset(10*self.scaleRatio);
    }];
    
    [self.girlCheckButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 18*self.scaleRatio));
        make.top.mas_equalTo(sexLB.mas_top).offset(5*self.scaleRatio);
        make.left.mas_equalTo(self.boyCheckButton.mas_right).offset(40*self.scaleRatio);
    }];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sexLB.mas_bottom).offset(10*self.scaleRatio);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
//    [self.sexPicker mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 60*self.scaleRatio));
//        make.top.mas_equalTo(sexLB.mas_top).offset(-15*self.scaleRatio);
//        make.left.mas_equalTo(sexLB.mas_right).offset(5);
//    }];
    
    [schoolNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(line2.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);
    }];
    
    [self.schoolNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(schoolNameLabel.mas_top);
        make.left.mas_equalTo(schoolNameLabel.mas_right).offset(5);
    }];
    
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(schoolNameLabel.mas_bottom).offset(10*self.scaleRatio);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    [entranceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(line3.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);
    }];
    
    [self.entranceTimeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(entranceLabel.mas_top);
        make.left.mas_equalTo(entranceLabel.mas_right).offset(5);
    }];
    
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(entranceLabel.mas_bottom).offset(10*self.scaleRatio);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    
    [passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(line4.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);

    }];
    
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(passwordLabel.mas_top);
        make.left.mas_equalTo(passwordLabel.mas_right).offset(5);

    }];
    
    [line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(passwordLabel.mas_bottom).offset(10*self.scaleRatio);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    [confirmPaswdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(line5.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(userNameLB.mas_left);
    }];
    
    [self.confirmPswdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(confirmPaswdLabel.mas_top);
        make.left.mas_equalTo(confirmPaswdLabel.mas_right).offset(5);
    }];
    
    [line6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(confirmPaswdLabel.mas_bottom).offset(10*self.scaleRatio);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    [completeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(line6.mas_bottom).offset(40*self.scaleRatio);
        make.centerX.mas_equalTo(scrollView.mas_centerX);
    }];
    completeButton.layer.cornerRadius = 8;
    
    [self.agreeCheckButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60*self.scaleRatio, 20*self.scaleRatio));
        make.left.mas_equalTo(completeButton.mas_left).offset(3*self.scaleRatio);
        make.top.mas_equalTo(completeButton.mas_bottom).offset(5*self.scaleRatio);
    }];
    
    [userProtocol mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(170*self.scaleRatio, 20*self.scaleRatio));
        make.top.mas_equalTo(completeButton.mas_bottom).offset(8*self.scaleRatio);
        make.left.mas_equalTo(self.agreeCheckButton.mas_right).offset(-20*self.scaleRatio);
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
