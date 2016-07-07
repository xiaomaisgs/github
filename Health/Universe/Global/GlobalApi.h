//
//  GlobalApi.h
//  Health
//
//  Created by 张涛 on 16/6/2.
//  Copyright © 2016年 张涛. All rights reserved.
//

#ifndef GlobalApi_h
#define GlobalApi_h

#define PRODUNCTIN             0

#if PRODUNCTIN

#define DOMAIN_RES_ARRESS           @"http://222.73.11.237:18080"
//#define DOMAIN_ADDRESS              @"http://open.api.yaolan.com/api"
#define DOMAIN_ADDRESS              @"http://222.73.11.237:18080"

#else

#define DOMAIN_RES_ARRESS           @"http://192.168.9.12:8089"
#define DOMAIN_ADDRESS              @"http://192.168.9.12:8080"

#endif

//CMD
#define CMD_CHCODE                  10001
#define CMD_REGISTER                10002
#define CMD_LOGIN                   10003
#define CMD_FINDPASSWORD            10004
#define CMD_CHANGEPASSWORD          10005



#define CMD_PATIENTINFO             50006


//URL
#define URL_TEST                    @"app/153/index"
#define URL_REGISTER                @"yiliao_app/register"
#define URL_USER                    @"yiliao_app/user"


#endif /* GlobalApi_h */
