import 'package:flutter/material.dart';
import "package:remixicon/remixicon.dart";
import "package:dotted_border/dotted_border.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        // padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: const [
          SearchWidget(),
          TopMessageWidget(),
          MessageListWidget()
        ],
      )),
    );
  }
}

// 顶部搜索Widget
class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(75),
      borderSide: const BorderSide(style: BorderStyle.none));

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(247, 249, 255, 1)),
        child: Padding(
            padding: EdgeInsets.only(
                top: 6.h, bottom: 26.h, left: 24.w, right: 24.w),
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
                              fillColor: Colors.white,
                              hintText: "搜索",
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
                child: const Icon(Remix.qr_scan_2_line),
              )
            ])));
  }
}

// 消息类
class ActiveBlogger {
  String name;
  String headSculpture;
  ActiveBlogger(this.name, this.headSculpture);
}

// 置顶消息Widget
class TopMessageWidget extends StatefulWidget {
  const TopMessageWidget({super.key});

  @override
  State createState() => _TopMessageWidgetState();
}

class _TopMessageWidgetState extends State<TopMessageWidget> {
  final List<ActiveBlogger> _bloggerList = [
    ActiveBlogger(
        '李文琦', 'https://img.js.design/assets/img/613b4ec1a8324d3ca4604887.jpg'),
    ActiveBlogger(
        '王欣宇', 'https://img.js.design/assets/img/613b4eddf2bdc801dff4e6a2.jpg'),
    ActiveBlogger(
        '黄华', 'https://img.js.design/assets/img/613b4f2ff2bdc87100f4e6a4.jpg'),
    ActiveBlogger(
        '罗文', 'https://img.js.design/assets/img/613b2477a9696d5326f895d6.jpg'),
    ActiveBlogger(
        '陈冰冰', 'https://img.js.design/assets/img/613b2439a9696d5326f89323.jpg'),
  ];

  List<Widget> _getBloggerListItem() {
    List<Widget> list = [];

    for (var element in _bloggerList) {
      list.add(Column(
        children: [
          SizedBox(
            width: 50.w,
            height: 50.h,
            child: Center(
                child: element.headSculpture.isNotEmpty
                    ? ClipOval(
                        child: SizedBox(
                            width: 42,
                            height: 42,
                            child: Image(
                              image: NetworkImage(element.headSculpture),
                              fit: BoxFit.cover,
                            )))
                    : const Icon(Remix.add_circle_line,
                        color: Color(0xffff8282))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              element.name,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xff1b1b21),
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(247, 249, 255, 1)),
        child: Padding(
            padding: EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '置顶聊天',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff1b1b21),
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 11.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _getBloggerListItem(),
                    )),
              ],
            )));
  }
}

class MessageListWidget extends StatefulWidget {
  const MessageListWidget({super.key});

  @override
  State createState() => _MessageListWidgetState();
}

class _MessageListWidgetState extends State<MessageListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: const ClipOval(
                          child: Image(
                              image: NetworkImage(
                                  'https://img.js.design/assets/img/613b4ec1a8324d3ca4604887.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '陈冰冰',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                            Text('12-11',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color:
                                        const Color.fromRGBO(27, 27, 33, 0.5)))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ]));
  }
}
