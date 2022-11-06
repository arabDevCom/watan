import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/convert_numbers_method.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';

class ProjectAllDetailsWidget extends StatelessWidget {
  const ProjectAllDetailsWidget({Key? key, required this.mainProjectItemModel})
      : super(key: key);
  final MainProjectItem mainProjectItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(translateText(AppStrings.detailsText, context)),
          const SizedBox(height: 12),
          ListTileAllDetailsWidget(
            image: ImageAssets.dateIcon,
            text:
                "${AppLocalizations.of(context)!.translate(AppStrings.postedOnText)}"
                "  :  "
                "${IsLanguage.isEnLanguage(context) ? mainProjectItemModel.createdAt.toString().substring(0, 10) : replaceToArabicDate(mainProjectItemModel.createdAt.toString())}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.propertyIcon,
            text: "${translateText(AppStrings.propertyIdText, context)}"
                "  :  # "
                "${IsLanguage.isEnLanguage(context) ? mainProjectItemModel.id ?? "0" : replaceToArabicNumber(mainProjectItemModel.id.toString())}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.typeIcon,
            text:
                //ToDo Type Language
                "${translateText(AppStrings.typeText, context)}"
                "  :  "
                "${mainProjectItemModel.type}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.purposeIcon,
            text: "${translateText(AppStrings.purposeText, context)}"
                "  :  "
                "${mainProjectItemModel.projectStatus}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.cardIcon,
            text: "${translateText(AppStrings.priceText, context)}"
                "  :  "
                '${AppLocalizations.of(context)!.isEnLocale ? mainProjectItemModel.minPrice ?? "0" : replaceToArabicNumber(mainProjectItemModel.minPrice.toString())}'
                ' - '
                '${AppLocalizations.of(context)!.isEnLocale ? mainProjectItemModel.maxPrice ?? "0" : replaceToArabicNumber(mainProjectItemModel.maxPrice.toString())}'
                " ${AppLocalizations.of(context)!.isEnLocale ? mainProjectItemModel.currency : mainProjectItemModel.currency == "USD" ? "دولار" : "دينار"}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.areaIcon,
            text: "${translateText(AppStrings.areaText, context)}"
                "  :  "
                '${AppLocalizations.of(context)!.isEnLocale ? mainProjectItemModel.areaRange ?? 0 : replaceToArabicNumber(mainProjectItemModel.areaRange.toString())} M²',
          ),
        ],
      ),
    );
  }
}
