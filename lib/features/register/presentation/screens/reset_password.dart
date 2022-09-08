import 'dart:async';

import 'package:elwatn/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../widgets/header_title.dart';

// ignore: must_be_immutable
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final formKey = GlobalKey<FormState>();
  bool hasError = false;
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Reset Password",
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
                const SizedBox(height: 80),
                const HeaderTitleWidget(
                  title: 'Please enter your verification code .',
                  des:
                      "We have sent a verification code to your registered email ID ",
                ),
                const SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        inactiveColor: AppColors.gray,
                        activeColor: AppColors.gray,
                        shape: PinCodeFieldShape.underline,
                        selectedColor: AppColors.primary,
                      ),
                      cursorColor: AppColors.primary,
                      animationDuration: const Duration(milliseconds: 300),
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        formKey.currentState!.validate();
                        if (currentText.length != 4) {
                          errorController!.add(ErrorAnimationType
                              .shake); // Triggering error shake animation
                          setState(() => hasError = true);
                        } else {
                          setState(
                                () {
                              hasError = false;
                              snackBar("OTP Verified!!");
                            },
                          );
                        }
                        debugPrint("Completed");
                      },
                      onChanged: (value) {
                        setState(() {
                          currentText = value;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style:  TextStyle(
                        color: AppColors.error,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                    text: "Done",
                    color: AppColors.primary,
                    paddingHorizontal: 60,
                    onClick: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText.length != 4) {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                      } else {
                        setState(
                              () {
                                Future.delayed(const Duration(seconds: 3),(){
                                  Navigator.pushNamed(context, Routes.newPasswordRoute);
                                });
                            hasError = false;
                            snackBar("OTP Verified!!");
                          },
                        );
                      }
                    },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              ImageAssets.resetPasswordImage,
              height: 180,
              width: 210,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
