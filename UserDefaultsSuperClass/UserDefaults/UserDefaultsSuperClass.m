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

+(void)saveUserDefaultsObject:(id)obj withKey:(NSString *)key
{
    switch ([self getObjectTypeForObject:obj]) {
        case kStringClass:
        case kArrayClass:
        case kDictionaryClass:
        {
           [userDefaults setObject:obj forKey:key];
        }
            break;
        default:
            break;
    }
    [userDefaults synchronize];
}

+(id)getUserDefaultsObjectWithKey:(NSString *)key
{
    return [userDefaults objectForKey:key];
}

+(void)writeArrayWithCustomObjToUserDefaults:(NSString *)key withArray:(NSMutableArray *)array
{
    if ([self isArrayOK:array]) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:array];
        [userDefaults setObject:data forKey:key];
        [userDefaults synchronize];
    }
}

+(NSArray *)readArrayWithCustomObjFromUserDefaults:(NSString*)key
{
    NSData *data = [userDefaults objectForKey:key];
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [userDefaults synchronize];
    return array;
}

#pragma mark - helper
+(int)getObjectTypeForObject:(id)obj
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

+(BOOL)isArrayOK:(NSMutableArray *)array
{
    for (id obj in array) {
        if (![self objectConforms:obj]) {
            return NO;
        }
    }
    return YES;
}

+(BOOL)objectConforms:(id)obj
{
    BOOL conforms = YES;
    if (![[obj class] instancesRespondToSelector:@selector(encodeWithCoder:)]) {
        conforms = NO;
        NSString * message = [NSString stringWithFormat:@"object of class %@ in array should implement encodeWithCoder", [obj class]];
        NSAssert(conforms,message);
    } else if (![[obj class] instancesRespondToSelector:@selector(initWithCoder:)]){
        conforms = NO;
        
        NSString * message = [NSString stringWithFormat:@"object of class %@ in array should implement initWithCoder", [obj class]];
        NSAssert(conforms, message);
    }
    
    return conforms;
}
@end
