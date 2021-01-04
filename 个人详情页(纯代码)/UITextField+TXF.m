//
//  UITextField+TXF.m
//  个人详情页(纯代码)
//
//  Created by GaoFan on 2020/12/21.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import "UITextField+TXF.h"

@implementation UITextField (TXF)


-(void)addInputAccessoryView
{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];

    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(2, 5, 24, 20);
    
    [btn addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"收起1"] forState:UIControlStateNormal];
    btn.imageEdgeInsets = UIEdgeInsetsMake(5, 15, 5, -15); //{top, left, bottom, right};
    [btn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneBtn,nil];
    [topView setItems:buttonsArray];
    [self setInputAccessoryView:topView];
}

-(void)dismissKeyBoard
{
    [self resignFirstResponder];
}

@end
