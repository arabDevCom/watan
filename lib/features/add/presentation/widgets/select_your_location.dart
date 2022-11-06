import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';

class SelectYourLocation extends StatelessWidget {
  const SelectYourLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileAllDetailsWidget(
            image: ImageAssets.locationGoldIcon,
            text: "Location",
            iconColor: AppColors.primary,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const SizedBox(width: 8),
          const Text("Select Your Location : "),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.mapScreenRoute);
              },
              child: Image.asset(
                ImageAssets.mapImage,
                height: 48,
                width: 48,
              ),
            ),
          const SizedBox(width: 8),
        ],)
      ],
    );
  }
}
