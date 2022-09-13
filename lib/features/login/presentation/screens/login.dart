import 'package:country_code_picker/country_code_picker.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../cubit/login_cubit.dart';
import 'package:elwatn/core/widgets/error_widget.dart' as error_widget;

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (BuildContext context, state) {
          if (state is LoginLoading) {
            return const ShowLoadingIndicator();
          } else if (state is LoginLoaded) {
            return Column(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
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
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                                const InputDecoration(label: Text("Email")),
                            textAlign: TextAlign.left,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration:
                                const InputDecoration(label: Text("Password")),
                            textAlign: TextAlign.left,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 60),
                        CustomButton(
                          text: "Login",
                          color: AppColors.primary,
                          paddingHorizontal: 25,
                          onClick: () {
                            print("emailController.text");
                            print(emailController.text);
                            print("passwordController.text");
                            print(passwordController.text);

                            if (_formKey.currentState!.validate()) {

                              print("emailController.text");
                              print(emailController.text);
                              print("passwordController.text");
                              print(passwordController.text);

                              context.read<LoginCubit>().postLoginData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //       content: Text('Processing Data')),
                              // );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.welcomeRegisterRoute);
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.forgetPasswordRoute);
                                },
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
            );
          } else if (state is LoginLoadedError) {
            return error_widget.ErrorWidget(onPressed: () {});
          } else {
            return Column(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
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
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                            const InputDecoration(label: Text("Email")),
                            textAlign: TextAlign.left,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 22),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration:
                            const InputDecoration(label: Text("Password")),
                            textAlign: TextAlign.left,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 60),
                        CustomButton(
                          text: "Login",
                          color: AppColors.primary,
                          paddingHorizontal: 25,
                          onClick: () {
                            print("emailController.text");
                            print(emailController.text);
                            print("passwordController.text");
                            print(passwordController.text);

                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().postLoginData(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //       content: Text('Processing Data')),
                              // );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.welcomeRegisterRoute);
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.forgetPasswordRoute);
                                },
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(color: AppColors.black),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
            );
          }
        },
      ),
    );
  }
}
