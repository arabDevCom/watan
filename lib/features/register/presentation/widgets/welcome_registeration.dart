import 'package:elwatn/features/register/presentation/widgets/welcome_choose_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../cubit/register_cubit.dart';

class WelcomeChoose extends StatelessWidget {
   const WelcomeChoose({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      translateText(AppStrings.userText, context),
      translateText(AppStrings.companyAndOfficeText, context),
      translateText(AppStrings.projectText, context)
    ];
    List<String> desc = [
      translateText(AppStrings.userDesc, context),
      translateText(AppStrings.companyAndOfficeDesc, context),
      translateText(AppStrings.projectDesc, context)
    ];
    List<String> images = [
      ImageAssets.userRegisterImage,
      ImageAssets.projectRegisterImage,
      ImageAssets.companyRegisterImage
    ];
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (BuildContext context, state) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                titles.length,
                    (index) => InkWell(
                  onTap: () {
                    if (index == 0) {
                      print(index);
                      context.read<RegisterCubit>().changeUser(true, true,1);
                    } else if (index == 1) {
                      print(index);
                      context.read<RegisterCubit>().changeUser(true, false,2);

                    } else if (index == 2) {
                      print(index);
                      context.read<RegisterCubit>().changeUser(false, true,3);
                    }
                  },
                  child: WelcomeChooseWidget(
                    title: titles[index],
                    dec: desc[index],
                    image: images[index],
                    index: index+1,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
