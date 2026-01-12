import 'package:evently_app/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_routes.dart';
import '../utils/responsive.dart';
import '../utils/size_config.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return IntroductionScreen(
      globalBackgroundColor: AppColors.backgroundColorLight,
      pages: [
        PageViewModel(
          titleWidget: Image.asset(AppAssets.eventlyLogo, height: h(27)),
          bodyWidget: Column(
            spacing: h(16),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.onBoarding1,
                fit: BoxFit.cover,
                width: w(343),
                height: h(343),
              ),
              Text(
                "Find Events That Inspire You",
                style: AppText.text20SemiBold,
              ),
              Text(
                "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
                style: AppText.text16Regular,
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAssets.eventlyLogo),
          bodyWidget: Column(
            spacing: h(16),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.onBoarding2,
                fit: BoxFit.cover,
                width: w(343),
                height: h(343),
              ),
              Text("Effortless Event Planning", style: AppText.text20SemiBold),
              Text(
                "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
                style: AppText.text16Regular,
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset(AppAssets.eventlyLogo),
          bodyWidget: Column(
            spacing: h(16),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.onBoarding3,
                fit: BoxFit.cover,
                width: w(343),
                height: h(343),
              ),
              Text(
                "Connect with Friends & Share Moments",
                style: AppText.text20SemiBold,
              ),
              Text(
                "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
                style: AppText.text16Regular,
              ),
            ],
          ),
        ),
      ],


      next: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Text("Next", style: AppText.text20Medium),
      ),
      done: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Text("Finish", style: AppText.text20Medium),
      ),

      onDone: () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreenName);
      },

      dotsDecorator: DotsDecorator(
        color: AppColors.disableColorLight,
        activeColor: AppColors.mainColorLight,
        size: Size(10, 25),
        activeSize: Size(20, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
