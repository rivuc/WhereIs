//
//  WISMarkModel.h
//  WhereIS
//
//  Created by Francisco Rivera Uc on 08/10/13.
//  Copyright (c) 2013 Francisco Rivera Uc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface WISMarkModel : NSObject

@property (assign, nonatomic) CLLocationCoordinate2D *Coordinate;
@property (copy, nonatomic) NSString *UserIdApp;
@property (copy, nonatomic) NSString *UserNameIphone;
@property (copy, nonatomic) NSString *Key;
@property (copy, nonatomic) NSString *Comment;
@property (copy, nonatomic) NSString *Expire;

// Constructores (métodos de clase)
+(id)MarkWithCoordinate:(CLLocationCoordinate2D *)aCoordinate
              userIdApp:(NSString *)aUserIdApp
         userNameIphone:(NSString *)aUserNameIphone
                    key:(NSString *)aKey
                comment:(NSString *)aComment
                 expire:(NSString *)aExpire;

+(id)MarkWithCoordinate:(CLLocationCoordinate2D *)aCoordinate
         userNameIphone:(NSString *)aUserNameIphone
                    key:(NSString *)aKey
                comment:(NSString *)aComment
                 expire:(NSString *)aExpire;

+(id)MarkWithCoordinate:(CLLocationCoordinate2D *)aCoordinate
                    key:(NSString *)aKey
                comment:(NSString *)aComment
                 expire:(NSString *)aExpire;


// Inicializador designado
-(id)initWithCoordinate:(CLLocationCoordinate2D *)aCoordinate
              userIdApp:(NSString *)aUserIdApp
         userNameIphone:(NSString *)aUserNameIphone
                    key:(NSString *)aKey
                comment:(NSString *)aComment
                 expire:(NSString *)aExpire;



@end
