import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../../../details/presentation/screens/detales photo.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';
import '../screens/details_photo_project_screen.dart';

class ProjectLocationWidget extends StatelessWidget {
  const ProjectLocationWidget({Key? key, required this.mainProjectItemModel})
      : super(key: key);
  final MainProjectItem mainProjectItemModel;

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
                      ? mainProjectItemModel.titleEn ?? "No Title"
                      : (AppLocalizations.of(context)!.isArLocale
                          ? mainProjectItemModel.titleAr ?? "لا عنوان"
                          : mainProjectItemModel.titleKu ??
                              "هیچ ناونیشانێک نییە"),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    Text(
                      IsLanguage.isEnLanguage(context)
                          ? mainProjectItemModel.locationNameEn??""
                          : (IsLanguage.isArLanguage(context)
                              ? mainProjectItemModel.locationNameAr??""
                              : mainProjectItemModel.locationNameKu??""),
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
                    return DetailsPhotoProjectScreen(
                      initialPage: 3,
                      mainProjectItemModel: mainProjectItemModel,
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
