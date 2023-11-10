import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/home/home_page.dart';
import 'package:flutter_task/ui/screens/more/more_screen.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_images.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    const HomeScreen(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageList.elementAt(pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 20,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(AppImage.home),
                activeIcon: Image.asset(
                  AppImage.home,
                  color: AppColors.primaryColor,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(AppImage.radio),
                activeIcon: Image.asset(
                  AppImage.radio,
                  color: AppColors.primaryColor,
                ),
                label: 'Radio'),
            BottomNavigationBarItem(
                icon: Image.asset(AppImage.music),
                activeIcon: Image.asset(
                  AppImage.music,
                  color: AppColors.primaryColor,
                ),
                label: 'Sermon'),
            BottomNavigationBarItem(
                icon: Image.asset(AppImage.search),
                activeIcon: Image.asset(
                  AppImage.search,
                  color: AppColors.primaryColor,
                ),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: Image.asset(AppImage.more),
                activeIcon: Image.asset(
                  AppImage.more,
                  color: AppColors.primaryColor,
                ),
                label: 'more'),
          ],
        ));
  }
}
