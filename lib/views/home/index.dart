import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:remixicon/remixicon.dart";
import "package:dotted_border/dotted_border.dart";
import "dart:ui";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// 首页主页面
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: const [SearchWidget(), ActiveBloggerWidget(), ListWidget()],
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
    return Padding(
        padding: EdgeInsets.only(top: 6.h, bottom: 26.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                          suffixIcon: Icon(Remix.search_line, size: 16.sp))))),
          Container(
            margin: EdgeInsets.only(left: 16.w),
            child: const Icon(Remix.camera_line),
          )
        ]));
  }
}

// 博主类
class ActiveBlogger {
  String name;
  String headSculpture;
  ActiveBlogger(this.name, this.headSculpture);
}

// 活跃博主Widget
class ActiveBloggerWidget extends StatefulWidget {
  const ActiveBloggerWidget({super.key});

  @override
  State createState() => _ActiveBloggerWidgetState();
}

class _ActiveBloggerWidgetState extends State<ActiveBloggerWidget> {
  final List<ActiveBlogger> _bloggerList = [
    ActiveBlogger('我', ''),
    ActiveBlogger(
        '王欣宇', 'https://img.js.design/assets/img/613b4ec1a8324d3ca4604887.jpg'),
    ActiveBlogger(
        '黄华', 'https://img.js.design/assets/img/613b2477a9696d5326f895d6.jpg'),
    ActiveBlogger(
        '谢武', 'https://img.js.design/assets/img/613b4eddf2bdc801dff4e6a2.jpg'),
    ActiveBlogger(
        '陈浩', 'https://img.js.design/assets/img/613b4f2ff2bdc87100f4e6a4.jpg'),
  ];

  List<Widget> _getBloggerListItem() {
    List<Widget> list = [];

    for (var element in _bloggerList) {
      list.add(Column(
        children: [
          SizedBox(
            width: 50.w,
            height: 50.h,
            child: DottedBorder(
                dashPattern: const [6, 6],
                borderType: BorderType.Circle,
                color: const Color(0xffff8282),
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
                            color: Color(0xffff8282)))),
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
    return Column(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _getBloggerListItem(),
            )),
      ],
    );
  }
}

// 列表Widget
class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class BoWenList {
  String img;
  String likeNum;
  String commentNum;
  String collectNum;
  bool isLike;
  bool isCollect;
  BoWenList(
      {required this.img,
      required this.likeNum,
      required this.commentNum,
      required this.collectNum,
      required this.isLike,
      required this.isCollect});
}

class _ListWidgetState extends State<ListWidget> {
  final List<BoWenList> bowenListData = [
    BoWenList(
        img: 'lib/assets/images/pexels-cottonbro-7858128.png',
        likeNum: '12k',
        commentNum: '12k',
        collectNum: '12k',
        isLike: true,
        isCollect: true),
    BoWenList(
        img: 'lib/assets/images/pexels-cottonbro-7858128.png',
        likeNum: '12k',
        commentNum: '12k',
        collectNum: '12k',
        isLike: false,
        isCollect: false),
    BoWenList(
        img: 'lib/assets/images/pexels-cottonbro-7858128.png',
        likeNum: '12k',
        commentNum: '12k',
        collectNum: '12k',
        isLike: false,
        isCollect: false),
    BoWenList(
        img: 'lib/assets/images/pexels-cottonbro-7858128.png',
        likeNum: '12k',
        commentNum: '12k',
        collectNum: '12k',
        isLike: false,
        isCollect: false),
    BoWenList(
        img: 'lib/assets/images/pexels-cottonbro-7858128.png',
        likeNum: '12k',
        commentNum: '12k',
        collectNum: '12k',
        isLike: false,
        isCollect: false),
    BoWenList(
        img: 'lib/assets/images/pexels-cottonbro-7858128.png',
        likeNum: '12k',
        commentNum: '12k',
        collectNum: '12k',
        isLike: false,
        isCollect: false),
    BoWenList(
        img: 'lib/assets/images/pexels-cottonbro-7858128.png',
        likeNum: '12k',
        commentNum: '12k',
        collectNum: '12k',
        isLike: false,
        isCollect: false),
    BoWenList(
        img: 'lib/assets/images/pexels-cottonbro-7858128.png',
        likeNum: '12k',
        commentNum: '12k',
        collectNum: '12k',
        isLike: false,
        isCollect: false),
    BoWenList(
        img: 'lib/assets/images/pexels-cottonbro-7858128.png',
        likeNum: '12k',
        commentNum: '12k',
        collectNum: '12k',
        isLike: false,
        isCollect: false)
  ];

  @override
  void onLikeOperation(e) {
    print(e);
  }

  List<Widget> _getList() {
    List<Widget> list = [];

    for (var item in bowenListData) {
      list.add(
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 327.w,
              height: 336,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image(
                          fit: BoxFit.cover, image: AssetImage(item.img))),
                  Positioned(
                      bottom: 0,
                      // left: 0,
                      child: ClipRRect(
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                width: 327.w,
                                height: 48.h,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.2)),
                                // color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Remix.heart_2_line,
                                                color: item.isLike
                                                    ? const Color(0xffff5678)
                                                    : Colors.white,
                                                size: 15.sp),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 3),
                                                child: Text(
                                                  item.likeNum,
                                                  style: TextStyle(
                                                      color: item.isLike
                                                          ? const Color(
                                                              0xffff5678)
                                                          : Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ))
                                          ],
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Remix.message_3_line,
                                            color: Colors.white, size: 15.sp),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: Text(
                                              item.commentNum,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400),
                                            ))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Remix.bookmark_2_line,
                                            color: item.isCollect
                                                ? const Color(0xffff5678)
                                                : Colors.white,
                                            size: 15.sp),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: Text(
                                              item.collectNum,
                                              style: TextStyle(
                                                  color: item.isCollect
                                                      ? const Color(0xffff5678)
                                                      : Colors.white,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ))))
                ],
              ),
            )),
      );

      list.add(const SizedBox(
        height: 16,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _getList()));
  }
}
