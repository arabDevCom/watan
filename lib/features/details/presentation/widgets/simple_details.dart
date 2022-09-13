import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/three_icon_details.dart';

class SimpleDetails extends StatelessWidget {
  const SimpleDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style:
                    TextStyle(fontSize: 12, color: AppColors.black),
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'IQD',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' 250.000!'),
                    ],
                  ),
                ),
                const ThreeIconsDetailsWidget(area: "250",bathrooms: "2",bedrooms: "6"),
              ],
            ),
          ),
          const Spacer(),
          Text(
            "For Rent",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
