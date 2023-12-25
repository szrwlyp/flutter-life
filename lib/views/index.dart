import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  void openMinxi() {}

  @override
  Widget build(BuildContext context) {
    const channel = MethodChannel('UniMP_mini_apps');
    print(channel);

    Future callNativeMethod(String appID) async {
      try {
        // 通过通道，调用原生代码代码的方法
        final future = await channel.invokeMethod("open", {"AppID": appID});
        // 打印执行的结果
        print(future.toString());
      } on PlatformException catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () async {
          await callNativeMethod("__UNI__359FE36");
        },
        child: const Text('打开uni小程序'),
      ),
    ));
  }
}
