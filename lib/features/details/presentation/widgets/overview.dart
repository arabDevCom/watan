import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class OverViewWidget extends StatelessWidget {
  const OverViewWidget({Key? key}) : super(key: key);
  final String text =
      "Two Floor House For Sale, Located in Erbil in Kwestan district, The House Area is 200sqm, the Price is (\$230,000) (Negotiable) \nConsists of: \n4 Bedrooms \n1 Living Room \n1 Hall \n1 Kitchen \n2 Bathrooms \n2 Wc";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Overview"),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            width: MediaQuery.of(context).size.width,
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            ImageAssets.detailsMapImage,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: OutlinedButton(
                    style:OutlinedButton.styleFrom(
                      side: const BorderSide(width: 1.5, color: Colors.grey),
                    ) ,onPressed: (){}, child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text("View In Map",style: TextStyle(color: AppColors.black),),
                    )),
              )),
            ],
          )
        ],
      ),
    );
  }
}
