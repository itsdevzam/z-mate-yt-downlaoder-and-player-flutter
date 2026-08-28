import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_down/core/colors/MyColors.dart';
import 'package:yt_down/features/Home/presentation/screen/HomePage.dart';
import 'package:yt_down/features/Search/presentation/screen/SearchScreen.dart';
import 'package:yt_down/features/Settings/screen/SettingsPage.dart';

import '../../Download/presentation/screen/DownloadPage.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}
int _index=0;
class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          ///Home Screen
          HomePage(),
          ///Search Screen
          SearchScreen(),
          ///Download Screen
          DownlaodPage(),
          ///Profile Screen
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: _index,
        selectedItemColor: MyColors.primary,
        unselectedItemColor: MyColors.secondary,
        items: [
          BottomNavigationBarItem(icon: Icon(Iconsax.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Iconsax.search_normal),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Iconsax.arrow_down),label: 'Downloads'),
          BottomNavigationBarItem(icon: Icon(Iconsax.setting),label: 'Settings'),
        ],
        onTap: (index)=>setState(() {
          _index=index;
        }),
      ),
    );
  }
}
