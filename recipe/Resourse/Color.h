//
//  Color.h
//  HuiJiaYou
//
//  Created by qizhijian on 16/1/26.
//  Copyright © 2016年 qizhijian. All rights reserved.
//

#ifndef Color_h
#define Color_h

#define RGB_COLOR(_STR_) ([UIColor colorWithRed:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(1, 2)] UTF8String], 0, 16)] intValue] / 255.0 green:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(3, 2)] UTF8String], 0, 16)] intValue] / 255.0 blue:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(5, 2)] UTF8String], 0, 16)] intValue] / 255.0 alpha:1.0])

//导航栏背景颜色、字体
#define kWord_Color_High              @"#333333"
#define kWord_Color_Event             @"#666666"
#define kWord_Color_Low               @"#999999"
#define kNav_BackColor                @"#fafafa"
#define k_Name_color                  @"#222222"
#define k_Color_Middle                @"#555555"


#define k_TraceLine_Color             @"#d2d2d2" //描边
#define kWord_Color_High              @"#333333"
#define kWeiZoneCellColor             @"#efefef" //239,239,239
#define kProgressForgColor            @"#fd461e" //253,70,30
#define kProgressbackColor            @"#e3e3e3" //227,227,227
#define kViewBackColor                @"#eeeeee"
#define k_Button_Color                @"#dc0f50" //玫红色按钮
#define k_TraceLine_Color             @"#d2d2d2" //描边
#define k_Other_Color_1               @"#5a85a2" //暗蓝色
#define k_ViewBack_Color              @"#f5f5f5" //全局背景颜色
#define k_HomeBordLine_Color          @"#E5E5E5" //首页的描边
#define k_HomeImageBack_color         @"#f8f8f8" //首页imageView的背景颜色
#define k_White_Color                 @"#FFFFFF"
#define k_LightLine_Color             @"#e5e5e5" // 淡描边
#define k_SellButton_Color            @"#ff5050" // 特价颜色
#define k_Gray_Color                  @"#adadad" // 灰颜色
#define k_Yellow_Color                @"#ffdc1c" // 黄色
#define k_YellowBg_Color              @"#fea829" //赠品标签黄色
#define k_RemindBackolor              @"#dc6c8f" //粉红色背景
#define k_Address_BordLine            @"#FEA829" //身份证描边
#define k_Address_BgColor             @"#FFFDED" //身份证填充
#define k_Address_Title               @"#E70000" //身份证字体
#define k_GuideTitle_Color            @"#cccccc" //引导页字体颜色
#define k_ShopCar_Activety_Color      @"#fea829" //购物车活动标签颜色

#endif
