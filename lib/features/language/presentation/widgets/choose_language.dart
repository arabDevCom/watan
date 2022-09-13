import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/features/language/presentation/widgets/language_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/locale_cubit.dart';

class ChooseLanguageWidget extends StatefulWidget {
  const ChooseLanguageWidget({Key? key, required this.isChecked}) : super(key: key);
  final List<bool> isChecked;
  @override
  State<ChooseLanguageWidget> createState() => _ChooseLanguageWidgetState();
}

class _ChooseLanguageWidgetState extends State<ChooseLanguageWidget> {



  List<String> images = [
    (ImageAssets.englishLanguageImage),
    (ImageAssets.iraqLanguageImage),
    (ImageAssets.kurdishLanguageImage),
  ];



  List<bool> isChecked = [true, false, false];



  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      AppLocalizations.of(context)!
          .translate(AppStrings.englishLanguage)!,
      AppLocalizations.of(context)!
          .translate(AppStrings.arabicLanguage)!,
      AppLocalizations.of(context)!
          .translate(AppStrings.kurdishLanguage)!,
    ];
    return Column(
      children: [
        ...List.generate(3, (index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                context.read<LocaleCubit>().toEnglish();
              } else if (index == 1) {
                context.read<LocaleCubit>().toArabic();
              } else if (index == 2) {
                context.read<LocaleCubit>().toKurdish();
              }
            },
            child: LanguageTileWidget(
                images: images[index],
                titles: titles[index],
                isChecked: isChecked[index]),
          );
        })
      ],
    );
  }
}
