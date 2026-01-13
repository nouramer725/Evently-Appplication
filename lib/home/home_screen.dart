import 'package:evently_app/home/tabs/favourite_tab_screen.dart';
import 'package:evently_app/home/tabs/home_tab_screen.dart';
import 'package:evently_app/home/tabs/profile/profile_screen.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeTabScreen(),
    FavouriteTabScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: AppColors.inputsColorLight),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          buildBottomNavigationBarItem(
            index: 0,
            label: 'Home',
            outlinedIcon: AppAssets.homeIconUnSelected,
            filledIcon:
                Theme.of(context).appBarTheme.backgroundColor ==
                    AppColors.backgroundColorLight
                ? AppAssets.homeIconSelected
                : AppAssets.homeIconSelectedDark,
          ),
          buildBottomNavigationBarItem(
            index: 1,
            label: 'Favorite',
            outlinedIcon: AppAssets.favouriteIconUnSelected,
            filledIcon:
                Theme.of(context).appBarTheme.backgroundColor ==
                    AppColors.backgroundColorLight
                ? AppAssets.favouriteIconSelected
                : AppAssets.favouriteIconSelectedDark,
          ),
          buildBottomNavigationBarItem(
            index: 2,
            label: 'Profile',
            outlinedIcon: AppAssets.profileIconUnSelected,
            filledIcon:
                Theme.of(context).appBarTheme.backgroundColor ==
                    AppColors.backgroundColorLight
                ? AppAssets.profileIconSelected
                : AppAssets.profileIconSelectedDark,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: [Expanded(child: screens[selectedIndex])]),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required int index,
    required String label,
    required String outlinedIcon,
    required String filledIcon,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Image.asset(selectedIndex == index ? filledIcon : outlinedIcon),
    );
  }
}
