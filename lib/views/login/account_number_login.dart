import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:life_app/components/guide_page_comp.dart";
import "package:life_app/components/login.dart";
import "package:life_app/widgets/will_pop_scope_route.dart";
import "package:life_app/routes.dart";

class AccountNumberLogin extends StatefulWidget {
  const AccountNumberLogin({super.key});

  @override
  State<AccountNumberLogin> createState() => _AccountNumberLoginState();
}

class _AccountNumberLoginState extends State<AccountNumberLogin> {
  // 用户名
  final TextEditingController _unameController = TextEditingController();

  // 密码
  final TextEditingController _pwd = TextEditingController();

  void onSubmit() {
    print(_unameController.text);
    print(_pwd.text);

    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRouter.homeScreen, (route) => false);
  }

  void onChangeTap() {
    print('免密登录');
    Navigator.pushNamed(context, AppRouter.phoneLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: WillPopScopeRoute(
            child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Stack(
                  alignment: Alignment.topLeft,
                  fit: StackFit.expand,
                  children: [
                    const LeftTopBackground(),
                    const RightBottomBackground(),
                    Column(
                      children: [
                        GuideTopNavigator(
                            textContent: '免密登录',
                            onPressed: onChangeTap,
                            top: 50),
                        Padding(
                            padding: EdgeInsets.only(left: 33, top: 100.h),
                            child: Row(
                              children: [
                                Text(
                                  '欢迎登录',
                                  style: TextStyle(
                                      fontSize: 33.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 70.h, left: 33, right: 33),
                            child: Column(
                              children: [
                                TextField(
                                    controller: _unameController,
                                    cursorColor: const Color(0xFFFF5678),
                                    decoration: InputDecoration(
                                        hintText: '输入手机号/用户名',
                                        hintStyle: TextStyle(
                                            color: const Color.fromRGBO(
                                                27, 27, 33, 0.3),
                                            fontSize: 14.sp),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 0,
                                              color: Color.fromRGBO(
                                                  27, 27, 33, 0.3)),
                                        ),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color:
                                                        Color(0xFFFF5678))))),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 40.h, bottom: 44.h),
                                    child: TextField(
                                      controller: _pwd,
                                      cursorColor: const Color(0xFFFF5678),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: '输入密码',
                                          hintStyle: TextStyle(
                                              color: const Color.fromRGBO(
                                                  27, 27, 33, 0.3),
                                              fontSize: 14.sp),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 0,
                                                      color: Color.fromRGBO(
                                                          27, 27, 27, 0.3))),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 0,
                                                      color:
                                                          Color(0xFFFF5678)))),
                                    )),
                                Opacity(
                                    opacity: 1,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    255, 86, 120, 1),
                                            fixedSize: Size(331.w, 52.h)),
                                        onPressed: onSubmit,
                                        child: const Text('登录'))),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 100.h, bottom: 14.h),
                                    child: Text(
                                      'or',
                                      style: TextStyle(
                                          color: const Color.fromRGBO(
                                              27, 27, 33, 0.25),
                                          fontSize: 16.sp),
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('其他登录方式',
                                        style: TextStyle(
                                            color: const Color(0xFF5c5b5b),
                                            fontSize: 12.sp)),
                                    const Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, top: 3),
                                        child: Image(
                                            image: AssetImage(
                                                'lib/assets/images/right_arrow.png'),
                                            width: 6,
                                            height: 6))
                                  ],
                                )
                              ],
                            ))
                      ],
                    )
                  ],
                ))));
  }
}
