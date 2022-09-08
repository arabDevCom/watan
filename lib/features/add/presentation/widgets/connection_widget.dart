import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTileAllDetailsWidget(image: ImageAssets.callIcon, text: "Contact Details",iconColor: AppColors.primary),
      const CustomTextField(
        image: ImageAssets.idNameGoldIcon,
        title: "Name",
        textInputType: TextInputType.text,
      ),
      const SizedBox(height: 20),
      const CustomTextField(
        image: ImageAssets.mobileGoldIcon,
        title: "Mobile Number",
        textInputType: TextInputType.text,
      ),
      const SizedBox(height: 20),
      const CustomTextField(
        image: ImageAssets.whatsappGoldIcon,
        title: "Whatsapp",
        textInputType: TextInputType.text,
      ),
      const SizedBox(height: 20),
    ],);
  }
}
