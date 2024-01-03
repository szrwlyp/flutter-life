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
      padding: EdgeInsets.only(top: 96.h, left: 32, right: 32, bottom: 36.h),
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
                width: 50.w,
                height: 50.h))
      ]),
    );
  }

  @override
  Widget indicate_1() {
    return currentIndicate == 1
        ? Container(
            width: 24.w,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              color: const Color(0xFFff5678),
            ),
          )
        : Opacity(
            opacity: 0.5,
            child: Container(
              width: 6.w,
              height: 6.h,
              decoration: BoxDecoration(
                  color: const Color(0xFFFF5678),
                  borderRadius: BorderRadius.circular(75)),
            ));
  }

  @override
  Widget indicate_2() {
    return currentIndicate == 2
        ? Container(
            width: 24.w,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              color: const Color(0xFFff5678),
            ),
          )
        : Opacity(
            opacity: 0.5,
            child: Container(
              width: 6.w,
              height: 6.h,
              decoration: BoxDecoration(
                  color: const Color(0xFFFF5678),
                  borderRadius: BorderRadius.circular(75)),
            ));
  }

  @override
  Widget indicate_3() {
    return currentIndicate == 3
        ? Container(
            width: 24.w,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              color: const Color(0xFFff5678),
            ),
          )
        : Opacity(
            opacity: 0.5,
            child: Container(
              width: 6.w,
              height: 6.h,
              decoration: BoxDecoration(
                  color: const Color(0xFFFF5678),
                  borderRadius: BorderRadius.circular(75)),
            ));
  }
}

// 引导页顶部“返回”，“跳转”组件
class GuideTopNavigator extends StatefulWidget {
  const GuideTopNavigator(
      {super.key, this.onPressed, this.textContent, this.top = 16});

  final GestureTapCallback? onPressed;

  final String? textContent;

  final int top;

  @override
  State<GuideTopNavigator> createState() => _GuideTopNavigatorState();
}

class _GuideTopNavigatorState extends State<GuideTopNavigator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(widget.top), left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: pageBack,
                child: Image(
                    width: 32.w,
                    height: 32.h,
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
    // Navigator.of(context).canPop()返回一个bool值，表示当前页面是否可以退出，那么判断的依据是啥呢？追溯到源码去看
    // 尤其是这句话哦： [Route.isFirst], which returns true for routes for which [canPop]，意思说的很明显了，判断依据就是看当前路由是否处在栈中“最底部”的位置。根据之前的例子，如果我们在Screen1调用canPop肯定返回false，因为它处在“最底部”的位置，而在其它页面调用则返回true

    // Navigator.of(context).maybePop()是一种很友善的退出方式，如果能退出就退出，不退出拉到。其实这个方法可以理解为

    Navigator.of(context).maybePop();
  }
}

class GuideBackgroundImage extends StatelessWidget {
  const GuideBackgroundImage(
      {super.key, required this.bg_top, required this.bg_left});

  final bg_top;

  final bg_left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: bg_top,
        left: bg_left,
        child: Image(
            width: 1159.w,
            height: 327.h,
            fit: BoxFit.contain,
            image: const AssetImage('lib/assets/images/bg_outline.png')));
  }
}
