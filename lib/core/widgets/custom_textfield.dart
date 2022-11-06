import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/convert_numbers_method.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/profile/presentation/cubit/profile_cubit.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({
    Key? key,
    required this.image,
    required this.title,
    required this.textInputType,
    this.minLine = 1,
    this.isPassword = false,
    this.validatorMessage = '',
    this.isNum = false,
    this.isAgent = false,
    this.controller,
    this.imageColor = Colors.grey,
  }) : super(key: key);
  final String image;
  final Color imageColor;
  final String title;
  final String validatorMessage;
  final int minLine;
  final bool isPassword;
  final bool isNum;
  final bool isAgent;
  final TextInputType textInputType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Column(
        children: [
          image != "null"
              ? Row(
                  children: [
                    SvgPicture.asset(image,color: imageColor,),
                    const SizedBox(width: 6),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                )
              : const SizedBox(width: 0),
          image != "null"
              ? const SizedBox(height: 6)
              : const SizedBox(width: 0),
          TextFormField(
            controller: controller,
            keyboardType: textInputType,
            obscureText: isPassword,
            decoration: InputDecoration(
                prefixIcon: isNum
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Text(
                          IsLanguage.isEnLanguage(context)
                              ? "+964"
                              : "+ ${replaceToArabicNumber("469")}",
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : null,
                hintText: title,
                border: image != "null"
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                fillColor: AppColors.scaffoldBackground,
                filled: true),
            maxLines: isPassword ? 1 : 20,
            minLines: minLine,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return validatorMessage;
              } else if (isAgent) {
                if (context.read<ProfileCubit>().statusCode == 422) {
                  return validatorMessage;
                }
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
