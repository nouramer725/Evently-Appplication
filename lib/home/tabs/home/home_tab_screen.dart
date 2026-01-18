import 'package:evently_app/home/tabs/home/AppBarWidget%201/app_bar_widget1.dart';
import 'package:evently_app/home/tabs/home/AppBarWidget%202/app_bar_widget2.dart';
import 'package:evently_app/home/tabs/home/body_widget.dart';
import 'package:flutter/material.dart';
import '../../../utils/responsive.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget1(),
      // appBar: AppBarWidget2(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return BodyWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: h(15));
        },
        itemCount: 10,
      ),
    );
  }
}
