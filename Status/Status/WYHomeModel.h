//
//  WYHomeModel.h
//  Status
//
//  Created by jieku on 2017/6/6.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SexType) {
    SexTypeMan = 1,
    SexTypeWoman = 2,
};

@interface WYHomeModel : NSObject

@property(nonatomic,copy)NSString *charmvalue;
@property(nonatomic,copy) NSString *wealthvalue;
@property(nonatomic,copy)NSString *is_vip;
@property(nonatomic,assign) SexType sex;
@property(nonatomic,assign)NSUInteger age;
@end
