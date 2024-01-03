import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:life_app/components/guide_page_comp.dart";
import "package:life_app/components/login.dart";
import "package:life_app/routes.dart";

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  String phoneNumber = '15888888888';

  @override
  void initState() {
    super.initState();
    phoneNumber = phoneNumber.replaceRange(3, 7, '****');
  }

  void onSubmit() {
    Map<String, String> args = {'phoneNumber': phoneNumber};
    Navigator.of(context).pushNamed(AppRouter.phoneCode, arguments: args);
  }

  void onChangeTap() {
    print('免密登录');
    Navigator.pushReplacementNamed(context, AppRouter.accountNumberLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.topLeft,
              fit: StackFit.expand,
              children: [
                // Positioned(
                //     left: -170,
                //     top: -170,
                //     child: Image(
                //       width: 484.w,
                //       height: 479.h,
                //       image: const AssetImage(
                //           'lib/assets/images/login_dayuan_bg.png'),
                //     )),
                const LeftTopBackground(),
                const RightBottomBackground(),
                Column(
                  children: [
                    GuideTopNavigator(
                        textContent: '密码登录', onPressed: onChangeTap, top: 50),
                    Padding(
                        padding: EdgeInsets.only(left: 33, top: 100.h),
                        child: Row(
                          children: [
                            Text(
                              '一键登录',
                              style: TextStyle(
                                  fontSize: 33.sp, fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(top: 70.h, left: 33, right: 33),
                        child: Column(
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 100.h, bottom: 32.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "+86",
                                      style: TextStyle(
                                          color: const Color(0xff1b1b21),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 22.sp),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        phoneNumber,
                                        style: TextStyle(
                                            color: const Color(0xff1b1b21),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22.sp),
                                      ),
                                    )
                                  ],
                                )),
                            Opacity(
                                opacity: 1,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: const Color.fromRGBO(
                                            255, 86, 120, 1),
                                        fixedSize: Size(331.w, 52.h)),
                                    onPressed: onSubmit,
                                    child: const Text('获取验证码'))),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 100.h, bottom: 14.h),
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
                                    padding: EdgeInsets.only(left: 8, top: 3),
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
            )));
  }
}
