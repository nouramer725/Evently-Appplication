import 'package:flutter/material.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_routes.dart';
import '../utils/app_text.dart';
import '../utils/responsive.dart';
import '../utils/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  final pages = [
    {
      "imageLight": AppAssets.onBoarding1,
      "imageDark": AppAssets.onBoarding1Dark,
      "title": "Find Events That Inspire You",
      "text":
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    },
    {
      "imageLight": AppAssets.onBoarding2,
      "imageDark": AppAssets.onBoarding2Dark,
      "title": "Effortless Event Planning",
      "text":
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    },
    {
      "imageLight": AppAssets.onBoarding3,
      "imageDark": AppAssets.onBoarding3Dark,
      "title": "Connect & Share Moments",
      "text":
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        leading: currentPage == 0
            ? const SizedBox()
            : IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              ),
        title: Image.asset(
          Theme.of(context).appBarTheme.backgroundColor ==
                  AppColors.backgroundColorLight
              ? AppAssets.eventlyLogo
              : AppAssets.eventlyLogoDark,
        ),
        actions: [
          currentPage == pages.length - 1
              ? const SizedBox()
              : TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.homeScreenName,
                  ),
                  child: Text("Skip"),
                ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (i) => setState(() => currentPage = i),
              itemBuilder: (context, index) {
                final page = pages[index];
                return buildPage(
                  imageLight: page["imageLight"]!,
                  imageDark: page["imageDark"]!,
                  title: page["title"]!,
                  text: page["text"]!,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(23)),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (currentPage == pages.length - 1) {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.homeScreenName,
                    );
                  } else {
                    controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor ==
                          AppColors.backgroundColorLight
                      ? AppColors.mainColorLight
                      : AppColors.mainColorDark,
                  padding: EdgeInsets.symmetric(vertical: h(9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  currentPage == pages.length - 1 ? "Get Started" : "Next",
                  style: AppText.text20Medium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String imageLight,
    required String imageDark,
    required String title,
    required String text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(20)),
      child: SingleChildScrollView(
        child: Column(
          spacing: h(8),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? imageLight
                  : imageDark,
              height: h(343),
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  width: currentPage == index ? 25 : 9,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).appBarTheme.backgroundColor ==
                            AppColors.backgroundColorLight
                        ? currentPage == index
                              ? AppColors.mainColorLight
                              : AppColors.disableColorLight
                        : currentPage == index
                        ? AppColors.mainColorDark
                        : AppColors.mainTextColorDark,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Text(
              title,
              style:
                  Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppText.text20SemiBold
                  : AppText.text20SemiBoldDark,
            ),
            Text(
              text,
              style:
                  Theme.of(context).appBarTheme.backgroundColor ==
                      AppColors.backgroundColorLight
                  ? AppText.text16Regular
                  : AppText.text16RegularDark,
            ),
          ],
        ),
      ),
    );
  }
}
