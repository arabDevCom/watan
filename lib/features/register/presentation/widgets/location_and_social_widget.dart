import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/social_media_icons.dart';
import '../../../add/presentation/widgets/select_your_location.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';
import '../cubit/register_cubit.dart';

class LocationAndSocialWidget extends StatelessWidget {
  const LocationAndSocialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12,),
        const SelectYourLocation(kindOfSelected: 'register'),
        const SizedBox(height: 12,),
        const SizedBox(height: 20),
        SocialMediaWidget(
          facebookController: context.read<RegisterCubit>().facebookController,
          instaController: context.read<RegisterCubit>().instaController,
          snapController: context.read<RegisterCubit>().snapController,
          twitterController: context.read<RegisterCubit>().twitterController,
          isEnable: true,
          topRight: IsLanguage.isEnLanguage(context) ? 10 : 0,
          topLeft: IsLanguage.isEnLanguage(context) ? 0 : 10,
        ),
      ],
    );
  }
}
