import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/social_media_icons.dart';
import '../widgets/body_register_company.dart';
import '../../../../core/widgets/profile_photo.dart';
import '../widgets/register_buttons.dart';

class RegisterCompany extends StatelessWidget {
  const RegisterCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Register Company",
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
            const RegisterCompanyBodyWidget(),
            const SocialMediaWidget(isEnable: true),
            const RegisterButtons(),
          ],
        ),
      ),
    );
  }
}
