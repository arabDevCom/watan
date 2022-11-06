import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:elwatn/features/home_page/domain/entities/main_item_domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elwatn/core/widgets/error_widget.dart' as error_widget;

import '../../../../core/widgets/scound_main_item.dart';
import '../cubit/details_cubit.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({Key? key, required this.mainItemModel})
      : super(key: key);

  final MainItem mainItemModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is MorePostsDetailsLoading) {
          return SizedBox(
            height: 150,
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        } else if (state is MorePostsDetailsLoadError) {
          return error_widget.ErrorWidget(
            onPressed: () => context.read<DetailsCubit>().morePostsDetails(
                  mainItemModel.id.toString(),
                ),
          );
        } else {
          return context.read<DetailsCubit>().moreAds.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        translateText(AppStrings.recommendedText, context),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(
                      context.read<DetailsCubit>().moreAds.length,
                      (index) => SecondMainItemWidget(
                        mainItemModel:
                            context.read<DetailsCubit>().moreAds[index],
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
        }
      },
    );
  }
}
