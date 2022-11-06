import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/social_media_icons.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';

class LocationAndSocialWidget extends StatelessWidget {
  const LocationAndSocialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController facebookController = TextEditingController();
    TextEditingController instaController = TextEditingController();
    TextEditingController twitterController = TextEditingController();
    TextEditingController snapController = TextEditingController();
    return Column(
      children: [
        ListTileAllDetailsWidget(
          image: ImageAssets.locationGoldIcon,
          text: translateText(AppStrings.locationText, context),
          iconColor: AppColors.primary,
        ),
        Image.asset(ImageAssets.detailsMapImage),
        const SizedBox(height: 20),
        SocialMediaWidget(
          facebookController: facebookController,
          instaController: instaController,
          snapController: snapController,
          twitterController: twitterController,
          isEnable: true,
          topRight: IsLanguage.isEnLanguage(context) ? 10 : 0,
          topLeft: IsLanguage.isEnLanguage(context) ? 0 : 10,
        ),
      ],
    );
  }
}
