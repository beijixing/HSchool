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
#import "CheckButton.h"

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

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)createUI {
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImage.image = [UIImage imageNamed:@"loginBG"];
    [self.view addSubview:bgImage];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 568);
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor clearColor];

    
    self.logoIcon = [[UIImageView alloc] init];
    self.logoIcon.image = [UIImage imageNamed:@"hiSchool2"];
    
    self.userNameTF = [[UITextField alloc] init];
    self.userNameTF.borderStyle = UITextBorderStyleNone;
    self.userNameTF.placeholder = @"手机号/用户名";
    self.userNameTF.textColor = [UIColor whiteColor];
    self.userNameTF.background = [UIImage imageNamed:@"loginTextFieldBg"];
    
    CheckButton *autoLoginButton = [[CheckButton alloc] init];
    [autoLoginButton setNormalImage:[UIImage imageNamed:@"autoLoginUnselect"] andSelectedImage:[UIImage imageNamed:@"autoLoginSelect"]];
    [autoLoginButton setTitleColor:[UIColor whiteColor] andFont:[UIFont fontWithName:@"Arial" size:12.0f] andTitleText:@"自动登录"];
    [autoLoginButton setSelectedState:YES];
    
    
    self.passwordTF = [[UITextField alloc] init];
    self.passwordTF.borderStyle = UITextBorderStyleNone;
    self.passwordTF.background = [UIImage imageNamed:@"loginTextFieldBg"];
    self.passwordTF.placeholder = @"密码";
    self.passwordTF.textColor = [UIColor whiteColor];

    self.forgetPswdButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.forgetPswdButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.forgetPswdButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    self.forgetPswdButton.titleLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
    [self.forgetPswdButton addTarget:self action:@selector(forgetPswdButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"loginBtnCcliked"] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
   
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.registerButton setBackgroundImage:[UIImage imageNamed:@"registerBtnNormal"] forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(registerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:self.logoIcon];
    [scrollView addSubview:self.userNameTF];
    [scrollView addSubview:self.passwordTF];
    [scrollView addSubview:self.forgetPswdButton];
    [scrollView addSubview:self.loginButton];
    [scrollView addSubview:self.registerButton];
    [scrollView addSubview:autoLoginButton];
    
    [self.logoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(212*self.scaleRatio, 30*self.scaleRatio));
        make.top.mas_equalTo(65*self.scaleRatio);
    }];
    
    
    [self.userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logoIcon.mas_bottom).offset(60*self.scaleRatio);
        make.left.mas_equalTo(self.view).offset(40*self.scaleRatio);
        make.right.mas_equalTo(self.view).offset(-40*self.scaleRatio);
        make.height.mas_equalTo(35*self.scaleRatio);
    }];
    
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userNameTF.mas_bottom).offset(15*self.scaleRatio);
        make.left.mas_equalTo(self.view).offset(40*self.scaleRatio);
        make.right.mas_equalTo(self.view).offset(-40*self.scaleRatio);
        make.height.mas_equalTo(35*self.scaleRatio);
    }];
    
    [autoLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom).offset(10*self.scaleRatio);
        make.left.mas_equalTo(self.passwordTF.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(100*self.scaleRatio, 15*self.scaleRatio));
    }];
    
    [self.forgetPswdButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom).offset(12*self.scaleRatio);
        make.right.mas_equalTo(self.passwordTF.mas_right).offset(10*self.scaleRatio);
        make.size.mas_equalTo(CGSizeMake(100*self.scaleRatio, 15*self.scaleRatio));
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom).offset(60*self.scaleRatio);
        make.left.mas_equalTo(self.passwordTF.mas_left);
        make.size.mas_equalTo(CGSizeMake(115*self.scaleRatio, 30*self.scaleRatio));
    }];
