import 'package:flutter/material.dart'; // material风格
import 'package:flutter/cupertino.dart'; // ios风格
import 'package:life_app/views/home/index.dart';
import 'package:life_app/views/message/index.dart';
import 'package:life_app/views/me/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';
import "package:life_app/widgets/will_pop_scope_route.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // PageView 控制
  final PageController _pageViewController = PageController();
  // 当前页下标
  int _selectedIndex = 0;

  // 页面
  final List<Widget> _pages = [
    const HomePage(),
    const MessagePage(),
    const MessagePage(),
    const MePage()
  ];

  final List<BottomNavigationBarItem> _itemArr = [
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), label: '消息'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), label: '购物车'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: '会员中心')
  ];
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    print(index);

    _pageViewController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScopeRoute(
        child: Scaffold(
      // IndexedStack 缓存页面
      // body: IndexedStack(index: _selectedIndex, children: [..._pages]),
      body: PageView(
        controller: _pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      // 自定义底部导航栏
      bottomNavigationBar: CustomBottomNavigationBar(
          onTap: _onItemTapped, currentIndex: _selectedIndex, pages: _pages),
      // 框架自带底部导航栏
      // bottomNavigationBar: BottomNavigationBar(
      //   // 当提供超过 3 个 BottomNavigationBar 项目时，如果未指定类型，则根据https://docs.flutter.io/flutter/material/BottomNavigationBar/BottomNavigationBar.html更改为 BottomNavigationBarType.shifting
      //   type: BottomNavigationBarType.fixed,
      //   items: _itemArr,
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   // enableFeedback: false,
      //   selectedFontSize: 13,
      //   unselectedFontSize: 13,
      //   selectedItemColor: const Color(0xffff5678),
      // ),
    ));
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key,
      required this.onTap,
      this.currentIndex = 0,
      this.pages = const []});

  final Function(int) onTap;

  final int currentIndex;

  final List<Widget> pages;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBar();
}

class _CustomBottomNavigationBar extends State<CustomBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: widget.currentIndex,
        length: widget.pages.length,
        vsync: this);
  }

  @override
  void dispose() {
    // Tab控制
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12, // 阴影颜色
              offset: Offset(0.0, 10), // 阴影偏移量（沿x轴和y轴）
              blurRadius: 2, // 模糊半径，决定阴影的扩散范围
              spreadRadius: 10, // 扩展半径，正值会使阴影扩大，负值则会收缩
            ),
          ],
          // border:
          //     Border(top: BorderSide(color: Color(0xffdcdcdc), width: 1))
        ),
        child: TabBar(
          controller: _tabController,
          indicator: const BoxDecoration(),
          labelColor: const Color(0xffff5678),
          enableFeedback: true,
          onTap: widget.onTap,
          tabs: const [
            Tab(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.home),
                  // Icon(Remix.home_line),
                  // Text(
                  //   '首页',
                  //   style: TextStyle(fontSize: 14, height: 1.1),
                  // )
                ],
              ),
            ),
            Tab(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.bubble_left),
                  // Text(
                  //   '消息',
                  //   style: TextStyle(fontSize: 14, height: 1),
                  // )
                ],
              ),
            ),
            // SizedBox(width: 40),
            Tab(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Remix.vidicon_line),
                  // Text(
                  //   '视频',
                  //   style: TextStyle(fontSize: 14, height: 1),
                  // )
                ],
              ),
            ),
            Tab(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Remix.user_3_line),
                  // Text('我的', style: TextStyle(fontSize: 14, height: 1))
                ],
              ),
            )
          ],
        ));
  }
}
