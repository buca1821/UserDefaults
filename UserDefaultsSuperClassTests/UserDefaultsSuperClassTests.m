//
//  UserDefaultsSuperClassTests.m
//  UserDefaultsSuperClassTests
//
//  Created by Luis Enrique López  Martínez on 20/05/14.
//  Copyright (c) 2014 Luis Enrique López  Martínez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserDefaultsConstants.h"
#import "UserDefaultsSuperClass.h"

@interface UserDefaultsSuperClassTests : XCTestCase

@end

@implementation UserDefaultsSuperClassTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUserDefaults
{
    NSString * myObject = @"oneObject";
    [UserDefaultsSuperClass saveUserDefaultsObject:myObject withKey:OneKey];
    
    NSString *myObjectRecovered = [UserDefaultsSuperClass getUserDefaultsObjectWithKey:OneKey];
    XCTAssertTrue([myObject isEqualToString:myObjectRecovered], @"The objects should be equal!");
}

- (void)testSaveAnArray
{
    NSArray *array = @[@"1",@"2",@"3"];
    [UserDefaultsSuperClass saveUserDefaultsObject:array withKey:OneKey];
    
    NSArray *arrayNew = [UserDefaultsSuperClass getUserDefaultsObjectWithKey:OneKey];
    
    int i=0;
    for (NSString *obj in arrayNew) {
        XCTAssertTrue([obj isEqualToString:[array objectAtIndex:i]], @"strings shoud be equal!");
        i++;
    }
 
    
}

@end
