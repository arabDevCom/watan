import 'package:elwatn/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/welcome_registeration.dart';

class WelcomeRegister extends StatelessWidget {
  const WelcomeRegister({Key? key}) : super(key: key);

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
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Welcome to WATAN",
                style: TextStyle(fontSize: 24, color: AppColors.primary),
              ),
              const SizedBox(height: 10),
              Text(
                "Please select your user type ...",
                style: TextStyle(fontSize: 18, color: AppColors.grayLite),
              ),
              const SizedBox(height: 30),
              const WelcomeChoose(),
              const Spacer(),
              CustomButton(text: "Next",color: AppColors.primary,onClick: (){
                Navigator.pushNamed(context, Routes.registerCompanyRoute);
              }),
              const Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
