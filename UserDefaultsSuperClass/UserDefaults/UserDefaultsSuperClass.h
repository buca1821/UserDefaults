//
//  UserDefaultsSuperClass.h
//  UserDefaultsSuperClass
//
//  Created by Luis Enrique López  Martínez on 20/05/14.
//  Copyright (c) 2014 Luis Enrique López  Martínez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDefaultsConstants.h"

@interface UserDefaultsSuperClass : NSObject

-(void)saveUserDefaultsObject:(id)obj withKey:(NSString *)key;
-(id)getUserDefaultsObjectWithKey:(NSString *)key;

@end
