import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:remixicon/remixicon.dart";
import "package:dotted_border/dotted_border.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  var customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(75),
      borderSide: const BorderSide(style: BorderStyle.none));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          Padding(
              padding: EdgeInsets.only(top: 6.h, bottom: 26.h),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child: SizedBox(
                        height: 32.h,
                        child: TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20.w),
                                filled: true,
                                fillColor: const Color(0xfff5f5f5),
                                hintText: "周末午后的闲暇时光",
                                hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff666666)),
                                border: customBorder,
                                focusedBorder: customBorder,
                                enabledBorder: customBorder,
                                suffixIcon:
                                    Icon(Remix.search_line, size: 16.sp))))),
                Container(
                  margin: EdgeInsets.only(left: 16.w),
                  child: const Icon(Remix.camera_line),
                )
              ])),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '活跃博主',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff1b1b21),
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 11.h),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 50.w,
                            height: 50.h,
                            child: DottedBorder(
                                dashPattern: const [6, 6],
                                borderType: BorderType.Circle,
                                color: const Color(0xffff8282),
                                child: const Text('aaa')),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              '我',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xff1b1b21)),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          )
        ],
      )),
    );
  }
}
