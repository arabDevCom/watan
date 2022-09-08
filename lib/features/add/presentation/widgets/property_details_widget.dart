import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';

class PropertyDetailsWidget extends StatelessWidget {
  const PropertyDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileAllDetailsWidget(
            image: ImageAssets.areaIcon, text: "Property Details"),
        const SizedBox(height: 6),
        const CustomTextField(
          image: "null",
          title: "Title",
          textInputType: TextInputType.text,
        ),
        const CustomTextField(
          image: "null",
          title: "Description",
          textInputType: TextInputType.text,
          minLine: 5,
        ),
      ],
    );
  }
}
