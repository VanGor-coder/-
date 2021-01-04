//
//  UIImage+Image.h
//  12125-个人详情页
//
//  Created by GaoFan on 2020/12/18.
//  Copyright © 2020 GaoFan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Image)
//根据颜色生成一张尺寸为你1*1的相同颜色图片
+(UIImage *)imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
