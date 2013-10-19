//
//  WISMarkModel.m
//  WhereIS
//
//  Created by Francisco Rivera Uc on 08/10/13.
//  Copyright (c) 2013 Francisco Rivera Uc. All rights reserved.
//

#import "WISMarkModel.h"

@implementation WISMarkModel

#pragma mark - Métodos de clase
+(id)MarkWithCoordinate:(CLLocationCoordinate2D *)aCoordinate
              userIdApp:(NSString *)aUserIdApp
         userNameIphone:(NSString *)aUserNameIphone
                    key:(NSString *)aKey
                comment:(NSString *)aComment
                 expire:(NSString *)aExpire
{
    return [[self alloc]initWithCoordinate:aCoordinate
                                 userIdApp:aUserIdApp
                            userNameIphone:aUserNameIphone
                                       key:aKey
                                    comment:aComment
                                     expire:aExpire];
}

+(id)MarkWithCoordinate:(CLLocationCoordinate2D *)aCoordinate
         userNameIphone:(NSString *)aUserNameIphone
                    key:(NSString *)aKey
                comment:(NSString *)aComment
                 expire:(NSString *)aExpire
{
    return [[self alloc]initWithCoordinate:aCoordinate
                                 userIdApp:[self GetUserIdApp]
                            userNameIphone:aUserNameIphone
                                       key:aKey
                                   comment:aComment
                                    expire:aExpire];
}

+(id)MarkWithCoordinate:(CLLocationCoordinate2D *)aCoordinate
                    key:(NSString *)aKey
                comment:(NSString *)aComment
                 expire:(NSString *)aExpire
{
    return [[self alloc]initWithCoordinate:aCoordinate
                                 userIdApp:[self GetUserIdApp]
                            userNameIphone:[self GetUserNameIphone]
                                       key:aKey
                                   comment:aComment
                                    expire:aExpire];
}



#pragma mark - Init
-(id)initWithCoordinate:(CLLocationCoordinate2D *)aCoordinate
              userIdApp:(NSString *)aUserIdApp
         userNameIphone:(NSString *)aUserNameIphone
                    key:(NSString *)aKey
                comment:(NSString *)aComment
                 expire:(NSString *)aExpire
{
    if (self = [super init])
    {
        _Coordinate = aCoordinate;
        _UserIdApp = aUserIdApp;
        _UserNameIphone = aUserNameIphone;
        _Key = aKey;
        _Comment = aComment;
        _Expire = aExpire;
    }
    
    return  self;
}

#pragma mark - Gets data
+(NSString *)GetUserNameIphone
{
    return [[UIDevice currentDevice] name];
}

+(NSString *)GetUserIdApp
{
    // Comprobamos la existencia en el NSUserDefaults de una variable UUID
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *UUID = [prefs stringForKey:@"UUID"];
    if (!UUID) {
        UUID = [self CreateUUID:prefs];
    }
    return  UUID;
}

+(NSString *)CreateUUID:(NSUserDefaults *)prefs
{
    NSString *myUUID = [[NSUUID UUID] UUIDString];
    [prefs setObject:myUUID forKey:@"UUID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return myUUID;
}

@end
