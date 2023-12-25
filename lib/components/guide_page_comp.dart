import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 引导页底部“下一页箭头”组件
class GuidePageNext extends StatelessWidget {
  const GuidePageNext({super.key, this.onPressed, this.currentIndicate});

  final GestureTapCallback? onPressed;

  final currentIndicate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(96),
          left: 32,
          right: 32,
          bottom: ScreenUtil().setHeight(36)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: 48,
            height: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                indicate_1(),
                indicate_2(),
                indicate_3(),
              ],
            )),
        GestureDetector(
            onTap: onPressed,
            child: Image(
                image: const AssetImage('lib/assets/images/2x/next@2x.png'),
                width: ScreenUtil().setWidth(50),
                height: ScreenUtil().setHeight(50)))
      ]),
    );
  }

  @override
  Widget indicate_1() {
    return currentIndicate == 1
        ? Container(
            width: ScreenUtil().setWidth(24),
            height: ScreenUtil().setHeight(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              color: const Color(0xFFff5678),
            ),
          )
        : Opacity(
            opacity: 0.5,
            child: Container(
              width: ScreenUtil().setWidth(6),
              height: ScreenUtil().setHeight(6),
              decoration: BoxDecoration(
                  color: const Color(0xFFFF5678),
                  borderRadius: BorderRadius.circular(75)),
            ));
  }

  @override
  Widget indicate_2() {
    return currentIndicate == 2
        ? Container(
            width: ScreenUtil().setWidth(24),
            height: ScreenUtil().setHeight(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              color: const Color(0xFFff5678),
            ),
          )
        : Opacity(
            opacity: 0.5,
            child: Container(
              width: ScreenUtil().setWidth(6),
              height: ScreenUtil().setHeight(6),
              decoration: BoxDecoration(
                  color: const Color(0xFFFF5678),
                  borderRadius: BorderRadius.circular(75)),
            ));
  }

  @override
  Widget indicate_3() {
    return currentIndicate == 3
        ? Container(
            width: ScreenUtil().setWidth(24),
            height: ScreenUtil().setHeight(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              color: const Color(0xFFff5678),
            ),
          )
        : Opacity(
            opacity: 0.5,
            child: Container(
              width: ScreenUtil().setWidth(6),
              height: ScreenUtil().setHeight(6),
              decoration: BoxDecoration(
                  color: const Color(0xFFFF5678),
                  borderRadius: BorderRadius.circular(75)),
            ));
  }
}

// 引导页顶部“返回”，“跳转”组件
class GuideTopNavigator extends StatefulWidget {
  const GuideTopNavigator({super.key, this.onPressed, this.textContent});

  final GestureTapCallback? onPressed;

  final String? textContent;

  @override
  State<GuideTopNavigator> createState() => _GuideTopNavigatorState();
}

class _GuideTopNavigatorState extends State<GuideTopNavigator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(40), left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: pageBack,
                child: Image(
                    width: ScreenUtil().setHeight(32),
                    height: ScreenUtil().setHeight(32),
                    image:
                        const AssetImage('lib/assets/images/3x/back@3x.png'))),
            GestureDetector(
                onTap: widget.onPressed,
                child: Text(
                  widget.textContent ?? '跳过',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ))
          ],
        ));
  }

  pageBack() {
    Navigator.of(context).pop();
  }
}
