import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/auth_code_textfield.dart';
import 'dart:developer' as developer;

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  String _inputText = '';
  TextEditingController controller = TextEditingController();

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
          mode: AuthCodeMode.singleItem,
          controller: controller,
          itemWidth: 50,
          itemHeight: 50,
          itemSpacing: 35 * scaleWidth,
          itemBackgroundColor: const Color.fromRGBO(120, 114, 127, 1),
          textColor: Colors.white,
          cursorColor: const Color.fromRGBO(94, 178, 138, 1),
          onChanged: (s) {
            setState(() {
              _inputText = s;
            });
            if (s.length == 4) {
              controller.text = '';
            }
          },
        ),
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
