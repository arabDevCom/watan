import 'package:flutter/material.dart';

import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../cubit/report_post_cubit.dart';

class ReportBodyWidget extends StatelessWidget {
  ReportBodyWidget({Key? key, required this.postType, required this.id})
      : super(key: key);
  final formKey = GlobalKey<FormState>();
  final String postType;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                image: ImageAssets.reasonIcon,
                title: translateText(AppStrings.reportReasonText, context),
                textInputType: TextInputType.text,
                controller: context.read<ReportPostCubit>().reasonController,
                validatorMessage: translateText(AppStrings.reasonValidator, context),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                image: ImageAssets.rewriteIcon,
                title: translateText(AppStrings.detailsText, context),
                textInputType: TextInputType.text,
                minLine: 8,
                controller: context.read<ReportPostCubit>().detailsController,
                validatorMessage: translateText(AppStrings.detailsValidator, context),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  context.read<ReportPostCubit>().getImage();
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 6),
                      child: Row(
                        children: [
                          Expanded(
                              child: SvgPicture.asset(
                            ImageAssets.cameraIcon,
                            width: 20,
                            height: 20,
                            color: AppColors.primary,
                          )),
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                 Text(
                                  translateText(AppStrings.imagesText, context),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  "   (${translateText(AppStrings.optionalText, context)})",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.gray),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<ReportPostCubit, ReportPostState>(
                      builder: (context, state) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          decoration: DottedDecoration(
                            shape: Shape.box,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: context.read<ReportPostCubit>().image == null
                              ? Padding(
                                  padding: const EdgeInsets.all(55.0),
                                  child: SvgPicture.asset(
                                      ImageAssets.uploadPhotoIcon),
                                )
                              : Image.file(
                                  File(
                                    context.read<ReportPostCubit>().image!.path,
                                  ),
                                  width: 60,
                                  height: 50,
                                  fit: BoxFit.fitHeight,
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 120),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: translateText(AppStrings.sendBtn, context),
                  color: AppColors.primary,
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      if (postType == "ads") {
                        context.read<ReportPostCubit>().userId = id;
                        context.read<ReportPostCubit>().postType = postType;
                      } else {
                        context.read<ReportPostCubit>().projectId = id;
                        context.read<ReportPostCubit>().postType = postType;
                      }
                      context.read<ReportPostCubit>().postReportPost();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
