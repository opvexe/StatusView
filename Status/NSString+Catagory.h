//
//  NSString+Catagory.h
//  Status
//
//  Created by jieku on 2017/6/6.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Catagory)
BOOL is_null(id object);

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;
@end
