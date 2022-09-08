import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/widgets/list_tile.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/separator.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, required this.closeDrawer}) : super(key: key);
final VoidCallback closeDrawer;
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
                text: "Language",
                onClick: () =>
                    Navigator.of(context).pushNamed(Routes.languageRoute),
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.notificationIcon,
                text: "Notification",
                onClick: () =>
                    Navigator.of(context).pushNamed(Routes.notificationRoute),
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.bloggsIcon,
                text: "Bloggs",
                onClick: () =>
                    Navigator.of(context).pushNamed(Routes.bloggsRoute),
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.aboutUsIcon,
                text: "About Us",
                onClick: () {
                  Navigator.of(context).pushNamed(Routes.aboutUsRoute);
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.contactUsIcon,
                text: "Contact Us",
                onClick: () {
                  Navigator.of(context).pushNamed(Routes.contactUsScreenRoute);
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.rateIcon,
                text: "Rate App",
                onClick: () {
                  // Navigator.of(context).pushNamed(Routes.bloggsRoute);
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.privacyIcon,
                text: "Privacy",
                onClick: () {
                  // Navigator.of(context).pushNamed(Routes.bloggsRoute);
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.termsIcon,
                text: "Terms and Conditions",
                onClick: () {
                  Navigator.of(context).pushNamed(Routes.termsAndConditionsScreenRoute);
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.shareIcon,
                text: "Share App",
                onClick: () {
                  // Navigator.of(context).pushNamed(Routes.bloggsRoute);
                },
              ),
              MySeparator(height: 1, color: AppColors.gray),
              MyListTile(
                image: ImageAssets.logOutIcon,
                text: "Log Out",
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
