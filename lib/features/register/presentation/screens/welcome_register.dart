import 'package:elwatn/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/snackbar_method.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubit/register_cubit.dart';
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
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (BuildContext context, state) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  CustomButton(
                    text: "Next",
                    color: AppColors.primary,
                    onClick: () {
                      if (context.read<RegisterCubit>().choose1 == true &&
                          context.read<RegisterCubit>().choose2 == true) {
                        Navigator.pushNamed(context, Routes.registerScreenRoute);
                      } else if (context.read<RegisterCubit>().choose1 ==
                              true &&
                          context.read<RegisterCubit>().choose2 == false) {
                        Navigator.pushNamed(context, Routes.registerCompanyRoute);
                      } else if (context.read<RegisterCubit>().choose1 ==
                              false &&
                          context.read<RegisterCubit>().choose2 == true) {
                        Navigator.pushNamed(context, Routes.bloggsRoute);
                      } else {
                        snackBar("Choose User",context,color: AppColors.primary);
                      }
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
