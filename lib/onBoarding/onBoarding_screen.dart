import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
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

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final pages = [
      {
        "imageLight": AppAssets.onBoarding1,
        "imageDark": AppAssets.onBoarding1Dark,
        "title": AppLocalizations.of(context)!.title1,
        "text": AppLocalizations.of(context)!.text1,
      },
      {
        "imageLight": AppAssets.onBoarding2,
        "imageDark": AppAssets.onBoarding2Dark,
        "title": AppLocalizations.of(context)!.title2,
        "text": AppLocalizations.of(context)!.text2,
      },
      {
        "imageLight": AppAssets.onBoarding3,
        "imageDark": AppAssets.onBoarding3Dark,
        "title": AppLocalizations.of(context)!.title3,
        "text": AppLocalizations.of(context)!.text3,
      },
    ];

    return Scaffold(
      appBar: AppBar(
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
                  child: Text(AppLocalizations.of(context)!.skip),
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
                  totalPages: pages.length,
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
                  padding: EdgeInsets.symmetric(vertical: h(9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  currentPage == pages.length - 1
                      ? AppLocalizations.of(context)!.getstarted
                      : AppLocalizations.of(context)!.next,
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
    required int totalPages,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(16)),
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
                totalPages,
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
