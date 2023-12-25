import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

// 路由页
import "views/guide_page/guide_page_1.dart";
import "views/guide_page/guide_page_2.dart";
import "views/guide_page/guide_page_3.dart";
import "views/login/account_number_login.dart";
import "views/login/phone_login.dart";
import "views/login/phone_code_page.dart";
import "views/index.dart";

void main() {
  runApp(const MyApp());

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  // 修改状态栏为白色
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.white));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            theme: ThemeData(
                primaryColor: Colors.white,
                highlightColor: Colors.white,
                splashColor: Colors.white),
            title: '生活社区',
            // home: const Text('aaass'),
            initialRoute: '/guide_page_1',
            home: child,
            routes: {
              '/guide_page_1': (context) => const GuidePage1(),
              '/guide_page_2': (context) => const GuidePage2(),
              '/guide_page_3': (context) => const GuidePage3(),
              '/account_number_login': (context) => const AccountNumberLogin(),
              '/phone_login': (context) => const PhoneLogin(),
              '/phone_code': (context) => const PhoneCode(),
              '/index': (context) => const Index()
            },
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
