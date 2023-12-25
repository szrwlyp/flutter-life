import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../components/guide_page_comp.dart';

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
        child: ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.topLeft, //指定未定位或部分定位widget的对齐方式
        fit: StackFit.expand,
        children: [
          Positioned(
              top: ScreenUtil().setHeight(130),
              left: ScreenUtil().setWidth(-50),
              child: Image(
                  width: ScreenUtil().setWidth(1159),
                  height: ScreenUtil().setHeight(327),
                  fit: BoxFit.contain,
                  image: const AssetImage('lib/assets/images/bg_outline.png'))),
          Container(
            child: Column(children: [
              GuideTopNavigator(
                onPressed: skipPage,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(76), right: 21, left: 21),
                  child: Image(
                      width: ScreenUtil().setWidth(333),
                      height: ScreenUtil().setHeight(247),
                      fit: BoxFit.cover,
                      image: const AssetImage('lib/assets/images/doggie.png'))),
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 32),
                  child: Image(
                      width: ScreenUtil().setWidth(56),
                      height: ScreenUtil().setHeight(50),
                      alignment: Alignment.topLeft,
                      image: const AssetImage(
                          'lib/assets/images/left_yinhao.png'))),
              Text(
                '分享生活',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.w700),
              ),
              Container(
                  width: ScreenUtil().setWidth(295),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(39)),
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
      ),
    ));
  }

  skipPage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/account_number_login', (route) => false);
  }

  onNextTap() {
    Navigator.of(context).pushNamed('/guide_page_2');
  }
}
