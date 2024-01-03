import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:life_app/components/guide_page_comp.dart';
import "package:life_app/routes.dart";

class GuidePage3 extends StatefulWidget {
  const GuidePage3({super.key});

  @override
  State<GuidePage3> createState() => _GuidePage3State();
}

class _GuidePage3State extends State<GuidePage3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
          child: Stack(
        alignment: Alignment.topLeft, //指定未定位或部分定位widget的对齐方式
        fit: StackFit.expand,
        children: [
          GuideBackgroundImage(
            bg_left: -640.w,
            bg_top: 130.h,
          ),
          Container(
            child: Column(children: [
              GuideTopNavigator(
                onPressed: skipPage,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 76.h, right: 21, left: 21),
                  child: Image(
                      width: 333.w,
                      height: 247.h,
                      fit: BoxFit.cover,
                      image: const AssetImage(
                          'lib/assets/images/guide_page_3.png'))),
              Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(left: 32),
                  child: Image(
                      width: 56.w,
                      height: 50.h,
                      alignment: Alignment.topLeft,
                      image: const AssetImage(
                          'lib/assets/images/right_yinhao.png'))),
              Text(
                '享受生活',
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700),
              ),
              Container(
                  width: 295.w,
                  margin: EdgeInsets.only(top: 39.h),
                  child: const Text(
                    '寻找生活中的乐趣，丰富内心的生活，享受时间长河中的快乐',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  )),
              GuidePageNext(
                currentIndicate: 3,
                onPressed: onNextTap,
              )
            ]),
          ),
        ],
      )),
    ));
  }

  skipPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.accountNumberLogin, (route) => false);
  }

  onNextTap() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.accountNumberLogin, (route) => false);
  }
}
