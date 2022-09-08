import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/widgets/long_text.dart';
import 'package:elwatn/core/widgets/social_media_icons.dart';
import 'package:flutter/material.dart';

import '../../../details/presentation/widgets/communcation.dart';
import '../../../details/presentation/widgets/icon_shape.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';
import '../../../details/presentation/widgets/proparty.dart';

class AgencyProfileScreen extends StatelessWidget {
  const AgencyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(ImageAssets.agencyImage),
                  Positioned(
                    top: 8,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: IconShapeWidget(
                                text: "null",
                                icon: Icons.arrow_back_sharp,
                                onClick: () {
                                  Navigator.of(context).pop();
                                }),
                          ),
                        ),
                        Expanded(
                            child: IconShapeWidget(
                                text: "null", icon: Icons.edit, onClick: () {})),
                        Expanded(
                            child: IconShapeWidget(
                                text: "null", icon: Icons.share, onClick: () {})),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListTileAllDetailsWidget(
                image: ImageAssets.propertyIcon,
                text: "properties : 8",
              ),
              ListTileAllDetailsWidget(
                image: ImageAssets.speakIcon,
                text: "Kurdish , Arabic , English",
                iconColor: AppColors.black,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Divider(thickness: 2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(children: const[
                   Align(
                    alignment: Alignment.bottomLeft,
                    child:  Text("About"),),
                   SizedBox(height: 12),
                   LongText(
                      text:
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here"),

                ],),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Divider(thickness: 2),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(children: const[
                   Align(
                    alignment: Alignment.bottomLeft,
                    child:  Text("Social Media"),),
                   SizedBox(height: 12),
                   SocialMediaWidget(isEnable: false),
                ],),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Divider(thickness: 2),
              ),
              const PropertyWidget(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Divider(thickness: 2),
              ),
              const CommunicationWidget(),
              const Divider(thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}
