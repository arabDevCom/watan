import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_launch/flutter_launch.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';

class CommunicationWidget extends StatelessWidget {
  const CommunicationWidget({Key? key, this.mainItemModel}) : super(key: key);
  final MainItem? mainItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: SvgPicture.asset(ImageAssets.callIcon),
              onPressed: () async {
                // launch("tel://214324234");

                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: mainItemModel!.phone,
                );
                await launchUrl(launchUri);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: AppColors.callButtonBackground,
                  side: BorderSide.none),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  translateText(AppStrings.callText, context),
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: ElevatedButton.icon(
              icon: SvgPicture.asset(ImageAssets.whatsappIcon),
              onPressed: () async {
                // await FlutterLaunch.launchWhatsapp(phone: "5534992019999", message: "Hello").onError((error, stackTrace) => print(error)).;
                print("00001111000000");
                final Uri launchUri = Uri(
                  scheme: 'whatsapp/send',

                  path: "${mainItemModel!.whatsapp}",
                );

                var whatsappUrl =
                    "whatsapp://send?phone=${mainItemModel!.whatsapp}";
                await canLaunchUrl(launchUri)
                    ? launchUrl(launchUri)
                    : print(
                        "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(30)),
                  backgroundColor: AppColors.whatsappButtonBackground,
                  side: BorderSide.none),
              label: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  translateText(AppStrings.whatsAppText, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
