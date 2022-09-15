import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';

class OverViewWidget extends StatelessWidget {
  const OverViewWidget({Key? key, this.mainItemModel}) : super(key: key);
  final MainItem? mainItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translateText(AppStrings.overviewText, context),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            width: MediaQuery.of(context).size.width,
            child: Text(
              IsLanguage.isEnLanguage(context)
                  ? mainItemModel!.descriptionEn!
                  : (IsLanguage.isArLanguage(context)
                      ? mainItemModel!.descriptionAr!
                      : mainItemModel!.descriptionKu!),
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            ImageAssets.detailsMapImage,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 1.5, color: Colors.grey),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        translateText(AppStrings.viewInMapTextBtn, context),
                        style: TextStyle(color: AppColors.black),
                      ),
                    )),
              )),
            ],
          )
        ],
      ),
    );
  }
}
