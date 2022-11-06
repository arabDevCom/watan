import 'package:elwatn/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/icon_with_text_widget.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';

class FloorPlansWidget extends StatelessWidget {
  const FloorPlansWidget({Key? key, required this.unitDetail})
      : super(key: key);
  final UnitDetail unitDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconWithTextWidget(
          text: "Floor Plan",
          icon: ImageAssets.packagesIcon,
          iconColor: AppColors.black,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconWithTextWidget(
                text: unitDetail.area!,
                icon: ImageAssets.areaGoldIcon,
                iconColor: AppColors.black,
              ),
              IconWithTextWidget(
                text: unitDetail.bedrooms!,
                icon: ImageAssets.roomsIcon,
                iconColor: AppColors.black,
              ),
              IconWithTextWidget(
                text: unitDetail.bathrooms!,
                icon: ImageAssets.bathGoldIcon,
                iconColor: AppColors.black,
              ),
              IconWithTextWidget(
                text: "${unitDetail.price}",
                icon: ImageAssets.priceIcon,
                iconColor: AppColors.black,
              ),
            ],
          ),
        )
      ],
    );
  }
}
