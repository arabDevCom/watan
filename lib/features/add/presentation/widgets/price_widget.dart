import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';

class PriceAddWidget extends StatelessWidget {
  const PriceAddWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileAllDetailsWidget(
            image: title == "Price"
                ? ImageAssets.priceIcon
                : ImageAssets.areaGoldIcon,
            text: title,
            iconColor: AppColors.primary),
        const SizedBox(height: 6),
        CustomTextField(
          image: "null",
          title: title=="Area"?"$title in m":title,
          textInputType: TextInputType.number,
        ),
      ],
    );
  }
}