//     self.loginButton.layer.cornerRadius = 15*self.scaleRatio;
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom).offset(60*self.scaleRatio);
        make.right.mas_equalTo(self.passwordTF.mas_right);
        make.size.mas_equalTo(CGSizeMake(115*self.scaleRatio, 30*self.scaleRatio));
    }];
//    self.loginButton.layer.cornerRadius = 15*self.scaleRatio;
    
    UIImageView *leftLine = [[UIImageView alloc] init];
    leftLine.image = [UIImage imageNamed:@"leftLine"];
    [scrollView addSubview:leftLine];
    
    UILabel *thirdLoginLabel = [[UILabel alloc] init];
    thirdLoginLabel.text = @"第三方登录";
    thirdLoginLabel.textColor = [UIColor whiteColor];
    thirdLoginLabel.textAlignment = NSTextAlignmentCenter;
    thirdLoginLabel.font = [UIFont fontWithName:@"Arial" size:13.0f];
    [scrollView addSubview:thirdLoginLabel];
    
    UIImageView *rightLine = [[UIImageView alloc] init];
    rightLine.image = [UIImage imageNamed:@"rightLine"];
    [scrollView addSubview:rightLine];
    
    
    UIButton *thirdQQLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [thirdQQLoginBtn setBackgroundImage:[UIImage imageNamed:@"thirdQQ"] forState:UIControlStateNormal];
    [thirdQQLoginBtn addTarget:self action:@selector(thirdQQButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:thirdQQLoginBtn];
    
    UIButton *thirdWechatLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [thirdWechatLoginBtn setBackgroundImage:[UIImage imageNamed:@"thirdWechat"] forState:UIControlStateNormal];
    [thirdWechatLoginBtn addTarget:self action:@selector(thirdWechatButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:thirdWechatLoginBtn];
    
    UIButton *thirdWeiboLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [thirdWeiboLoginBtn setBackgroundImage:[UIImage imageNamed:@"thirdWebo"] forState:UIControlStateNormal];
    [thirdWeiboLoginBtn addTarget:self action:@selector(thirdWeiboButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:thirdWeiboLoginBtn];
    
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(45*self.scaleRatio);
        make.right.mas_equalTo(thirdLoginLabel.mas_left);
        make.size.mas_equalTo(CGSizeMake(50*self.scaleRatio, 1));
        make.centerY.mas_equalTo(thirdLoginLabel.mas_centerY);
    }];
    [thirdLoginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(60*self.scaleRatio);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(115*self.scaleRatio, 30*self.scaleRatio));
    }];
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(45*self.scaleRatio);
        make.left.mas_equalTo(thirdLoginLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(50*self.scaleRatio, 1));
        make.centerY.mas_equalTo(thirdLoginLabel.mas_centerY);
    }];
    
    [thirdQQLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(thirdLoginLabel.mas_bottom).offset(15*self.scaleRatio);
        make.right.mas_equalTo(thirdWechatLoginBtn.mas_left).offset(-15*self.scaleRatio);
        make.size.mas_equalTo(CGSizeMake(40*self.scaleRatio, 40*self.scaleRatio));
    }];
    
    [thirdWechatLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(thirdLoginLabel.mas_bottom).offset(15*self.scaleRatio);
//        make.left.mas_equalTo(thirdQQLoginBtn.mas_right);
        make.centerX.mas_equalTo(thirdLoginLabel.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(40*self.scaleRatio, 40*self.scaleRatio));
    }];
    
    [thirdWeiboLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(thirdLoginLabel.mas_bottom).offset(15*self.scaleRatio);
        make.left.mas_equalTo(thirdWechatLoginBtn.mas_right).offset(15*self.scaleRatio);
        make.size.mas_equalTo(CGSizeMake(40*self.scaleRatio, 40*self.scaleRatio));
    }];
    
}

- (void)thirdQQButtonClick:(UIButton *)sender {
    
}

- (void)thirdWechatButtonClick:(UIButton *)sender {
    
}

- (void)thirdWeiboButtonClick:(UIButton *)sender {
    
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
