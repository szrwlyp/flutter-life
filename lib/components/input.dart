import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpInput extends StatelessWidget {
  const OtpInput(
      {super.key,
      required this.controller,
      this.autoFocus = false,
      this.width = 40,
      this.height = 40,
      this.font_size = 20,
      this.margin,
      this.onFocusChange});

  final TextEditingController controller;

  // 是否获取焦点
  final bool autoFocus;

  // 宽度
  final double width;

  // 高度
  final double height;

  // 字体大小
  final int font_size;

  final margin;

  final onFocusChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffff5678),
        borderRadius: BorderRadius.circular(12),
      ),
      // child: const Text('aaa'),
      child: TextField(
        maxLength: 1,
        autofocus: autoFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Colors.white,

        // cursorHeight: width - font_size,
        // cursorHeight: 20,
        cursorWidth: 2,
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, //只允许输入数字
        ],
        style: TextStyle(
            // textBaseline: TextBaseline.alphabetic,
            color: Colors.white,
            fontSize: ScreenUtil().setSp(font_size),
            fontWeight: FontWeight.w700),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),

          counterText: '',
          // fillColor: Color(0xffff5678),
          // filled: true, //如果为true，则输入使用fillColor指定的颜色填充输入框
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            onFocusChange();
          }
        },
      ),
    );
  }
}

// class _OtpInputState extends State<OtpInput> {
//   FocusNode focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     // 监听焦点变化
//     focusNode.addListener(() {
//       print('焦点变化');
//       print(focusNode.hasFocus);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       width: widget.width,
//       margin: widget.margin,
//       decoration: BoxDecoration(
//         color: const Color(0xffff5678),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       // child: const Text('aaa'),
//       child: TextField(
//         maxLength: 1,
//         autofocus: widget.autoFocus,
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         textAlignVertical: TextAlignVertical.center,
//         cursorColor: Colors.white,
//         cursorHeight: widget.width - widget.font_size,
//         controller: widget.controller,
//         focusNode: focusNode,
//         inputFormatters: [
//           FilteringTextInputFormatter.digitsOnly, //只允许输入数字
//         ],
//         style: TextStyle(
//             textBaseline: TextBaseline.alphabetic,
//             color: Colors.white,
//             fontSize: ScreenUtil().setSp(widget.font_size),
//             fontWeight: FontWeight.w700),
//         decoration: const InputDecoration(
//           contentPadding: EdgeInsets.all(0),
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//           ),

//           counterText: '',
//           // fillColor: Color(0xffff5678),
//           // filled: true, //如果为true，则输入使用fillColor指定的颜色填充输入框
//         ),
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//         },
//       ),
//     );
//   }
// }
// class OtpInput extends StatefulWidget {
//   const OtpInput(
//       {super.key,
//       required this.controller,
//       this.autoFocus = false,
//       this.width = 40,
//       this.height = 40,
//       this.font_size = 20,
//       this.margin,
//       this.onFocusChange});

//   final TextEditingController controller;

//   // 是否获取焦点
//   final bool autoFocus;

//   // 宽度
//   final double width;

//   // 高度
//   final double height;

//   // 字体大小
//   final int font_size;

//   final margin;

//   final onFocusChange;

//   @override
//   State<OtpInput> createState() => _OtpInputState();
// }

// class _OtpInputState extends State<OtpInput> {
//   FocusNode focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     // 监听焦点变化
//     focusNode.addListener(() {
//       print('焦点变化');
//       print(focusNode.hasFocus);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       width: widget.width,
//       margin: widget.margin,
//       decoration: BoxDecoration(
//         color: const Color(0xffff5678),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       // child: const Text('aaa'),
//       child: TextField(
//         maxLength: 1,
//         autofocus: widget.autoFocus,
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         textAlignVertical: TextAlignVertical.center,
//         cursorColor: Colors.white,
//         cursorHeight: widget.width - widget.font_size,
//         controller: widget.controller,
//         focusNode: focusNode,
//         inputFormatters: [
//           FilteringTextInputFormatter.digitsOnly, //只允许输入数字
//         ],
//         style: TextStyle(
//             textBaseline: TextBaseline.alphabetic,
//             color: Colors.white,
//             fontSize: ScreenUtil().setSp(widget.font_size),
//             fontWeight: FontWeight.w700),
//         decoration: const InputDecoration(
//           contentPadding: EdgeInsets.all(0),
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//           ),

//           counterText: '',
//           // fillColor: Color(0xffff5678),
//           // filled: true, //如果为true，则输入使用fillColor指定的颜色填充输入框
//         ),
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//         },
//       ),
//     );
//   }
// }
