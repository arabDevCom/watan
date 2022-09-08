import 'package:elwatn/features/details/presentation/widgets/list_tile_all_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/profile_photo.dart';
import '../../../../core/widgets/social_media_icons.dart';
import '../widgets/choose_language.dart';

class NewAndEditAgencyScreen extends StatelessWidget {
  const NewAndEditAgencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Agency",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ProfilePhotoWidget(),
              ],
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              image: ImageAssets.idNameGoldIcon,
              title: "Agency Name",
              textInputType: TextInputType.text,
            ),
             ListTileAllDetailsWidget(image: ImageAssets.speakIcon,text: "Language",iconColor: AppColors.primary),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                children: const [
                  Spacer(),
                  ChooseLanguageWidget(
                    title: "Arabic",
                    image: ImageAssets.iraqLanguageImage,
                  ),
                  Spacer(),
                  ChooseLanguageWidget(
                    title: "English",
                    image: ImageAssets.englishLanguageImage,
                  ),
                  Spacer(),
                  ChooseLanguageWidget(
                    title: "Kurdish",
                    image: ImageAssets.kurdishLanguageImage,
                  ),
                  Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              image: ImageAssets.emailRegisterIcon,
              title: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              image: ImageAssets.mobileGoldIcon,
              title: "Phone",
              textInputType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              image: ImageAssets.whatsappGoldIcon,
              title: "Whatsapp",
              textInputType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              image: ImageAssets.aboutIcon,
              title: "About",
              textInputType: TextInputType.text,
              minLine: 6,
            ),
            const SizedBox(height: 12),
            const CustomTextField(
              image: ImageAssets.lockGoldIcon,
              title: "Password",
              isPassword: true,
              textInputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 12),
             const SocialMediaWidget(isEnable: true),
            const SizedBox(height: 48),
            CustomButton(
              paddingHorizontal: 65,
              text: "Create",
              color: AppColors.primary,
              onClick: () {
                // Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
