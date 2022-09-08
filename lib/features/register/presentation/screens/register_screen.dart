import 'package:country_code_picker/country_code_picker.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/profile_photo.dart';
import '../widgets/register_buttons.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Register",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
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
                title: "Name",
                textInputType: TextInputType.text,
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
                image: ImageAssets.emailRegisterIcon,
                title: "Email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              const CustomTextField(
                image: ImageAssets.lockGoldIcon,
                title: "Confirm Password",
                isPassword: true,
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 30),
              const RegisterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
