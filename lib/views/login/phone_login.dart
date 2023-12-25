import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "../../components/guide_page_comp.dart";

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
    Navigator.of(context).pushNamed('/phone_code', arguments: args);
  }

  void onChangeTap() {
    print('免密登录');
    Navigator.pushReplacementNamed(context, '/account_number_login');
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
                              '一键登录',
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
                                    bottom: ScreenUtil().setHeight(32)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "+86",
                                      style: TextStyle(
                                          color: const Color(0xff1b1b21),
                                          fontWeight: FontWeight.w700,
                                          fontSize: ScreenUtil().setSp(22)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        phoneNumber,
                                        style: TextStyle(
                                            color: const Color(0xff1b1b21),
                                            fontWeight: FontWeight.w700,
                                            fontSize: ScreenUtil().setSp(22)),
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
                                        fixedSize: Size(
                                            ScreenUtil().setWidth(331),
                                            ScreenUtil().setHeight(52))),
                                    onPressed: onSubmit,
                                    child: const Text('获取验证码'))),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(100),
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
