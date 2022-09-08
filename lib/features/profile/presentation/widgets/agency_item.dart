import 'package:elwatn/config/routes/app_routes.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';

class AgencyItem extends StatelessWidget {
  const AgencyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.agencyProfileScreenRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SizedBox(
                  height: 101,
                  width: 101,
                  child: CircleAvatar(
                    child: Image.asset(
                      ImageAssets.personImage,
                      width: 101,
                      height: 101,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            "Mustafa Ibrahim",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SvgPicture.asset(ImageAssets.deleteAccountIcon),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(ImageAssets.propertyIcon),
                            const SizedBox(width: 8),
                            const Text(
                              textAlign: TextAlign.center,
                              "Properties : 8",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: ElevatedButton.icon(
                                icon: SvgPicture.asset(ImageAssets.callIcon),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius: BorderRadius.circular(30)),
                                    backgroundColor:
                                        AppColors.callButtonBackground,
                                    side: BorderSide.none),
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  child: Text(
                                    "Call",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              flex: 5,
                              child: ElevatedButton.icon(
                                icon: SvgPicture.asset(ImageAssets.whatsappIcon),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius: BorderRadius.circular(30)),
                                    backgroundColor:
                                        AppColors.whatsappButtonBackground,
                                    side: BorderSide.none),
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  child: Text(
                                    "Whats App",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
