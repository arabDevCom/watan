import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_manager.dart';

class ThreeIconsDetailsWidget extends StatelessWidget {
  const ThreeIconsDetailsWidget({Key? key, required this.area, required this.bedrooms, required this.bathrooms}) : super(key: key);
final int area;
final int bedrooms;
final int bathrooms;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAssets.areaIcon),
         Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(" ${area}M", style: const TextStyle(fontSize: 12)),
        ),
        SvgPicture.asset(ImageAssets.roomsIcon),
         Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(" $bedrooms", style: const TextStyle(fontSize: 12)),
        ),
        SvgPicture.asset(ImageAssets.bathIcon),
         Text(" $bathrooms", style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
