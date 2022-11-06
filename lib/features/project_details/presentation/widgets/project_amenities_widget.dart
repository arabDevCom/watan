import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';

class ProjectAmenitiesWidget extends StatelessWidget {
  const ProjectAmenitiesWidget({Key? key, required this.mainProjectItemModel}) : super(key: key);
  final MainProjectItem mainProjectItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translateText(AppStrings.amenitiesText, context),
          ),
          const SizedBox(height: 18),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  ...List.generate(
                    mainProjectItemModel.services!.length,
                        (index) => mainProjectItemModel.services![index].service!.id != null
                        ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 106,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.gray)),
                            child: Center(
                              child: ManageNetworkImage(
                                imageUrl: mainProjectItemModel.services![index]
                                    .service!.icon ==
                                    null
                                    ? "https://cdn-icons-png.flaticon.com/512/8546/8546452.png"
                                    : mainProjectItemModel
                                    .services![index].service!.icon!,
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            IsLanguage.isEnLanguage(context)
                                ? mainProjectItemModel
                                .services![index].service!.nameEn!
                                : (IsLanguage.isArLanguage(context)
                                ? mainProjectItemModel
                                .services![index].service!.nameAr!
                                : mainProjectItemModel
                                .services![index].service!.nameKo!),
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    )
                        : const SizedBox(width: 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
