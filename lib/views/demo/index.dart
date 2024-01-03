import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_app/components/auth_code_textfield.dart';
import 'dart:developer' as developer;

class DemoIndex extends StatefulWidget {
  const DemoIndex({super.key});

  @override
  State<DemoIndex> createState() => _IndexState();
}

class _IndexState extends State<DemoIndex> {
  String _inputText = '';
  TextEditingController controller = TextEditingController();

  int count = 0;

  @override
  Widget build(BuildContext context) {
    const channel = MethodChannel('UniMP_mini_apps');
    double scaleWidth = MediaQuery.of(context).size.width / 414;
    Future callNativeMethod(String appID) async {
      try {
        // 通过通道，调用原生代码代码的方法
        final future = await channel.invokeMethod("open", {"AppID": appID});
        // 打印执行的结果
        print(future.toString());
        developer.log('log', name: 'developer log print');
      } on PlatformException catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 30),
            child: ElevatedButton(
                onPressed: () async {
                  await callNativeMethod('__UNI__359FE36');
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                child: const Text('打开uni小程序'))),
        AuthCodeTextfield(
          length: AuthCodeLength.six,
          mode: AuthCodeMode.bottomLine,
          controller: controller,
          itemWidth: 50,
          itemHeight: 50,
          itemSpacing: 35 * scaleWidth,
          itemBackgroundColor: const Color(0xFFFF5678),
          itemBottomLineColor: const Color(0xFFFF5678),
          textColor: Colors.white,
          cursorColor: Colors.white,
          onChanged: (s) {
            setState(() {
              _inputText = s;
            });
            if (s.length == 4) {
              // controller.text = '';
              print('object');
            }
          },
        ),
        ShareDataWidget(
            data: count,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _TestWidget()),
                ElevatedButton(
                    onPressed: () => setState(() {
                          ++count;
                        }),
                    child: const Text('jiajia'))
              ],
            ))
      ],
    )
            // child: GestureDetector(
            //   onTap: () async {
            //     await callNativeMethod("__UNI__359FE36");
            //   },
            //   child: const Text('打开uni小程序'),
            // ),
            ));
  }
}

// 数据共享
class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  final int data;

  // 定义一个便捷方法，方便子树中的Widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    // return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    return context
        .getElementForInheritedWidgetOfExactType<ShareDataWidget>()!
        .widget as ShareDataWidget;
  }

  // 该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    print('object');
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!.data.toString());
    // return const Text('aaa');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('Dependencies change');
  }
}

// 一个通用的InheritedWidget，保存需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider(
      {super.key, required this.data, required Widget child})
      : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    return true;
  }
}
