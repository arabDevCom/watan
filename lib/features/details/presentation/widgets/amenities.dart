import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/translate_text_method.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({Key? key, this.mainItemModel}) : super(key: key);
  final MainItem? mainItemModel;

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                ...List.generate(
                    mainItemModel!.services!.length,
                    (index) => Column(
                          children: [
                            Container(
                              width: 120,
                              height: 106,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColors.gray)),
                              child: Center(
                                child: ManageNetworkImage(
                                  imageUrl:
                                      mainItemModel!.services![index].icon!,
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              IsLanguage.isEnLanguage(context)
                                  ? mainItemModel!.services![index].nameEn!
                                  : (IsLanguage.isArLanguage(context)
                                      ? mainItemModel!.services![index].nameAr!
                                      : mainItemModel!.services![index].nameKo!),
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
