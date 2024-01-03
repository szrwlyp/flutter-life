import 'package:flutter/material.dart';

// 路由页
import "package:life_app/views/guide_page/guide_page_1.dart";
import "package:life_app/views/guide_page/guide_page_2.dart";
import "package:life_app/views/guide_page/guide_page_3.dart";
import "package:life_app/views/login/account_number_login.dart";
import "package:life_app/views/login/phone_login.dart";
import "package:life_app/views/login/phone_code_page.dart";
import "package:life_app/home_screen.dart";
import 'package:life_app/views/home/index.dart';
import "package:life_app/views/demo/index.dart";
import "package:life_app/views/404.dart";

class AppRouter {
  static const String guidePage1 = '/guide_page_1';
  static const String guidePage2 = '/guide_page_2';
  static const String guidePage3 = '/guide_page_3';
  static const String accountNumberLogin = '/account_number_login';
  static const String phoneLogin = '/phone_login';
  static const String phoneCode = '/phone_code';
  static const String homeScreen = '/homeScreen';
  static const String homePage = '/homePage';
  static const String demo = '/demo';
  static const String unknownRoute = '/404';

  static Map<String, WidgetBuilder> routes = {
    guidePage1: (context) => const GuidePage1(),
    guidePage2: (context, {argument}) => GuidePage2(arguments: argument),
    guidePage3: (context) => const GuidePage3(),
    accountNumberLogin: (context) => const AccountNumberLogin(),
    phoneLogin: (context) => const PhoneLogin(),
    phoneCode: (context, {argument}) => PhoneCode(arguments: argument),
    homeScreen: (context) => const HomeScreen(),
    homePage: (context) => const HomePage(),
    demo: (context) => const DemoIndex(),
    unknownRoute: (context) => const UnknownRoute(),
  };

  static Route? onGenerateRoute(RouteSettings settings) {
    final String? routeName = settings.name;
    final routePassArg = settings.arguments;
    final Function? pageContentBuilder = routes[routeName];
    print(routeName);

    print(routePassArg);

    if (pageContentBuilder != null) {
      if (routePassArg != null) {
        return MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, argument: routePassArg));
      } else {
        return MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
      }
    }

    return null;
  }

  static Route? onUnknownRoute(RouteSettings settings) {
    // final String? routeName = settings.name;
    // final Function? pageContentBuilder = routes[routeName];
    return MaterialPageRoute(builder: (context) => const UnknownRoute());
  }
}
