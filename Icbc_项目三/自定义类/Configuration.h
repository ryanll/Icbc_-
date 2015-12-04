//
//  Configuration.h
//  NaturaDemo
//
//  Created by yanll on 15/9/26.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CellHeight  72
#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define VIEW_WIDTH     CGRectGetWidth(self.view.bounds)
#define VIEW_HEIGHT    CGRectGetHeight(self.view.bounds)
#define CUSTOMBACKCOLOR [UIColor colorWithWhite:0 alpha:0.47]

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

#define IMAGEWITHNAME(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]]
#define COLORWITHRGB(_a,_b,_c,_d) [UIColor colorWithRed:_a/255.0 green:_b/255.0 blue:_c/255.0 alpha:_d]



/**< 沙盒地址 */
#define DOCUMENT_PATH NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

/**< 文件管理类 */
#define DEFAULT_FILEMANAGER [NSFileManager defaultManager]
static NSString *const KShowIdentify = @"showIdentify";
static NSString *const plistName      = @"/UserInfomation.plist";
static NSString *const dataKey        = @"datas";
