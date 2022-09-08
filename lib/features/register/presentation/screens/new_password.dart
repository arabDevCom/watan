import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "New Password",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 48),
          Row(
            children: [
              Expanded(child: Image.asset(ImageAssets.newPasswordImage,width: 210,height: 150,)),
            ],
          ),
          const SizedBox(height: 22),
          const Text("Please enter a new password"),
          const SizedBox(height: 32),
          const SizedBox(height: 16),
          const CustomTextField(
            image: ImageAssets.lockGoldIcon,
            title: "Password",
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            image: ImageAssets.lockGoldIcon,
            title: "Confirm Password",
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 48),
          CustomButton(
            paddingHorizontal:65 ,
            text: "Confirm",
            color: AppColors.primary,
            onClick: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),

    );
  }
}
