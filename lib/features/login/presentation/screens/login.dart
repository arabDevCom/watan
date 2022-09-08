import 'package:country_code_picker/country_code_picker.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Login",
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
                Row(
                  children: [
                    Expanded(child: Image.asset(ImageAssets.watanLogo)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(label: Text("Email")),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(label: Text("Password")),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 60),
                CustomButton(
                  text: "Login",
                  color: AppColors.primary,
                  paddingHorizontal: 25,
                  onClick: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, Routes.welcomeRegisterRoute);
                      }, child: Text("Register",style: TextStyle(color: AppColors.black),),),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, Routes.forgetPasswordRoute);
                      }, child: Text("Forget Password",style: TextStyle(color: AppColors.black),),),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    ImageAssets.cityImage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
