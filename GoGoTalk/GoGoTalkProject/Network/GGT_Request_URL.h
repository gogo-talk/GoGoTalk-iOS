//
//  GGT_Request_URL.h
//  GoGoTalk
//
//  Created by 辰 on 2017/5/10.
//  Copyright © 2017年 Chn. All rights reserved.
//

#ifndef GGT_Request_URL_h
#define GGT_Request_URL_h


static NSString * const BASE_REQUEST_URL = @"http://learnapi.gogo-talk.com:9332";

/*登录注册*/
//注册
static NSString * const URL_Resigt = @"/api/APP/AppRegist";
//登录
static NSString * const URL_Login = @"/api/APP/AppLogin";
//app 发送短信验证码
static NSString * const URL_GetChangePasswordSMS = @"/api/APP/AppSendChangePwdSMS";
//修改密码（根据手机号修改密码）
static NSString * const URL_ChangePwdByCode = @"/api/APP/AppChangePwdByCode";
//检测token是否过期
static NSString * const URL_GetTokenInvalid = @"/api/APP/GetTokenInvalid";


/*首页*/
//轮播图列表
static NSString * const URL_GetBrannerList = @"/api/APP/BrannerList";
//获取睡前故事列表
static NSString * const URL_GetBedTimeSotryList = @"/api/APP/GetBedTimeSotryList";









/*约课*/
//老师的排课信息
static NSString * const URL_GetPageTeacherLesson = @"/api/APP/GetPageTeacherLessonApp";
//获取学生关注的教师信息
static NSString * const URL_GetTeacherFollow = @"/api/APP/GetTeacherFollowApp";
//学员关注、取消关注 教师
static NSString * const URL_GetAttention = @"/api/APP/Attention";




/*我的*/
//修改密码（根据旧密码修改新密码）
static NSString * const URL_ChangePwdByOldPwd = @"/api/APP/AppChangePwdByOldPwd";
//获取学生信息列表
static NSString * const URL_GetStudentInfo = @"/api/APP/AppGetStudentInfo";
//修改学生信息列表
static NSString * const URL_UpdateStudentInfo = @"/api/APP/AppUpdateStudentInfo";
//获取课程统计信息
static NSString * const URL_GetLessonStatistics = @"/api/APP/GetLessonStatistics";
//获取我的课时
static NSString * const URL_GetMyClassHour = @"/api/APP/GetMyClassHour";
//意见反馈
static NSString * const URL_OpinionFeedback = @"/api/APP/OpinionFeedback";
//测评报告
static NSString * const URL_GetReportsList = @"/api/APP/AppGetReportsList";
//关于我们
static NSString * const URL_GetAboutUs = @"/ipad/abouts/wlh_about.html";




// 日历Calendar
static NSString * const URL_LessonList = @"api/APP/AppStuLessonList";

// 日历下面数据Course
static NSString * const URL_GetMyLesson = @"api/APP/AppGetMyLesson";

// 学生对教师的评价
static NSString * const URL_AppStudentEvaluateTeacher = @"api/APP/AppStudentEvaluateTeacher";

// 取消约课
static NSString * const URL_DelLesson = @"api/APP/DelLesson";

// 预约试听课
static NSString * const URL_AddDemoMsg = @"api/APP/AddDemoMsg";

// 获取课程详情
static NSString * const URL_GetLessonByLessonId = @"api/APP/GetLessonByLessonId";

// 获取最近上课信息
static NSString * const URL_AppStuLatelyLesson = @"api/APP/AppStuLatelyLesson";

















#endif /* GGT_Request_URL_h */
