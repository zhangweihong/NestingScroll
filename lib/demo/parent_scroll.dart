import 'package:flutter/material.dart';
import 'package:nestingscroll/demo/view_demo.dart';

class ParentScroll extends StatefulWidget {
  ParentScroll({Key key}) : super(key: key);

  @override
  _ParentScrollState createState() => _ParentScrollState();
}

class _ParentScrollState extends State<ParentScroll> {

  int _currentIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);

   void _pageChange(int index) {//这个可以自己组织 tab 或者 底部BottomNavigationBar 进行联动
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("nesting scroll demo")),
      body: PageView(
        controller:_pageController,
        onPageChanged: _pageChange,
        children: [
          ViewDemo(parentPageController:_pageController,pageName: "第一页",),
          ViewDemo(parentPageController:_pageController,pageName: "第二页",),
        ],
      ),
    );
  }
}