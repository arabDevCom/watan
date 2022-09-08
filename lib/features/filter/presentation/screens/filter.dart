import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/features/filter/presentation/widgets/agency.dart';
import 'package:elwatn/features/filter/presentation/widgets/area_range.dart';
import 'package:elwatn/features/filter/presentation/widgets/bathroom.dart';
import 'package:elwatn/features/filter/presentation/widgets/bedrooms.dart';
import 'package:elwatn/features/filter/presentation/widgets/the_bottom.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/dropdown_search.dart';
import '../widgets/price.dart';
import '../widgets/property_type.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          "Filter",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
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
              const PriceWidget(),
              const SizedBox(height: 6),
              const Divider(thickness: 2,),
              const BedRoomsWidget(),
              const SizedBox(height: 6),
              const Divider(thickness: 2,),
              const ListNumbersWidget(image: ImageAssets.bathGoldIcon,title: "Bathroom"),
              const SizedBox(height: 6),
              const Divider(thickness: 2,),
              const AreaRangeWidget(),
              const SizedBox(height: 6),
              const Divider(thickness: 2,),
              const AgencyWidget(),
              const SizedBox(height: 6),
              const Divider(thickness: 2,),
              const TheBottomWidget(),
              const SizedBox(height: 6),
              const Divider(thickness: 2,),
            ],
          ),
        ),
      ),
    );
  }
}

// CustomRadioButton(
//   elevation: 0,
//   radius: 10,
//   enableShape: true,
//   padding: 8,
//   height: 32,
//   margin: EdgeInsets.symmetric(horizontal: 10),
//   unSelectedBorderColor: AppColors.gray,
//   unSelectedColor: AppColors.white,
//   buttonLables: [
//     'Residential',
//     'Plot',
//     'Commercial',
//   ],
//   buttonValues: [
//     'Residential',
//     'Plot',
//     'Commercial',
//   ],
//   buttonTextStyle: ButtonTextStyle(
//       selectedColor: AppColors.primary,
//       unSelectedColor: Colors.black,
//       textStyle: TextStyle(fontSize: 12)),
//   radioButtonValue: (value) {
//     print(value);
//   },
//   selectedColor: AppColors.white,
// ),