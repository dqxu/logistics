
//  UIView+DQExtension.m

//
//  Created by MJ Lee on 14-5-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIView+DQExtension.h"

@implementation UIView (DQExtension)

- (void)setDQCornerRadis:(CGFloat)radius
{
    
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;

}


- (void)setDefaultDQCornerRadis
{
    
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    
}


- (CGFloat)ddWidth
{
    return self.frame.size.width;
}

- (CGFloat)ddHeight
{
    return self.frame.size.height;
}


- (CGFloat)ddX
{
    return self.frame.origin.x;
}

- (CGFloat)ddMaxX
{
    return CGRectGetMaxX(self.frame);
}


- (CGFloat)ddMaxY
{
    return CGRectGetMaxY(self.frame);
}
- (CGFloat)ddY
{
    return self.frame.origin.y;;
}


@end
