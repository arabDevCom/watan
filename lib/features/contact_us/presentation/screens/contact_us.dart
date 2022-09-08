import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Contact Us",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Image.asset(
                    ImageAssets.contactUsImage,
                    width: 215,
                    height: 136,
                  )),
                ],
              ),
              const SizedBox(height: 30),
              const CustomTextField(
                image: ImageAssets.accountPersonIcon,
                title: "Name",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                image: ImageAssets.emailIcon,
                title: "Email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                image: ImageAssets.rewriteIcon,
                title: "Subject",
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                image: ImageAssets.rewriteIcon,
                title: "Massage",
                textInputType: TextInputType.text,
                minLine: 6,
              ),
              const SizedBox(height: 60),
              CustomButton(
                text: "Send",
                color: AppColors.primary,
                onClick: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
