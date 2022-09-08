import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/features/details/presentation/widgets/list_tile_all_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';

class RegisterCompanyBodyWidget extends StatelessWidget {
  const RegisterCompanyBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         const SizedBox(height: 30),
         const CustomTextField(
          image: ImageAssets.idNameGoldIcon,
          title: "Company Name",
          textInputType: TextInputType.text,
        ),
         const SizedBox(height: 16),
         const CustomTextField(
          image: ImageAssets.emailRegisterIcon,
          title: "Email",
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          image: ImageAssets.mobileGoldIcon,
          title: "Phone",
          textInputType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          image: ImageAssets.whatsappGoldIcon,
          title: "Whatsapp",
          textInputType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          image: ImageAssets.lockGoldIcon,
          title: "Password",
          isPassword: true,
          textInputType: TextInputType.visiblePassword,
        ),
         ListTileAllDetailsWidget(image: ImageAssets.locationGoldIcon, text: "Location",iconColor: AppColors.primary),
        Image.asset(ImageAssets.detailsMapImage),
      ],
    );
  }
}
