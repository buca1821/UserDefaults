//
//  UserDefaultsSuperClass.m
//  UserDefaultsSuperClass
//
//  Created by Luis Enrique López  Martínez on 20/05/14.
//  Copyright (c) 2014 Luis Enrique López  Martínez. All rights reserved.
//

#import "UserDefaultsSuperClass.h"

#define userDefaults [NSUserDefaults standardUserDefaults]

typedef enum {
    kStringClass,
    kArrayClass,
    kDictionaryClass,
    kNotRecognizedClass
} ClassTypes;


@implementation UserDefaultsSuperClass

-(void)saveUserDefaultsObject:(id)obj withKey:(NSString *)key
{
    [self getObjectTypeForObject:obj];
    [userDefaults setObject:obj forKey:key];
    [userDefaults synchronize];
}

-(id)getUserDefaultsObjectWithKey:(NSString *)key
{
    id obj;
    
    return obj;
}

#pragma mark - helper

-(int)getObjectTypeForObject:(id)obj
{
    if ([obj isKindOfClass:[NSString class]]) {
        return kStringClass;
    }
    
    if ([obj isKindOfClass:[NSArray class]]) {
        return kArrayClass;
    }
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return kDictionaryClass;
    }
    
    return kNotRecognizedClass;
}
@end
