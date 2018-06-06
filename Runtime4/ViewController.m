//
//  ViewController.m
//  Runtime4
//
//  Created by zengqiang xing on 2018/6/5.
//  Copyright © 2018年 zengqiang xing. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
@interface ViewController ()

@end
unsigned int count;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // [self getPropertyList];
    // [self getMethodList];
  //  [self getIvarsList];
   // [self getProtocolList];
//    [self getClassMethod];
    [self getInstanceMethod];
    
    
}
#pragma mark - 获取属性列表
-(void)getPropertyList
{
    objc_property_t *property_list=class_copyPropertyList([Person class], &count);
    for (unsigned int i=0; i<count;i++)
    {
        const char *propertyName=property_getName(property_list[i]);
        NSLog(@"property--->%@",[NSString stringWithUTF8String:propertyName]);
    }
}
#pragma mark - 获取方法列表
-(void)getMethodList
{
    Method *methodList=class_copyMethodList([UIView class], &count);
    
    for (unsigned int i=0; i<count;i++)
    {
        Method method=methodList[i];
        NSLog(@"method--->%@",NSStringFromSelector(method_getName(method)));
    }
}
#pragma mark - 获取成员变量列表
-(void)getIvarsList
{
    Ivar *ivarList=class_copyIvarList([Person class], &count);
    
    for (unsigned int i=0; i<count;i++)
    {
        Ivar ivar=ivarList[i];
        const char *ivarName=ivar_getName(ivar);
        NSLog(@"ivar--->%@",[NSString stringWithUTF8String:ivarName]);
    }
}
#pragma mark - 获取协议列表
-(void)getProtocolList
{
    __unsafe_unretained Protocol **protocolList=class_copyProtocolList([UIScrollView class], &count);
    
    for (unsigned int i=0; i<count;i++)
    {
        Protocol *myProtocal=protocolList[i];
        const char *protocolName=protocol_getName(myProtocal);
        NSLog(@"protocol--->%@",[NSString stringWithUTF8String:protocolName]);
    }
}

#pragma mark - 获取类方法
-(void)getClassMethod
{
   // Person * p= [Person new];
    Class xiaomingClass=object_getClass([Person class]);
    NSLog(@"%@",NSStringFromClass(xiaomingClass));
    SEL oriSEL=@selector(dancing);
    Method oriMethod=class_getClassMethod(xiaomingClass, oriSEL);
    NSLog(@"oriMethod--->%@",NSStringFromSelector(method_getName(oriMethod)));
}
#pragma mark - 获取实例方法
-(void)getInstanceMethod
{
    Person *p = [Person new ];
//    object_getClass([Person class]);
//    NSLog(@"%@",NSStringFromClass(object_getClass(object_getClass([Person class])   )));
    Class PersonClass= object_getClass(p);
    SEL oriSEL=@selector(run);
    Method instanceMethod=class_getInstanceMethod(PersonClass, oriSEL);
    NSLog(@"instanceMethod--->%@",NSStringFromSelector(method_getName(instanceMethod)));
}
@end
