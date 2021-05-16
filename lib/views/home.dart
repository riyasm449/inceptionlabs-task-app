import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inceptionlabs_taskapp/utils/commons.dart';

import '../utils/bottomNavigationBar.dart';
import 'menu-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  List<Widget> pages = [
    MenuPage(),
    MenuPage(),
    MenuPage(),
    MenuPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: pages),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Menu'),
            textAlign: TextAlign.center,
            icon: Icon(
              Icons.home,
              color: Commons.bgColor,
            ),
            activeColor: Colors.grey,
          ),
          BottomNavyBarItem(
            title: Text('Order'),
            textAlign: TextAlign.center,
            icon: Icon(
              Icons.fastfood,
              color: Commons.bgColor,
            ),
            activeColor: Colors.grey,
          ),
          BottomNavyBarItem(
            title: Text('Likes'),
            textAlign: TextAlign.center,
            icon: Icon(
              CupertinoIcons.heart_fill,
              color: Commons.bgColor,
            ),
            activeColor: Colors.grey,
          ),
          BottomNavyBarItem(
            title: Text('Notify'),
            textAlign: TextAlign.center,
            icon: Icon(
              CupertinoIcons.bell_fill,
              color: Commons.bgColor,
            ),
            activeColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
