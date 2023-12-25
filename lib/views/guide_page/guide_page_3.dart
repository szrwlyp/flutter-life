import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../components/guide_page_comp.dart';

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
      child: Stack(
        alignment: Alignment.topLeft, //指定未定位或部分定位widget的对齐方式
        fit: StackFit.expand,
        children: [
          Positioned(
              top: ScreenUtil().setHeight(130),
              left: ScreenUtil().setWidth(-640),
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
                      image: const AssetImage(
                          'lib/assets/images/guide_page_3.png'))),
              Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(left: 32),
                  child: Image(
                      width: ScreenUtil().setWidth(56),
                      height: ScreenUtil().setHeight(50),
                      alignment: Alignment.topLeft,
                      image: const AssetImage(
                          'lib/assets/images/right_yinhao.png'))),
              Text(
                '享受生活',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    fontWeight: FontWeight.w700),
              ),
              Container(
                  width: ScreenUtil().setWidth(295),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(39)),
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
      ),
    ));
  }

  skipPage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/account_number_login', (route) => false);
  }

  onNextTap() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/account_number_login', (route) => false);
  }
}
