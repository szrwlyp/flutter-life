import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import "package:life_app/components/guide_page_comp.dart";
import "package:life_app/components/input.dart";
import "package:life_app/components/login.dart";
import "package:life_app/routes.dart";

class PhoneCode extends StatefulWidget {
  const PhoneCode({super.key, required arguments});

  @override
  State<PhoneCode> createState() => _PhoneCodeState();
}

class _PhoneCodeState extends State<PhoneCode> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  void onSubmit() {}

  void onChangeTap() {
    print('免密登录');
    Navigator.pushReplacementNamed(context, AppRouter.accountNumberLogin);
  }

  onFocusChange() {
    print(_fieldOne.text.isNotEmpty &&
        _fieldTwo.text.isNotEmpty &&
        _fieldThree.text.isNotEmpty &&
        _fieldFour.text.isNotEmpty);

    if (_fieldOne.text.isNotEmpty &&
        _fieldTwo.text.isNotEmpty &&
        _fieldThree.text.isNotEmpty &&
        _fieldFour.text.isNotEmpty) {
      Timer timer = Timer(const Duration(seconds: 2), () {
        print('延时');
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil('/index', (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
// ${args["phoneNumber"]}
    return Material(
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
                        textContent: '密码登录', onPressed: onChangeTap, top: 50),
                    Padding(
                        padding: EdgeInsets.only(left: 33, top: 100.h),
                        child: Row(
                          children: [
                            Text(
                              '输入验证码',
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
                                    EdgeInsets.only(top: 100.h, bottom: 24.h),
                                child: Row(children: [
                                  Text(
                                    // "验证码已发送至${args["phoneNumber"]}",
                                    "验证码已发送至158****8888",
                                    style: TextStyle(
                                        color: const Color(0xff1b1b21),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp),
                                  )
                                ])),
                            Row(children: [
                              OtpInput(
                                controller: _fieldOne,
                                autoFocus: true,
                                width: 52,
                                height: 52,
                                font_size: 28,
                                margin: const EdgeInsets.only(right: 29),
                                onFocusChange: onFocusChange,
                              ),
                              OtpInput(
                                controller: _fieldTwo,
                                width: 52,
                                height: 52,
                                font_size: 28,
                                margin: const EdgeInsets.only(right: 29),
                                onFocusChange: onFocusChange,
                              ),
                              OtpInput(
                                controller: _fieldThree,
                                width: 52,
                                height: 52,
                                font_size: 28,
                                margin: const EdgeInsets.only(right: 29),
                                onFocusChange: onFocusChange,
                              ),
                              OtpInput(
                                controller: _fieldFour,
                                width: 52,
                                height: 52,
                                font_size: 28,
                                onFocusChange: onFocusChange,
                              )
                            ]),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 190.h, bottom: 14.h),
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
