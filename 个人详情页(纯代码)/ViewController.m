//
//  ViewController.m
//  个人详情页(纯代码)
//
//  Created by GaoFan on 2020/12/21.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+TXF.h"
#import "UIImage+Image.h"
#import "Masonry.h"
#define oriOffsetY -244
#define oriHeight 200
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView *topV;
@property (nonatomic,strong) UIView *greenV;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITextField *textfield;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"个人详情页";
    
    UILabel *titleV = [UILabel new];
    titleV.text = @"个人详情页";
    [titleV sizeToFit];
    titleV.alpha = 0;
    self.navigationItem.titleView = titleV;
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource =self;

    [self.view addSubview:self.tableView];

    self.tableView.clipsToBounds = NO;
    [self.view addSubview:self.topV];
    [self.view addSubview:self.greenV];
    
    [self.topV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(200);
    }];
    
    [self.greenV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.topV.mas_bottom);
        make.height.mas_equalTo(44);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
    self.tableView.contentInset = UIEdgeInsetsMake(184, 0, 0, 0);
}
-(UIView *)topV
{
    if (!_topV) {
        _topV = [[UIView alloc]init];
        UIImageView *backImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
        backImg.contentMode = UIViewContentModeScaleAspectFill;
        [_topV addSubview:backImg];
        _topV.clipsToBounds = YES; //剪裁掉图片多余的部分
        [backImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(_topV);
        }];
        
        UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
        [_topV addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(_topV);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
        
    }
    return _topV;
}
- (UIView *)greenV
{
    if (!_greenV) {
        _greenV = [[UIView alloc]init];
        _greenV.backgroundColor = [UIColor greenColor];
    }
    return _greenV;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    }
    return _tableView;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = @"gf";
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",scrollView.contentOffset.y);
    
    //计算偏移量
    CGFloat offset = scrollView.contentOffset.y - oriOffsetY;
    CGFloat h = oriHeight - offset;
    if (h <= 64) {
        h = 64;
    }
    [self.topV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(h);
    }];
    
    CGFloat alpha = offset*1/136;
    if (alpha>=1) {
        alpha = 0.99;
    }
    
    UIColor *color = [UIColor colorWithWhite:1.0 alpha:alpha];
    UIImage *colImage= [UIImage imageWithColor:color];
    
    [self.navigationController.navigationBar setBackgroundImage:colImage forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.titleView.alpha = alpha;
}

@end
