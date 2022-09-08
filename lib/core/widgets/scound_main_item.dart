import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/widgets/three_icon_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../config/routes/app_routes.dart';

class SecondMainItemWidget extends StatelessWidget {
  const SecondMainItemWidget({Key? key,  this.isFavorite=false}) : super(key: key);

  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18)),
                      child: Image.asset(
                        ImageAssets.itemImage1,
                        fit: BoxFit.fill,
                        width: 120,
                        height: 120,
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        width: 40,
                        height: 19,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: const BorderRadius.only(
                                topRight:  Radius.circular(10))),
                        child: Center(
                          child: Text(
                            "SALE",
                            style: TextStyle(
                                color: AppColors.primary, fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "House Font Of Garden",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              isFavorite?Icons.favorite: Icons.favorite_border,
                              color:  isFavorite?AppColors.primary:AppColors.black,
                            ),
                          ],
                        ),
                        Text(
                          "House",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.location_on),
                            Text(
                              "erbil,32 park (sarbasti)",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        const ThreeIconsDetailsWidget(area: 250,bathrooms: 2,bedrooms: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 12, color: AppColors.black),
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: 'IQD',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
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
