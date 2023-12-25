import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../components/guide_page_comp.dart';

class GuidePage2 extends StatefulWidget {
  const GuidePage2({super.key});

  @override
  State<GuidePage2> createState() => _GuidePage2State();
}

class _GuidePage2State extends State<GuidePage2> {
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
              left: ScreenUtil().setWidth(-360),
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
                      top: ScreenUtil().setHeight(60), right: 21, left: 21),
                  child: Image(
                      width: ScreenUtil().setWidth(333),
                      height: ScreenUtil().setHeight(247),
                      fit: BoxFit.cover,
                      image: const AssetImage(
                          'lib/assets/images/guide_page_2.png'))),
              Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(64)),
                  child: Text(
                    '记录生活',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(32),
                        fontWeight: FontWeight.w700),
                  )),
              Container(
                  width: ScreenUtil().setWidth(295),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(39)),
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
      ),
    ));
  }

  skipPage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/account_number_login', (route) => false);
  }

  onNextTap() {
    print('下一步');
    Navigator.of(context).pushNamed('/guide_page_3');
  }
}
