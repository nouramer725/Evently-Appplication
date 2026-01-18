import 'package:evently_app/home/tabs/home/app_bar_title.dart';
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
      appBar: AppBar(
        toolbarHeight: h(150),
        centerTitle: false,
        title: AppBarTitle(),
      ),
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
