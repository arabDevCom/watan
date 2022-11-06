import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/body_register_company.dart';
import '../../../../core/widgets/profile_photo.dart';
import '../widgets/register_buttons.dart';

class RegisterCompany extends StatelessWidget {
   RegisterCompany({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

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
                ProfilePhotoWidget(kind: "company"),
              ],
            ),
            const RegisterCompanyBodyWidget(),
            // const SocialMediaWidget(isEnable: true),
             RegisterButtons(formKey: _formKey),
          ],
        ),
      ),
    );
  }
}
