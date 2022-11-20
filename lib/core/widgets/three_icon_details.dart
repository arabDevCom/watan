import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/locale/app_localizations.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';
import '../utils/convert_numbers_method.dart';
import '../utils/is_language_methods.dart';
import '../utils/translate_text_method.dart';

class ThreeIconsDetailsWidget extends StatelessWidget {
  const ThreeIconsDetailsWidget(
      {Key? key,
      required this.area,
      required this.bedrooms,
      required this.bathrooms})
      : super(key: key);
  final String area;
  final String bedrooms;
  final String bathrooms;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAssets.areaIcon),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Text(
              "   ${AppLocalizations.of(context)!.isEnLocale ? area == "null" ? "0" : area : replaceToArabicNumber(area.toString())}",
              style: const TextStyle(fontSize: 12)),
        ),
        SvgPicture.asset(ImageAssets.roomsIcon),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Text(
            "${bedrooms == '0' ? translateText(AppStrings.studioText, context) : IsLanguage.isEnLanguage(context) ? bedrooms: replaceToArabicNumber(bedrooms.toString())}",
            style: const TextStyle(fontSize: 12),
          ),
        ),
        SvgPicture.asset(ImageAssets.bathIcon),
        Text(
          "   ${AppLocalizations.of(context)!.isEnLocale ? bathrooms == "null" ? "0" : bathrooms : replaceToArabicNumber(bathrooms.toString())}",
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
