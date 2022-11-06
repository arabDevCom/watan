import 'package:elwatn/core/widgets/scound_main_project_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elwatn/core/widgets/error_widget.dart' as error_widget;

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';
import '../cubit/project_details_cubit.dart';

class ProjectPropertyWidget extends StatelessWidget {
  const ProjectPropertyWidget({Key? key, required this.mainProjectItemModel})
      : super(key: key);
  final MainProjectItem mainProjectItemModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectDetailsCubit, ProjectDetailsState>(
      builder: (context, state) {
        if (state is ProjectMorePostsDetailsLoading) {
          return SizedBox(
            height: 150,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        } else if (state is ProjectMorePostsDetailsLoadError) {
          return error_widget.ErrorWidget(
            onPressed: () =>
                context.read<ProjectDetailsCubit>().moreProjectPostsDetails(
                      mainProjectItemModel.id.toString(),
                    ),
          );
        } else {}
        return context.read<ProjectDetailsCubit>().moreProject.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      translateText(AppStrings.recommendedText, context),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(
                    context.read<ProjectDetailsCubit>().moreProject.length,
                    (index) => SecondMainProjectItemWidget(
                      mainProjectItemModel: context
                          .read<ProjectDetailsCubit>()
                          .moreProject[index],
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: 150,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
              );
      },
    );
  }
}
