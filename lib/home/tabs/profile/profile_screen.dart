import 'package:evently_app/home/tabs/profile/profile_widget.dart';
import 'package:evently_app/utils/app_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: h(12),
        children: [
          CircleAvatar(
            radius: w(70),
            backgroundImage: AssetImage(AppAssets.routeLogo),
          ),
          Text(
            "John Doe",
            style:
                Theme.of(context).appBarTheme.backgroundColor ==
                    AppColors.backgroundColorLight
                ? AppText.text20SemiBold
                : AppText.text20SemiBoldDark,
          ),
          Text(
            "johnsafwat.route@gmail.com",
            style:
                Theme.of(context).appBarTheme.backgroundColor ==
                    AppColors.backgroundColorLight
                ? AppText.text14Regular
                : AppText.text14RegularDark,
          ),
          ProfileWidget(
            text: "Dark mode",
            icon: Switch(
              value: isSwitched,
              onChanged: (value) {
                isSwitched = !isSwitched;
                setState(() {});
              },
              activeThumbColor:
                  Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppColors.mainColorLight
                  : AppColors.mainColorDark,
              inactiveThumbColor:
                  Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppColors.disableColorLight
                  : AppColors.disableColorDark,
            ),
          ),
          ProfileWidget(
            text: "Language",
            icon: Icon(
              Icons.arrow_forward_ios,
              color:
                  Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppColors.mainColorLight
                  : AppColors.mainColorDark,
            ),
            onTap: () {},
          ),
          ProfileWidget(
            text: "Logout",
            onTap: () {},
            icon: Image.asset(AppAssets.logOutIcon),
          ),
        ],
      ),
    );
  }
}
