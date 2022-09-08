import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset(ImageAssets.backgroundProfileShapeImage),
            const SizedBox(height: 96),

          ],
        ),
        Positioned(
          bottom: 48,
          left: 0,
          right: 0,
          child: SizedBox(
            width: 96,
            height: 96,
            child: CircleAvatar(
              radius: 96,
              child: Image.asset(
                ImageAssets.personImage,
                height: 96,
                width: 96,
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Text(
            textAlign: TextAlign.center,
            "Mustafa Ibrahim",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
