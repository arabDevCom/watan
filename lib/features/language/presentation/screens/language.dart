import 'package:elwatn/features/language/presentation/widgets/choose_language.dart';
import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../filter/presentation/widgets/dropdown_search.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<bool> isChecked = [];

  @override
  void initState() {
    super.initState();
  }

  List<bool> chooseLan() {
    if (AppLocalizations.of(context)!.isEnLocale) {
      setState(() {
        isChecked = [true, false, false];
      });
      return isChecked;
    } else if (AppLocalizations.of(context)!.isArLocale) {
      setState(() {
        isChecked = [false, true, false];
      });
      return isChecked;
    } else {
      setState(() {
        isChecked = [false, false, true];
      });
      return isChecked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          AppLocalizations.of(context)!.translate(AppStrings.languageTitle)!,
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
          children: [
            ChooseLanguageWidget(isChecked: chooseLan()),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownSearchWidget(
                dropdownList: [
                  AppLocalizations.of(context)!
                      .translate(AppStrings.iraqDinarText)!,
                  AppLocalizations.of(context)!
                      .translate(AppStrings.dollarText)!
                ],
                icon: Icons.monetization_on_outlined,
                labelText: AppLocalizations.of(context)!
                    .translate(AppStrings.currencyHint)!,
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  maximumSize: Size.infinite,
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(30)),
                  minimumSize: const Size(210, 60),
                  backgroundColor: AppColors.primary),
              child: Text(AppLocalizations.of(context)!
                  .translate(AppStrings.saveText)!),
            )
          ],
        ),
      ),
    );
  }
}
