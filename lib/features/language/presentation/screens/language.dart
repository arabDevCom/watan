import 'package:elwatn/features/language/presentation/widgets/choose_language.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../filter/presentation/widgets/dropdown_search.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Language",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        actions: [Image.asset(ImageAssets.logoIcon)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          children:  [
            const ChooseLanguageWidget(),
            const SizedBox(height: 80,),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child:  DropdownSearchWidget(
                dropdownList: ["iragi dinar", "USD dollavr"],
                icon: Icons.monetization_on_outlined,
                labelText: 'Currency',
              ),
            ),
            const SizedBox(height: 250,),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  maximumSize: Size.infinite,
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                  ),
                  minimumSize: const Size(210, 60),
                  backgroundColor: AppColors.primary),
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
