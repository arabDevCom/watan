import 'package:elwatn/config/routes/app_routes.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/features/profile/presentation/widgets/list_tile_profile_item.dart';
import 'package:flutter/material.dart';

class BodyProfileWidget extends StatelessWidget {
  const BodyProfileWidget({Key? key, this.kind = "profile"}) : super(key: key);
  final String kind;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTileProfileItem(
                text: "My Adds",
                image: ImageAssets.adsGoldIcon,
                onClick: ()=> Navigator.of(context).pushNamed(Routes.adsRoute),
              ),
              ListTileProfileItem(
                text:kind=="company"?"Packages": "Soled Property",
                image: ImageAssets.soledGoldIcon,
                onClick: ()=> Navigator.of(context).pushNamed(Routes.soledStatesRoute),
              ),
              ListTileProfileItem(
                text: "Edit Profile",
                image: ImageAssets.editorIcon,
                onClick: () {},
              ),
              kind == "office"
                  ? ListTileProfileItem(
                      text: "Agency",
                      image: ImageAssets.agencyGoldIcon,
                      onClick: () {
                        Navigator.pushNamed(context, Routes.agencyScreenRoute);
                      },
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              ListTileProfileItem(
                text: "Delete Account",
                image: ImageAssets.deleteAccountIcon,
                onClick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
