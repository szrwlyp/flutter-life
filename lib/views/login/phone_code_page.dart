import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import "../../components/guide_page_comp.dart";
import "../../components/input.dart";

class PhoneCode extends StatefulWidget {
  const PhoneCode({super.key});

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
    Navigator.pushReplacementNamed(context, '/account_number_login');
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
      Fluttertoast.showToast(
          msg: '登录成功',
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_LONG, //值针对 android 平台
          timeInSecForIosWeb: 2, //提示时间 针对ios 和 web
          backgroundColor: Colors.black, //背景颜色
          textColor: Colors.white, //文本颜色
          fontSize: 16.0 //文本字体大小
          );
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
                Positioned(
                    left: -170,
                    top: -170,
                    child: Image(
                      width: ScreenUtil().setWidth(484),
                      height: ScreenUtil().setHeight(479),
                      image: const AssetImage(
                          'lib/assets/images/login_dayuan_bg.png'),
                    )),
                Positioned(
                    bottom: -70,
                    right: -70,
                    child: Image(
                      width: ScreenUtil().setWidth(231),
                      height: ScreenUtil().setHeight(229),
                      image: const AssetImage(
                          'lib/assets/images/login_xiaoyuan_bg.png'),
                    )),
                Column(
                  children: [
                    GuideTopNavigator(
                      textContent: '密码登录',
                      onPressed: onChangeTap,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 33, top: ScreenUtil().setHeight(100)),
                        child: Row(
                          children: [
                            Text(
                              '输入验证码',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(33),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(70),
                            left: 33,
                            right: 33),
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(100),
                                    bottom: ScreenUtil().setHeight(24)),
                                child: Row(children: [
                                  Text(
                                    // "验证码已发送至${args["phoneNumber"]}",
                                    "验证码已发送至158****8888",
                                    style: TextStyle(
                                        color: const Color(0xff1b1b21),
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenUtil().setSp(16)),
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
                            // Opacity(
                            //     opacity: 1,
                            //     child: ElevatedButton(
                            //         style: ElevatedButton.styleFrom(
                            //             foregroundColor: Colors.white,
                            //             backgroundColor: const Color.fromRGBO(
                            //                 255, 86, 120, 1),
                            //             fixedSize: Size(
                            //                 ScreenUtil().setWidth(331),
                            //                 ScreenUtil().setHeight(52))),
                            //         onPressed: onSubmit,
                            //         child: const Text('获取验证码'))),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(190),
                                    bottom: ScreenUtil().setHeight(14)),
                                child: Text(
                                  'or',
                                  style: TextStyle(
                                      color: const Color.fromRGBO(
                                          27, 27, 33, 0.25),
                                      fontSize: ScreenUtil().setSp(16)),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('其他登录方式',
                                    style: TextStyle(
                                        color: const Color(0xFF5c5b5b),
                                        fontSize: ScreenUtil().setSp(12))),
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
