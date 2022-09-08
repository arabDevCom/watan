import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../filter/presentation/widgets/dropdown_search.dart';
import '../../../filter/presentation/widgets/property_type.dart';

class AddNewAds extends StatelessWidget {
  const AddNewAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Material(
              color: AppColors.white,
              child: TabBar(
                indicatorColor: AppColors.primary,
                tabs: const [
                  Tab(
                    text: "Buy",
                  ),
                  Tab(
                    text: "Rent",
                  ),
                ],
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.black,
                indicator: RectangularIndicator(
                  color: AppColors.primary,
                  bottomLeftRadius: 100,
                  bottomRightRadius: 100,
                  topLeftRadius: 100,
                  topRightRadius: 100,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        const DropdownSearchWidget(
          labelText: "Select City",
          icon: Icons.location_on,
          dropdownList: [
            "Cairo",
            "Sadat City",
            "Shpin EL Kom",
            "Italia (disabled)"
          ],
        ),
        const SizedBox(height: 12),
        const DropdownSearchWidget(
          labelText: "SELECT LOCATION",
          icon: Icons.location_on,
          dropdownList: [
            "LOCATION 1",
            "LOCATION 2",
            "LOCATION 3",
            "LOCATION 4"
          ],
        ),
        const SizedBox(height: 6),
        const Divider(thickness: 2,),
        const PropertyTypeWidget(),
        const SizedBox(height: 6),
        const Divider(thickness: 2,),
      ],
    );
  }
}
