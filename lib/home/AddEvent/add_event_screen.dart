import 'package:evently_app/home/AddEvent/row_widget.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/widgets/custom_elevated_button_widget.dart';
import 'package:evently_app/widgets/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../provider/app_theme_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text.dart';
import '../../utils/responsive.dart';
import '../tabs/home/AppBarWidget 1/tab_item.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    List<String> eventNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
    ];

    List<IconData> eventIconList = [
      Icons.directions_bike,
      Icons.cake,
      Icons.museum,
      Icons.groups,
      Icons.menu_book,
    ];

    List<String> eventImagesLightList = [
      AppAssets.sport,
      AppAssets.birthday,
      AppAssets.exhibition,
      AppAssets.meeting,
      AppAssets.bookClub,
    ];

    List<String> eventImagesDarkList = [
      AppAssets.sportDark,
      AppAssets.birthdayDark,
      AppAssets.exhibitionDark,
      AppAssets.meetingDark,
      AppAssets.bookClubDark,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: w(7), vertical: h(8)),
            decoration: BoxDecoration(
              color: themeProvider.isDarkTheme()
                  ? AppColors.transparentColor
                  : AppColors.white,
              border: Border.all(
                color: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: themeProvider.isDarkTheme()
                  ? AppColors.white
                  : AppColors.mainColorLight,
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.add_event,
          style: AppText.mediumText(
            color: themeProvider.isDarkTheme()
                ? AppColors.white
                : AppColors.mainTextColorLight,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(16)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: h(15),
            children: [
              Image(
                image: themeProvider.isDarkTheme()
                    ? AssetImage(eventImagesDarkList[selectedIndex])
                    : AssetImage(eventImagesLightList[selectedIndex]),
                fit: BoxFit.fill,
                height: h(193),
              ),
              DefaultTabController(
                length: eventNameList.length,
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  isScrollable: true,
                  dividerColor: AppColors.transparentColor,
                  indicatorColor: AppColors.transparentColor,
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.symmetric(horizontal: w(5)),
                  tabs: List.generate(eventNameList.length, (index) {
                    return TabItem(
                      widget: eventIconList[index],
                      text: eventNameList[index],
                      isSelected: selectedIndex == index,
                    );
                  }),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.title,
                style: AppText.mediumText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.mainTextColorDark
                      : AppColors.mainTextColorLight,
                  fontSize: 16,
                ),
              ),
              CustomTextFormFieldWidget(
                filled: true,
                fillColor: themeProvider.isDarkTheme()
                    ? AppColors.inputsColorDark
                    : AppColors.inputsColorLight,
                hintText: AppLocalizations.of(context)!.event_title,
                hintStyle: AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  fontSize: 14,
                ),
                borderColor: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                borderWidth: 2,
              ),
              Text(
                AppLocalizations.of(context)!.description,
                style: AppText.mediumText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.mainTextColorDark
                      : AppColors.mainTextColorLight,
                  fontSize: 16,
                ),
              ),
              CustomTextFormFieldWidget(
                filled: true,
                maxLines: 5,
                fillColor: themeProvider.isDarkTheme()
                    ? AppColors.inputsColorDark
                    : AppColors.inputsColorLight,
                hintText: AppLocalizations.of(context)!.event_details,
                hintStyle: AppText.regularText(
                  color: themeProvider.isDarkTheme()
                      ? AppColors.secTextColorDark
                      : AppColors.secTextColorLight,
                  fontSize: 14,
                ),
                borderColor: themeProvider.isDarkTheme()
                    ? AppColors.strokeColorDark
                    : AppColors.strokeColorLight,
                borderWidth: 2,
              ),
              RowWidget(
                text: AppLocalizations.of(context)!.event_date,
                chooseText: AppLocalizations.of(context)!.choose_date,
                icon: Icons.date_range_outlined,
              ),
              RowWidget(
                text: AppLocalizations.of(context)!.event_time,
                chooseText: AppLocalizations.of(context)!.choose_time,
                icon: Icons.access_time_outlined,
              ),
              CustomElevatedButtonWidget(
                widget: Text(AppLocalizations.of(context)!.add_event),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
