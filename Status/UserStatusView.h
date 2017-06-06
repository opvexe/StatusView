//
//  VoteView.h
//  WithYou
//
//  Created by jieku on 2017/6/6.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserStatusView : UIView
/**
 
 */
@property(nonatomic,strong)NSDictionary *titleDictionary;

-(void)InitDataWithTitle:(NSArray *)titles;

+(CGFloat)getWithTitleDictionary:(NSDictionary *)titleDic;
@end
