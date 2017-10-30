//
//  NSObject+Property.m
//  PodsDemo
//
//  Created by 吴定如 on 2017/10/30.
//  Copyright © 2017年 Dist. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

@implementation NSObject (Property)

- (NSArray<NSString *> *)dist_propertyStringValues {
    
    unsigned int count;
    objc_property_t *cProperties = class_copyPropertyList(self.class, &count);
    
    NSMutableArray *values = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++) {
        objc_property_t cProperty = cProperties[i];
        
        const char *cName = property_getName(cProperty);
        
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [values addObject:[NSString stringWithFormat:@"%@",[self valueForKey:name]]];
    }
    free(cProperties);
    
    return values.copy;
}

@end
