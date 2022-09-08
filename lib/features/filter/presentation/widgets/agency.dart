import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets_manager.dart';
import 'dropdown_search.dart';

class AgencyWidget extends StatelessWidget {
  const AgencyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
          children: [
            SvgPicture.asset(
              ImageAssets.agencyIcon,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 10),
            const Text(
              "Agency",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 20),
      const DropdownSearchWidget(
        labelText: "SELECT LOCATION",
        icon: Icons.search,
        dropdownList: [
          "NAME 1",
          "NAME 2",
          "NAME 3",
          "NAME 4"
        ],
      ),
    ],);
  }
}
