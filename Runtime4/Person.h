//
//  Person.h
//  Runtime4
//
//  Created by zengqiang xing on 2018/6/5.
//  Copyright © 2018年 zengqiang xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *icon;

-(void)eat;
-(void)run;
-(void)study;
+(void)dancing;

@end
