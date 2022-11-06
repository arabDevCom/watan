import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/snackbar_method.dart';
import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:elwatn/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/show_loading_indicator.dart';
import '../../../login/data/models/login_data_model.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/body_profile.dart';
import '../widgets/header_profile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key, required this.loginDataModel}) : super(key: key);
  final LoginDataModel loginDataModel;

  @override
  Widget build(BuildContext context) {
    if (loginDataModel.message != null) {
      return BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileUserDeletedError) {
            Future.delayed(const Duration(milliseconds: 500), () {
              snackBar("Errrrrrror", context);
            });
          }
          if (state is ProfileUserDeletedSuccessfully) {
            context.read<ProfileCubit>().removeUserFromLocal(context);
          }
          if (state is ProfileUserDeletedLoading) {
            Future.delayed(Duration(milliseconds: 500), () {
              Navigator.pop(context);
            });
            return const ShowLoadingIndicator();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                HeaderProfileWidget(loginDataModel: loginDataModel),
                const SizedBox(height: 30),
                BodyProfileWidget(loginDataModel: loginDataModel),
              ],
            ),
          );
        },
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${translateText(AppStrings.shouldLoginText, context)} ....",
              style: TextStyle(
                  color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Lottie.asset(ImageAssets.noLogin),
            const SizedBox(height: 80),
            CustomButton(
              text: translateText(AppStrings.loginText, context),
              paddingHorizontal: 80,
              color: AppColors.primary,
              onClick: () {
                Navigator.of(context).pushNamed(Routes.loginScreenRoute);
              },
            ),
          ],
        ),
      );
    }
  }
}
