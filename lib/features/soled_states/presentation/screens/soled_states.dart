import 'package:flutter/material.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/title_scroll_navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/scound_main_item.dart';

class SoledStates extends StatelessWidget {
  const SoledStates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Soled States",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        actions: [Image.asset(ImageAssets.logoIcon)],
      ),
      body: TitleScrollNavigation(
        showIdentifier: false,
        barStyle:  TitleNavigationBarStyle(
          style: const TextStyle(fontWeight: FontWeight.bold),
          padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width/6,vertical: 12),
          spaceBetween: MediaQuery.of(context).size.width/3,

          activeColor:AppColors.primary,
            background: AppColors.buttonBackground
        ),
        titles: const[
          "For Sale",
          "For Rent",
        ],
        pages: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(5, (index) => const SecondMainItemWidget())
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(7, (index) => const SecondMainItemWidget())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
