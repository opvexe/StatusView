//
//  EGTableViewCell.m
//  Status
//
//  Created by jieku on 2017/6/6.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "EGTableViewCell.h"
#import "UserStatusView.h"
#import <Masonry.h>
#import "NSString+Catagory.h"

#define FormatString(string, args...)       [NSString stringWithFormat:string, args]
#define FontPingFangSC(Size) [UIFont fontWithName:@"PingFangSC-Regular" size:Size*ScreenScale]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define WomanSexColor UIColorFromRGB(0xff72a4)
#define ManSexColor UIColorFromRGB(0x7fbeff)
#define ScreenScale                          (kScreenWidth / 375.0f)
#define Number(num)                      (num*ScreenScale)

@interface EGTableViewCell ()

@property(nonatomic,strong)UserStatusView *stautsView;
@property(nonatomic,strong)NSMutableArray *titles;
@property(nonatomic,strong)NSMutableDictionary *titlesDic;

@end
@implementation EGTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview
{
    
    static NSString *ID = @"WYHelloTableViewCell";
    
    EGTableViewCell *blackListCell = [tableview dequeueReusableCellWithIdentifier:ID];
    
    if (!blackListCell) {
        
        blackListCell = [[EGTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return blackListCell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle  =UITableViewCellSelectionStyleNone;
        [self setUI];
    }
    return self;
}

-(void)InitDataViewModel:(WYHomeModel*)model{
    [self.titles removeAllObjects];
    [self.titlesDic removeAllObjects];
    
    
    CGFloat sexWidth =[FormatString(@"|%@",model.age) sizeWithFont:FontPingFangSC(8) maxW:Number(80)].width;
    switch (model.sex) {
        case SexTypeMan:{
            [self.titles addObject:FormatString(@"男|%@",model.age)];
            
            [self.titlesDic setValue:@(sexWidth) forKey:FormatString(@"%@",model.age)];
            break;
        }
        case SexTypeWoman:{
            [self.titles addObject:FormatString(@"女|%@",model.age)];
            [self.titlesDic setValue:@(sexWidth) forKey:FormatString(@"%@",model.age)];
            break;
        }
        default:
            break;
    }
    
    if ([model.is_vip integerValue]){
        [self.titles addObject:@"is_Vip"];
        [self.titlesDic setValue:@(Number(14)) forKey:@"is_Vip"];
    }
    if ([[model charmvalue] integerValue]!=0 &&  !is_null(model.charmvalue)){
        
        NSString *title =FormatString(@"魅力 %@", [self count:[model.charmvalue integerValue]]);
        CGFloat width =[title sizeWithFont:FontPingFangSC(9) maxW:80].width+10;
        [self.titles addObject:title];
        [self.titlesDic setValue:@(width+10) forKey:title];
    }
    
    if ([[model wealthvalue] integerValue]!=0 &&  !is_null(model.wealthvalue) ) {
        NSString *title =FormatString(@"财富 %@", [self count:[model.wealthvalue integerValue]]);
        CGFloat width =[title sizeWithFont:FontPingFangSC(9) maxW:80].width+10;
        [self.titles addObject:title];
        [self.titlesDic setValue:@(width+10) forKey:title];
    }
    
    if (self.titles.count) {
        [_stautsView InitDataWithTitle:self.titles];
        _stautsView.titleDictionary = self.titlesDic;
        [_stautsView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo([UserStatusView getWithTitleDictionary:self.titlesDic]);
        }];
        _stautsView.hidden =NO;
    }else{
        _stautsView.hidden =YES;
    }

}

-(void)setUI{

    
}

-(NSString *)count:(NSUInteger) count{
    
    NSString *defaultTitle;
    if (count >= 10000) {
        defaultTitle = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
        // 用空串替换掉所有的.0
        defaultTitle = [defaultTitle stringByReplacingOccurrencesOfString:@".0" withString:@""];
    } else if (count >0) {
        defaultTitle = [NSString stringWithFormat:@"%zd", count];
    }
    return defaultTitle;
}


-(NSMutableArray *)titles{
    
    if (!_titles) {
        
        _titles  =[NSMutableArray arrayWithCapacity:0];
    }
    return _titles;
}
-(NSMutableDictionary *)titlesDic{
    
    if (!_titlesDic) {
        _titlesDic  =[NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _titlesDic;
    
}

@end
