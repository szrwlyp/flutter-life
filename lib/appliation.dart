import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:flutter_smart_dialog/flutter_smart_dialog.dart";
import "package:life_app/routes.dart";

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812), //填入设计稿中设备的屏幕尺寸,单位dp
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              canvasColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              // 去除TabBar底部线条
              tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),

              // primaryColor: Colors.white,
              // highlightColor: Colors.white,
              // splashColor: Colors.white
            ),
            title: '生活社区',
            initialRoute: AppRouter.guidePage1,
            onGenerateRoute: AppRouter.onGenerateRoute,
            // 未知路由代理（比如常见的 404 页面）
            onUnknownRoute: AppRouter.onUnknownRoute,
            routes: AppRouter.routes,
            // navigatorObservers: [FlutterSmartDialog.observer],
            builder: FlutterSmartDialog.init(),
            // Debug标志
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
