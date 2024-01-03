import 'package:flutter/material.dart'; // material风格
import 'package:flutter/cupertino.dart'; // ios风格
import 'package:life_app/views/home/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List _widgetOptions = [HomePage()];

  static const List<BottomNavigationBarItem> _itemArr = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: '消息'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), label: '会员中心')
  ];
// BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '收藏'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack 缓存页面
      body: IndexedStack(
          index: _selectedIndex, children: const [..._widgetOptions]),
      bottomNavigationBar: const CustomBottomNavigationBar(),
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
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

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
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // return BottomAppBar(
    //     shape: const CircularNotchedRectangle(),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         IconButton(
    //           icon: const Icon(Icons.home),
    //           onPressed: () {},
    //         ),
    //         IconButton(
    //           icon: const Icon(Icons.business),
    //           onPressed: () {},
    //         ),
    //         const SizedBox(width: 40),
    //         IconButton(
    //           icon: const Icon(Icons.school),
    //           onPressed: () {},
    //         ),
    //       ],
    //     ));
    return Container(
        // height: 56,
        decoration: const BoxDecoration(
            border:
                Border(top: BorderSide(color: Color(0xffdcdcdc), width: 1))),
        child: TabBar(
          controller: _tabController,
          indicator: const BoxDecoration(),
          labelColor: const Color(0xffff5678),
          tabs: const [
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.home),
                  // Image(
                  //     width: 24,
                  //     height: 24,
                  //     image: AssetImage(
                  //         'lib/assets/images/2x/home_bar_icon@2x.png')),
                  Text(
                    '首页',
                    style: TextStyle(fontSize: 14, height: 1),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.search),
                  // Image(
                  //     width: 24,
                  //     height: 24,
                  //     image: AssetImage(
                  //         'lib/assets/images/2x/home_bar_icon@2x.png')),
                  Text(
                    '消息',
                    style: TextStyle(fontSize: 14, height: 1),
                  )
                ],
              ),
            ),
            // SizedBox(width: 40),
            Tab(text: '首页'),
            Tab(text: '首页')
          ],
        ));
    // return Material(
    //     color: Colors.white,
    //     shape: const BorderDirectional(
    //         top: BorderSide(color: Colors.red, width: 1)),
    //     child: TabBar(
    //       controller: _tabController,
    //       indicator: const BoxDecoration(),
    //       labelColor: const Color(0xffff5678),
    //       tabs: const [
    //         Tab(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Image(
    //                   image: AssetImage(
    //                       'lib/assets/images/2x/home_bar_icon@2x.png')),
    //               Text('首页')
    //             ],
    //           ),
    //         ),
    //         Tab(text: '首页'),
    //         // SizedBox(width: 40),
    //         Tab(text: '首页'),
    //         Tab(text: '首页')
    //       ],
    //     ));
  }
}
