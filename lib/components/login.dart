import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftTopBackground extends StatelessWidget {
  const LeftTopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: -170,
        top: -170,
        child: Image(
          width: 484.w,
          height: 479.h,
          image: const AssetImage('lib/assets/images/login_dayuan_bg.png'),
        ));
  }
}

class RightBottomBackground extends StatelessWidget {
  const RightBottomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -70,
        right: -70,
        child: Image(
          width: 231.w,
          height: 229.h,
          image: const AssetImage('lib/assets/images/login_xiaoyuan_bg.png'),
        ));
  }
}
