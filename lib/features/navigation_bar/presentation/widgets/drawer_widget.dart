import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:elwatn/core/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/helper/location_helper.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/separator.dart';
import '../../../app_settings/presentation/screens/app_settings.dart';
import '../../../language/presentation/cubit/locale_cubit.dart';
import '../../../login/data/models/login_data_model.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.closeDrawer, required this.loginDataModel}) : super(key: key);
  final VoidCallback closeDrawer;
  final LoginDataModel loginDataModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: closeDrawer,
                    )),
              ),
              Row(
                children: [
                  Expanded(
                      child: Image.asset(
                    ImageAssets.watanLogo,
                    fit: BoxFit.fill,
                  )),
                ],
              ),
              MyListTile(
                image: ImageAssets.languageIcon,
                text: translateText(AppStrings.languageTitle,context),
                onClick: () =>
                    Navigator.of(context).pushNamed(Routes.languageRoute),
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.notificationIcon,
                text: translateText(AppStrings.notificationText,context),
                onClick: () =>
                    Navigator.of(context).pushNamed(Routes.notificationRoute),
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.bloggsIcon,
                text: translateText(AppStrings.bloggsText,context),
                onClick: () =>
                    Navigator.of(context).pushNamed(Routes.bloggsRoute),
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.aboutUsIcon,
                text: translateText(AppStrings.aboutUsText,context),
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AppSettingsScreens(
                        kind: AppStrings.aboutUsText,
                      ),
                    ),
                  );
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.contactUsIcon,
                text: translateText(AppStrings.contactUsText,context),
                onClick: () {
                  Navigator.of(context).pushNamed(Routes.contactUsScreenRoute);
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.rateIcon,
                text: translateText(AppStrings.rateAppText,context),
                onClick: () {
                  // Navigator.of(context).pushNamed(Routes.bloggsRoute);
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.privacyIcon,
                text: translateText(AppStrings.privacyText,context),
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AppSettingsScreens(
                        kind: AppStrings.privacyText,
                      ),
                    ),
                  );
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.termsIcon,
                text: translateText(AppStrings.termsAndConditionsText,context),
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AppSettingsScreens(
                        kind: AppStrings.termsAndConditionsText,
                      ),
                    ),
                  );
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.shareIcon,
                text: translateText(AppStrings.shareAppText,context),
                onClick: () {
                  LocationHelper.getCurrantLocation().then((value) {
                  });
                  // Navigator.of(context).pushNamed(Routes.mapScreenRoute);
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
             loginDataModel.message!=null? MyListTile(
                image: ImageAssets.logOutIcon,
                text: translateText(AppStrings.logOutText,context),
                onClick: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  bool result = await prefs.remove('user');
                  if(result){
                    print('staaaaart');
                    Navigator.pushReplacementNamed(context,Routes.initialRoute);
                    context.read<LocaleCubit>();
                  }else{
                    print("يا دى النيله المنيله بسواد ");
                  }
                },
              ):MyListTile(
               image: ImageAssets.logOutIcon,
               text: translateText(AppStrings.loginText,context),
               onClick: () {
                 Navigator.of(context).pushNamed(Routes.loginScreenRoute);
               },
             ),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
