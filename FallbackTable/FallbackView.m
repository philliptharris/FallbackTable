//
//  FallbackView.m
//  FallbackTable
//
//  Created by Phillip Harris on 5/19/15.
//  Copyright (c) 2015 Phillip Harris. All rights reserved.
//

#import "FallbackView.h"

@implementation FallbackView

- (void)fitImageViewConstraintsToImage {
    self.imageViewHeightConstraint.constant = self.imageView.image.size.height;
    self.imageViewWidthConstraint.constant = self.imageView.image.size.width;
}

@end
