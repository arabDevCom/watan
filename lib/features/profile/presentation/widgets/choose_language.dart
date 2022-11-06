import 'package:elwatn/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../cubit/profile_cubit.dart';

class ChooseLanguageWidget extends StatefulWidget {
  const ChooseLanguageWidget({Key? key, required this.title, required this.image})
      : super(key: key);
  final String title;
  final String image;

  @override
  State<ChooseLanguageWidget> createState() => _ChooseLanguageWidgetState();
}

class _ChooseLanguageWidgetState extends State<ChooseLanguageWidget> {
  Color? changeColor;

  @override
  void initState() {

    if(context.read<ProfileCubit>().agentBtnText=="update"){
      if(widget.image==ImageAssets.englishLanguageImage){
        changeColor =context.read<ProfileCubit>().isLanguage("en");
      }else if(widget.image==ImageAssets.iraqLanguageImage){
        changeColor =context.read<ProfileCubit>().isLanguage("ar");
      }else if(widget.image==ImageAssets.kurdishLanguageImage){
        changeColor =context.read<ProfileCubit>().isLanguage("ku");
      }
    }else{
      changeColor = AppColors.buttonBackground;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (changeColor == AppColors.primary) {
            changeColor = AppColors.buttonBackground;
            if(widget.title==translateText(AppStrings.englishLanguage, context)){
              print(" no english");
              context.read<ProfileCubit>().language("en", false);
            }else if(widget.title==translateText(AppStrings.arabicLanguage, context)){
              context.read<ProfileCubit>().language("ar", false);
              print(" no arabic");
            }else if(widget.title==translateText(AppStrings.kurdishLanguage, context)){
              context.read<ProfileCubit>().language("ku", false);
              print(" no kurdish");
            }
          } else {
            changeColor = AppColors.primary;
            if(widget.title==translateText(AppStrings.englishLanguage, context)){
              context.read<ProfileCubit>().language("en", true);
              print("english");
            }else if(widget.title==translateText(AppStrings.arabicLanguage, context)){
              context.read<ProfileCubit>().language("ar", true);
              print("arabic");
            }else if(widget.title==translateText(AppStrings.kurdishLanguage, context)){
              context.read<ProfileCubit>().language("ku", true);
              print("kurdish");
            }
          }
        });
      },
      child: InputChip(
        backgroundColor: changeColor,
        deleteIcon:
        changeColor == AppColors.primary ? const Icon(Icons.check) : const SizedBox(),
        deleteIconColor: AppColors.white,
        label: Text(
          widget.title,
          style: TextStyle(color: AppColors.white),
        ),
        avatar: Image.asset(widget.image),
        onDeleted: () {
          setState(() {
            if (changeColor == AppColors.primary) {
              changeColor = AppColors.buttonBackground;
              if(widget.title==translateText(AppStrings.englishLanguage, context)){
                print(" no english");
                context.read<ProfileCubit>().language("en", false);
              }else if(widget.title==translateText(AppStrings.arabicLanguage, context)){
                context.read<ProfileCubit>().language("ar", false);
                print(" no arabic");
              }else if(widget.title==translateText(AppStrings.kurdishLanguage, context)){
                context.read<ProfileCubit>().language("ku", false);
                print(" no kurdish");
              }
            } else {
              changeColor = AppColors.primary;
              if(widget.title==translateText(AppStrings.englishLanguage, context)){
                context.read<ProfileCubit>().language("en", true);
                print("english");
              }else if(widget.title==translateText(AppStrings.arabicLanguage, context)){
                context.read<ProfileCubit>().language("ar", true);
                print("arabic");
              }else if(widget.title==translateText(AppStrings.kurdishLanguage, context)){
                context.read<ProfileCubit>().language("ku", true);
                print("kurdish");
              }
            }
          });
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}