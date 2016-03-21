//
//  MineDormVC.m
//  HiSchool
//
//  Created by ybon on 16/3/11.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "MineDormVC.h"
#import "CirculateView.h"
#import "MineDormCell.h"

@interface MineDormVC ()<UICollectionViewDataSource, UICollectionViewDelegate>
{
    CirculateView *_adView;
    UICollectionView  *_dormCollectionView;
}
@end

@implementation MineDormVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self configNavigationItemTitleView];
    [self clearNavigationItemLeftBarButton];
    
    [self addRightItemsBackEventNotification];
    self.isRightViewController = YES;
    
    
    [self setupAdView];
}

- (void)setupAdView {
    _adView = [[CirculateView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120*self.scaleRatio)];
    [_adView addScrollImages:@[]];
//    [self.view addSubview:_adView];
    
    
     UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
     flowlayout.minimumLineSpacing = 20; //设置每一行的间距
     flowlayout.itemSize=CGSizeMake(100, 100);  //设置每个单元格的大小
     flowlayout.sectionInset=UIEdgeInsetsMake(0, 0, 50, 0);
     flowlayout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 120); //设置collectionView头视图的大小
    
     UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64-49) collectionViewLayout:flowlayout];
     [collectionView addSubview:_adView];
     collectionView.delegate = self;
     collectionView.dataSource = self;
    
     [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectioncell"];
     [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
     [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectioncell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];

        [header addSubview:_adView];
        return header;
    }
    return nil;
}


//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}

//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, 10, 0, 10);
//}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 1;
//}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
