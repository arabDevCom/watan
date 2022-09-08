import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "House Font Of Garden",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
         InkWell(
           onTap: (){},
           child: Image.asset(ImageAssets.mapImage,height: 48,width: 48,),)
        ],
      ),
    );
  }
}
