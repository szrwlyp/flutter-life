import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'appliation.dart';

void main() {
  runApp(const Application());

  // SafeArea 用于填充类似于刘海屏、异形屏之类的屏幕的边距,

  // 修改状态栏为白色背景黑色字体
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
  ));
}
