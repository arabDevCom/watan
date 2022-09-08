import 'package:elwatn/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets_manager.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: AppColors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  ImageAssets.itemImage1,
                  width: double.infinity,
                ),
                Positioned(
                  top: 16,
                  left: 9,
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.white,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 4,
                  child: Container(
                    width: 52,
                    height: 33,
                    child: Center(
                      child: Text(
                        "SALE",
                        style:
                            TextStyle(color: AppColors.primary, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(18))),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "House Font Of Garden",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "House",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.location_on),
                          Text(
                            "erbil,32 park (sarbasti)",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(ImageAssets.areaIcon),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: const Text(" 250M",
                                style: TextStyle(fontSize: 12)),
                          ),
                          SvgPicture.asset(ImageAssets.roomsIcon),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: const Text(" 6",
                                style: TextStyle(fontSize: 12)),
                          ),
                          SvgPicture.asset(ImageAssets.bathIcon),
                          const Text(" 2", style: TextStyle(fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style:
                              TextStyle(fontSize: 12, color: AppColors.black),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'IQD',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' 250.000!'),
                          ],
                        ),
                      ),
                      Image.asset(
                        ImageAssets.companyLogo,
                        width: 36,
                        height: 28,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
