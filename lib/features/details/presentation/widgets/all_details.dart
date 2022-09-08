import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/features/details/presentation/widgets/list_tile_all_details.dart';
import 'package:flutter/material.dart';

class AllDetails extends StatelessWidget {
  const AllDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Text("Details"),
          const SizedBox(height: 12),
          ListTileAllDetailsWidget(
              image: ImageAssets.dateIcon, text: "posted on : 22-8-2022"),
          ListTileAllDetailsWidget(
              image: ImageAssets.propertyIcon, text: "property iD : #1234"),
          ListTileAllDetailsWidget(
              image: ImageAssets.typeIcon, text: "type : house"),
          ListTileAllDetailsWidget(
              image: ImageAssets.purposeIcon, text: "purpose : for rent"),
          ListTileAllDetailsWidget(
              image: ImageAssets.cardIcon, text: "price : 250.000 IQD"),
          ListTileAllDetailsWidget(
              image: ImageAssets.furnitureIcon, text: "furniture : no"),
          ListTileAllDetailsWidget(
              image: ImageAssets.areaIcon, text: "area : 250 m"),
          ListTileAllDetailsWidget(
              image: ImageAssets.roomsIcon, text: "bedroom : 6"),
          ListTileAllDetailsWidget(
              image: ImageAssets.bathIcon, text: "bathroom : 2"),
        ],
      ),
    );
  }
}
