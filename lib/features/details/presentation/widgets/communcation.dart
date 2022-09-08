import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';

class CommunicationWidget extends StatelessWidget {
  const CommunicationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              icon: SvgPicture.asset(ImageAssets.callIcon),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                  ),
                  side: BorderSide.none,
                  primary: AppColors.callButtonBackground),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text("Call"),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: ElevatedButton.icon(
              icon: SvgPicture.asset(ImageAssets.whatsappIcon),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                  ),
                  side: BorderSide.none,
                  primary: AppColors.whatsappButtonBackground),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text("Whats App"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
