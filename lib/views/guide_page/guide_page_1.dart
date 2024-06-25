import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:life_app/components/guide_page_comp.dart';
import 'package:life_app/http/core/hi_net.dart';
import 'package:life_app/http/request/test_request.dart';
import "package:life_app/widgets/will_pop_scope_route.dart";
import "package:life_app/routes.dart";

class GuidePage1 extends StatefulWidget {
  const GuidePage1({super.key});

  @override
  State<GuidePage1> createState() => _GuidePage1State();
}

class _GuidePage1State extends State<GuidePage1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: WillPopScopeRoute(
            child: ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
          child: Stack(
        alignment: Alignment.topLeft, //指定未定位或部分定位widget的对齐方式
        fit: StackFit.expand,
        children: [
          GuideBackgroundImage(
            bg_left: -50.w,
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
                      image: const AssetImage('lib/assets/images/doggie.png'))),
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 32),
                  child: Image(
                      width: 56.w,
                      height: 50.h,
                      alignment: Alignment.topLeft,
                      image: const AssetImage(
                          'lib/assets/images/left_yinhao.png'))),
              Text(
                '分享生活',
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700),
              ),
              Container(
                  width: 295.w,
                  margin: EdgeInsets.only(top: 39.h),
                  child: const Text(
                    '分享生活中的乐趣，一个人的快乐，不如一群人的快乐，独乐乐不如众乐乐',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  )),
              GuidePageNext(
                currentIndicate: 1,
                onPressed: onNextTap,
              )
            ]),
          ),
        ],
      )),
    )));
  }

  skipPage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.accountNumberLogin, (route) => false);
  }

  onNextTap() async {
    // Navigator.of(context)
    //     .pushNamed(AppRouter.guidePage2, arguments: {'phoneNumber': 155});

    TestRequest request = TestRequest();
    request.add('add', 'ddd').add('bbb', 'cccc');
    var result = await HiNet.getInstance().fire(request);
    print(result);
  }
}
