//
//  MYSessionManager.h
//  喜马拉雅FM
//
//  Created by 许 on 16/8/2.
//  Copyright © 2016年 许. All rights reserved.
//



typedef enum{
    RequestTypeGet,
    RequestTypePost

}RequestType;


@interface MYSessionManager : NSObject
- (void)setValue:(NSString *)value forHttpField:(NSString *)field;

- (void)request:(RequestType)requestType urlStr: (NSString *)urlStr parameter: (NSDictionary *)param resultBlock: (void(^)(id responseObject, NSError *error))resultBlock;

@end
