import 'package:elwatn/config/locale/app_localizations.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/features/details/presentation/widgets/list_tile_all_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/convert_numbers_method.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';

class AllDetails extends StatelessWidget {
  const AllDetails({Key? key, this.mainItemModel}) : super(key: key);
  final MainItem? mainItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              translateText(AppStrings.detailsText,context)),
          const SizedBox(height: 12),
          ListTileAllDetailsWidget(
            image: ImageAssets.dateIcon,
            text:
                "${AppLocalizations.of(context)!.translate(AppStrings.postedOnText)}"
                "  :  "
                "${IsLanguage.isEnLanguage(context) ? mainItemModel!.createdAt : replaceToArabicDate(mainItemModel!.createdAt.toString())}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.propertyIcon,
            text: "${translateText(AppStrings.propertyIdText, context)}"
                "  :  # "
                "${IsLanguage.isEnLanguage(context) ? mainItemModel!.id ?? "0" : replaceToArabicNumber(mainItemModel!.id.toString())}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.typeIcon,
            text:
                //ToDo Type Language
                "${translateText(AppStrings.typeText, context)}"
                "  :  "
                "${mainItemModel!.type}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.purposeIcon,
            text: "${translateText(AppStrings.purposeText, context)}"
                "  :  "
                "${mainItemModel!.status == "null" ? "nooo" : mainItemModel!.status == "sale" ? translateText(AppStrings.statusSaleText, context) : translateText(AppStrings.statusRentText, context)}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.cardIcon,
            text: "${translateText(AppStrings.priceText, context)}"
                "  :  "
                "${IsLanguage.isEnLanguage(context) ? mainItemModel!.price ?? "0" : replaceToArabicNumber(mainItemModel!.price.toString())}"
                " "
                "${IsLanguage.isEnLanguage(context) ? mainItemModel!.currency! : "دولار"}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.furnitureIcon,
            text: "${translateText(AppStrings.furnitureText, context)}"
                "  :  "
                "${IsLanguage.isEnLanguage(context) ? mainItemModel!.furniture ?? "0" : replaceToArabicNumber(mainItemModel!.furniture.toString())}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.areaIcon,
            text: "${translateText(AppStrings.areaText, context)}"
                "  :  "
                "${IsLanguage.isEnLanguage(context) ? mainItemModel!.size ?? "0" : replaceToArabicNumber(mainItemModel!.size.toString())}"
                "${IsLanguage.isEnLanguage(context) ? " M" : " م"}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.roomsIcon,
            text: "${translateText(AppStrings.bedroomText, context)}"
                "  :  "
                "${IsLanguage.isEnLanguage(context) ? mainItemModel!.bedroom ?? "0" : replaceToArabicNumber(mainItemModel!.bedroom.toString())}",
          ),
          ListTileAllDetailsWidget(
            image: ImageAssets.bathIcon,
            text: "${translateText(AppStrings.bathroomText, context)}"
                "  :  "
                "${IsLanguage.isEnLanguage(context) ? mainItemModel!.bathRoom ?? "0" : replaceToArabicNumber(mainItemModel!.bathRoom.toString())}",
          ),
        ],
      ),
    );
  }
}
