//
//  LoginAndRegisterVC.m
//  HiSchool
//
//  Created by ybon on 16/3/10.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "LoginAndRegisterVC.h"
#import "Masonry.h"
#import "RegisterVC.h"

@interface LoginAndRegisterVC ()
@property(nonatomic, strong) UIImageView *logoIcon;
@property(nonatomic, strong) UITextField *userNameTF;
@property(nonatomic, strong) UITextField *passwordTF;
@property(nonatomic, strong) UIButton *forgetPswdButton;
@property(nonatomic, strong) UIButton *loginButton;
@property(nonatomic, strong) UIButton *registerButton;
@end

@implementation LoginAndRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configNavigationItemTitleView];
    [self createUI];
    [self clearNavigationItemLeftBarButton];
    
    [self addRightItemsBackEventNotification];
    self.isRightViewController = YES;
    
}

- (void)createUI {
    self.logoIcon = [[UIImageView alloc] init];
    self.logoIcon.backgroundColor = [UIColor redColor];
    
    self.userNameTF = [[UITextField alloc] init];
    self.userNameTF.layer.cornerRadius = 10;
    self.userNameTF.borderStyle = UITextBorderStyleRoundedRect;
    self.userNameTF.placeholder = @"手机号/用户名";
    
    self.passwordTF = [[UITextField alloc] init];
    self.passwordTF.layer.cornerRadius = 10;
    self.passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTF.placeholder = @"密码";

    self.forgetPswdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.forgetPswdButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [self.forgetPswdButton addTarget:self action:@selector(forgetPswdButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton.backgroundColor = [UIColor greenColor];
    self.loginButton.layer.cornerRadius = 10;
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.registerButton.backgroundColor = [UIColor greenColor];
    self.registerButton.layer.cornerRadius = 10;
    
    [self.view addSubview:self.logoIcon];
    [self.view addSubview:self.userNameTF];
    [self.view addSubview:self.passwordTF];
    [self.view addSubview:self.forgetPswdButton];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    
    [self.logoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(50*self.scaleRatio, 50*self.scaleRatio));
        make.top.mas_equalTo(50*self.scaleRatio);
    }];
    self.logoIcon.layer.cornerRadius = 25*self.scaleRatio;
    
    
    [self.userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logoIcon.mas_bottom).offset(60*self.scaleRatio);
        make.left.mas_equalTo(self.view).offset(40*self.scaleRatio);
        make.right.mas_equalTo(self.view).offset(-40*self.scaleRatio);
        make.height.mas_equalTo(35*self.scaleRatio);
    }];
    
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userNameTF.mas_bottom).offset(40*self.scaleRatio);
        make.left.mas_equalTo(self.view).offset(40*self.scaleRatio);
        make.right.mas_equalTo(self.view).offset(-40*self.scaleRatio);
        make.height.mas_equalTo(35*self.scaleRatio);
    }];
    
    [self.forgetPswdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom).offset(5*self.scaleRatio);
        make.right.mas_equalTo(self.passwordTF.mas_right);
        make.size.mas_equalTo(CGSizeMake(100*self.scaleRatio, 30*self.scaleRatio));
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom).offset(45*self.scaleRatio);
        make.left.mas_equalTo(self.passwordTF.mas_left);
        make.size.mas_equalTo(CGSizeMake(80*self.scaleRatio, 40*self.scaleRatio));
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom).offset(45*self.scaleRatio);
        make.right.mas_equalTo(self.passwordTF.mas_right);
        make.size.mas_equalTo(CGSizeMake(80*self.scaleRatio, 40*self.scaleRatio));
    }];
    
}

- (void)forgetPswdButtonClick:(UIButton *)sender {
    
}

- (void)loginButtonClick:(UIButton *)sender {
    
}

- (void)registerButtonClick:(UIButton *)sender {
    RegisterVC *registerVc = [[RegisterVC alloc] init];
    [self.navigationController pushViewController:registerVc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
