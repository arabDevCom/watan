import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/features/language/presentation/widgets/language_tile.dart';
import 'package:flutter/material.dart';

class ChooseLanguageWidget extends StatefulWidget {
  const ChooseLanguageWidget({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageWidget> createState() => _ChooseLanguageWidgetState();
}

class _ChooseLanguageWidgetState extends State<ChooseLanguageWidget> {
  List<String> images = [
    (ImageAssets.englishLanguageImage),
    (ImageAssets.iraqLanguageImage),
    (ImageAssets.kurdishLanguageImage),
  ];

  List<String> titles = [
    "ENGLISH - انجليزى",
    "Arabic - عربى",
    "Kurdish - كوردى",
  ];

  List<bool> isChecked = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(3, (index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                setState(() {
                  isChecked = [true, false, false];
                });
              } else if (index == 1) {
                setState(() {
                  isChecked = [false, true, false];
                });
              } else if (index == 2) {
                setState(() {
                  isChecked = [false, false, true];
                });
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
