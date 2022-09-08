import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Amenities"),
          SizedBox(height: 18),
          Row(
            children: [
              const Spacer(),
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 106,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.gray)),
                    child: Center(
                      child: Image.asset(ImageAssets.balconyImage,
                          height: 46, width: 46),
                    ),
                  ),
                  SizedBox(height: 8),
                  const Text("Balcony",style: TextStyle(fontSize: 18),)
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 106,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.gray)),
                    child: Center(
                      child: Image.asset(ImageAssets.parkingImage,
                          height: 46, width: 46),
                    ),
                  ),
                  SizedBox(height: 8),
                  const Text("Parking Space",style: TextStyle(fontSize: 18))
                ],
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
