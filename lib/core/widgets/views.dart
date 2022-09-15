import 'package:elwatn/core/utils/convert_numbers_method.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_manager.dart';

class ViewsWidget extends StatelessWidget {
  const ViewsWidget({Key? key, required this.views}) : super(key: key);

  final String views;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: SvgPicture.asset(
            ImageAssets.viewsIcon,
            width: 18,
            height: 14,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          textAlign: TextAlign.center,
          IsLanguage.isEnLanguage(context)
              ? views
              : replaceToArabicNumber(views),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
