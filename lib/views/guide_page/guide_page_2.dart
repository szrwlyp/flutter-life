import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:life_app/components/guide_page_comp.dart';
import "package:life_app/routes.dart";

class GuidePage2 extends StatefulWidget {
  const GuidePage2({super.key, this.arguments});

  final arguments;

  @override
  State<GuidePage2> createState() => _GuidePage2State();
}

class _GuidePage2State extends State<GuidePage2> {
  @override
  Widget build(BuildContext context) {
    // print(ModalRoute.of(context)!.settings);
    // print(widget.arguments);
    // final Map args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    // print(args);
    return Material(
        child: ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
          child: Stack(
        alignment: Alignment.topLeft, //指定未定位或部分定位widget的对齐方式
        fit: StackFit.expand,
        children: [
          GuideBackgroundImage(
            bg_left: -360.w,
            bg_top: 130.h,
          ),
          Container(
            child: Column(children: [
              GuideTopNavigator(
                onPressed: skipPage,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 60.h, right: 21, left: 21),
                  child: Image(
                      width: 333.w,
                      height: 247.h,
                      fit: BoxFit.cover,
                      image: const AssetImage(
                          'lib/assets/images/guide_page_2.png'))),
              Padding(
                  padding: EdgeInsets.only(top: 64.h),
                  child: Text(
                    '记录生活',
                    style:
                        TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700),
                  )),
              Container(
                  width: 295.w,
                  margin: EdgeInsets.only(top: 39.h),
                  child: const Text(
                    '记录生活中美好的点滴，留住美好的事物，保存美丽的生活过往',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  )),
              GuidePageNext(
                currentIndicate: 2,
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
    print('下一步');
    Navigator.of(context).pushNamed(AppRouter.guidePage3);
  }
}
