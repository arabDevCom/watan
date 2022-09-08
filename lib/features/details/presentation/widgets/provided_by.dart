import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class ProvidedByWidget extends StatelessWidget {
  const ProvidedByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text("Listing Provided by")),
          const SizedBox(height: 16),
          Image.asset(ImageAssets.companyLogo),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on),
              Text(
                "Erbile",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Agent :Mostafa Ibrahim",
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          const Text(
            "For sale : 8 | For rent : 3",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
