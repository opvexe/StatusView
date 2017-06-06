//
//  EGTableViewCell.h
//  Status
//
//  Created by jieku on 2017/6/6.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYHomeModel.h"

@interface EGTableViewCell : UITableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview;

-(void)InitDataViewModel:(WYHomeModel*)model;
@end
