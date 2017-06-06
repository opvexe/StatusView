//
//  VoteView.m
//  WithYou
//
//  Created by jieku on 2017/6/6.
//  Copyright © 2017年 jieku. All rights reserved.
//

#define FontPingFangSC(Size) [UIFont fontWithName:@"PingFangSC-Regular" size:Size*ScreenScale]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define WomanSexColor UIColorFromRGB(0xff72a4)
#define ManSexColor UIColorFromRGB(0x7fbeff)
#define ScreenScale                          (kScreenWidth / 375.0f)
#define Number(num)                      (num*ScreenScale)

#import "UserStatusView.h"
#import "UIImage+catagory.h"
#import <Masonry.h>

@interface UserStatusView()
@end

@implementation UserStatusView

-(void)InitDataWithTitle:(NSArray *)titles{

    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIColor *backGroundColor ;
    for (NSString *title in titles) {

        if ([title isEqualToString:@"is_Vip"]) {
            UIImageView *vipImageView = [[UIImageView alloc] init];
            vipImageView.image  = [UIImage imageNamed:@"icon-vip2"];
            vipImageView.contentMode  = UIViewContentModeScaleAspectFit;
            [self addSubview:vipImageView];
        }else if ([title rangeOfString:@"男"].location !=NSNotFound){
            UIButton  *sexImageView = [[UIButton alloc] init];
            sexImageView.layer.cornerRadius =3;
            sexImageView.layer.masksToBounds =YES;
            NSString *tempTile = [[title componentsSeparatedByString:@"男|"] lastObject];
            [sexImageView setTitle:tempTile forState:UIControlStateNormal];
            [sexImageView setTitle:tempTile forState:UIControlStateHighlighted];
            [sexImageView setTitle:tempTile forState:UIControlStateSelected];
            [sexImageView setTitle:tempTile forState:UIControlStateDisabled];
            [sexImageView setImageEdgeInsets:UIEdgeInsetsMake(0, Number(-3), 0, 0)];
            [sexImageView setTitleEdgeInsets:UIEdgeInsetsMake(0, Number(5), 0, 0)];
            [sexImageView setBackgroundImage:[UIImage imageWithColor:ManSexColor] forState:UIControlStateNormal];
             [sexImageView setBackgroundImage:[UIImage imageWithColor:ManSexColor] forState:UIControlStateHighlighted];
             [sexImageView setBackgroundImage:[UIImage imageWithColor:ManSexColor] forState:UIControlStateSelected];
             [sexImageView setBackgroundImage:[UIImage imageWithColor:ManSexColor] forState:UIControlStateDisabled];
            [sexImageView setImage:[UIImage imageNamed:@"icon-male"] forState:UIControlStateNormal];
            [sexImageView setImage:[UIImage imageNamed:@"icon-male"] forState:UIControlStateHighlighted];
            [sexImageView setImage:[UIImage imageNamed:@"icon-male"] forState:UIControlStateSelected];
             [sexImageView setImage:[UIImage imageNamed:@"icon-male"] forState:UIControlStateDisabled];
            sexImageView.titleLabel.font = FontPingFangSC(8);
            [sexImageView setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
            [sexImageView setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
            [sexImageView setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateHighlighted];
            [sexImageView setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateDisabled];
            sexImageView.contentMode  = UIViewContentModeScaleAspectFit;
            [self addSubview:sexImageView];
        }else if ([title rangeOfString:@"女"].location !=NSNotFound){
            UIButton  *sexImageView = [[UIButton alloc] init];
            sexImageView.layer.cornerRadius =3;
            sexImageView.layer.masksToBounds =YES;
            [sexImageView setBackgroundImage:[UIImage imageWithColor:WomanSexColor] forState:UIControlStateNormal];
            [sexImageView setBackgroundImage:[UIImage imageWithColor:WomanSexColor] forState:UIControlStateHighlighted];
            [sexImageView setBackgroundImage:[UIImage imageWithColor:WomanSexColor] forState:UIControlStateSelected];
            [sexImageView setBackgroundImage:[UIImage imageWithColor:WomanSexColor] forState:UIControlStateDisabled];
            [sexImageView setImageEdgeInsets:UIEdgeInsetsMake(0, Number(-3), 0, 0)];
            [sexImageView setTitleEdgeInsets:UIEdgeInsetsMake(0, Number(5), 0, 0)];
            NSString *tempTile = [[title componentsSeparatedByString:@"女|"] lastObject];
            [sexImageView setTitle:tempTile forState:UIControlStateNormal];
            [sexImageView setTitle:tempTile forState:UIControlStateHighlighted];
            [sexImageView setTitle:tempTile forState:UIControlStateSelected];
            [sexImageView setTitle:tempTile forState:UIControlStateDisabled];
            [sexImageView setImage:[UIImage imageNamed:@"icon-female"] forState:UIControlStateNormal];
            [sexImageView setImage:[UIImage imageNamed:@"icon-female"] forState:UIControlStateHighlighted];
            [sexImageView setImage:[UIImage imageNamed:@"icon-female"] forState:UIControlStateSelected];
            [sexImageView setImage:[UIImage imageNamed:@"icon-female"] forState:UIControlStateDisabled];
            sexImageView.titleLabel.font = FontPingFangSC(8);
            [sexImageView setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
            [sexImageView setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
            [sexImageView setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateHighlighted];
            [sexImageView setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateDisabled];
            sexImageView.contentMode  = UIViewContentModeScaleAspectFit;

            [self addSubview:sexImageView];
        }else{
            UILabel *statusLabel = [[UILabel alloc] init];
            statusLabel.layer.masksToBounds = YES;
            statusLabel.layer.cornerRadius =3;
            statusLabel.text  =title;
            if ([title rangeOfString:@"魅力"].location !=NSNotFound) {
                backGroundColor=UIColorFromRGB(0x9367ff);
            }else if([title rangeOfString:@"财富"].location !=NSNotFound){
                backGroundColor=UIColorFromRGB(0xff2d55);
                
            }
            statusLabel.textColor =UIColorFromRGB(0xffffff);
            statusLabel.backgroundColor =backGroundColor;
            statusLabel.layer.masksToBounds =YES;
            statusLabel.layer.borderWidth = 1.0f;
            statusLabel.layer.cornerRadius = 5;
            statusLabel.layer.masksToBounds = YES;
            statusLabel.textAlignment  = NSTextAlignmentCenter;
            statusLabel.font = FontPingFangSC(9);
            [self addSubview:statusLabel];
        }
    }
}
-(void)setTitleDictionary:(NSDictionary *)titleDictionary{
    UIView *lastView = nil;
    
    for (UIView *tempView in self.subviews) {
       
        CGFloat width = 0;
        
        if([tempView isKindOfClass:[UILabel class]]){
           
            UILabel  *titleLabel = (UILabel *)tempView;
            width = [[titleDictionary valueForKey:titleLabel.text] floatValue];
            [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
                if (lastView) {
                make.left.mas_equalTo(lastView.mas_right).offset(Number(3));
                }else{
                 make.left.mas_equalTo(0);
                }
                make.width.mas_equalTo(width);
                make.centerY.mas_equalTo(self.mas_centerY);
                make.height.mas_equalTo(self);
            }];
            
        }else{
            CGFloat width = Number(18);
            if ([tempView isKindOfClass:[UIButton class]]) {
                UIButton *tempBt = (UIButton *)tempView;
                width = [[titleDictionary valueForKey:tempBt.titleLabel.text] floatValue]+Number(20);
            }
            [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
                if (lastView) {
                    make.left.mas_equalTo(lastView.mas_right).offset(Number(3));
                }else{
                    make.left.mas_equalTo(0);
                }
                make.centerY.mas_equalTo(self.mas_centerY);
                make.width.mas_equalTo(width);
                make.height.mas_equalTo(Number(15));
            }];
        }
        lastView  =tempView;
        
    }
}
+(CGFloat)getWithTitleDictionary:(NSDictionary *)titleDic{
    
    CGFloat width = 10+10*titleDic.count;
    
    for (NSString *value in titleDic.allValues) {
        
        width  =[value floatValue]+width;
        
    }
    return  width;
}


@end
