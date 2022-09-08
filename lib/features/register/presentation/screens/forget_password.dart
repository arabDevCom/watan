import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../widgets/header_title.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Forget Password",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 60),
                const HeaderTitleWidget(
                  title: 'Please enter your registered in the email ID.',
                  des:
                      "We will send a verification code to your registered  email ID.",
                ),
                const SizedBox(height: 30),
                const CustomTextField(
                  image: ImageAssets.emailRegisterIcon,
                  title: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 60),
                CustomButton(
                  text: "Send",
                  color: AppColors.primary,
                  paddingHorizontal: 60,
                  onClick: () {
                    Navigator.pushNamed(context, Routes.resetPasswordRoute);
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              ImageAssets.forgetPasswordImage,
              height: 180,
              width: MediaQuery.of(context).size.width/2+80,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
