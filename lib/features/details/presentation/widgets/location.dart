import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';
import '../screens/detales photo.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key, this.mainItemModel}) : super(key: key);
  final MainItem? mainItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.isEnLocale
                      ? mainItemModel!.titleEn ?? "No Title"
                      : (AppLocalizations.of(context)!.isArLocale
                          ? mainItemModel!.titleAr ?? "لا عنوان"
                          : mainItemModel!.titleKu ?? "هیچ ناونیشانێک نییە"),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
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
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsPhotoScreen(
                      initialPage: 2,
                      mainItem: mainItemModel!,
                    );
                  },
                ),
              );
            },
            child: Image.asset(
              ImageAssets.mapImage,
              height: 48,
              width: 48,
            ),
          )
        ],
      ),
    );
  }
}
