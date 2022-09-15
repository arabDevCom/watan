import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/translate_text_method.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';

class ProvidedByWidget extends StatelessWidget {
  const ProvidedByWidget({Key? key, this.mainItemModel}) : super(key: key);
  final MainItem? mainItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: IsLanguage.isEnLanguage(context)
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Text(
              translateText(AppStrings.listingProvidedByText, context),
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(ImageAssets.companyLogo),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on),
              Text(
                IsLanguage.isEnLanguage(context)
                    ? mainItemModel!.locationNameEn!
                    : (IsLanguage.isArLanguage(context)
                        ? mainItemModel!.locationNameAr!
                        : mainItemModel!.locationNameKu!),
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "${translateText(AppStrings.agentText, context)}"
            " :  "
            "${IsLanguage.isEnLanguage(context) ? mainItemModel!.agent!.nameEn! : (IsLanguage.isArLanguage(context) ? mainItemModel!.agent!.nameAr! : mainItemModel!.agent!.nameKu!)}",
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          const Text(
            "For sale : 8 | For rent : 3",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
