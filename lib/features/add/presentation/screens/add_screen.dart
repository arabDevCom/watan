import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/widgets/custom_button.dart';
import 'package:elwatn/core/widgets/custom_textfield.dart';
import 'package:elwatn/features/details/presentation/widgets/list_tile_all_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/gray_line.dart';
import '../../../filter/presentation/widgets/bathroom.dart';
import '../../../filter/presentation/widgets/bedrooms.dart';
import '../../../filter/presentation/widgets/dropdown_search.dart';
import '../../../filter/presentation/widgets/price.dart';
import '../../../filter/presentation/widgets/property_type.dart';
import '../widgets/connection_widget.dart';
import '../widgets/container_dots_pick_images.dart';
import '../widgets/furnished_widget.dart';
import '../widgets/price_widget.dart';
import '../widgets/property_details_widget.dart';
import '../widgets/radio_choose.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 18),
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
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 6),
            child:  DropdownSearchWidget(
              labelText: "Select City",
              icon: Icons.location_on,
              dropdownList: [
                "Cairo",
                "Sadat City",
                "Shpin EL Kom",
                "Italia (disabled)"
              ],
            ),
          ),
          const Padding(
             padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 6),
             child: DropdownSearchWidget(
              labelText: "SELECT LOCATION",
              icon: Icons.location_on,
              dropdownList: [
                "LOCATION 1",
                "LOCATION 2",
                "LOCATION 3",
                "LOCATION 4"
              ],
          ),
           ),
          const GrayLine(),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 6),
            child:  PropertyTypeWidget(),
          ),
           const GrayLine(),
          const PropertyDetailsWidget(),
          const GrayLine(),
          const FurnishedWidget(),
          const GrayLine(),
          const PriceAddWidget(title: "Price"),
          const GrayLine(),
          const PriceAddWidget(title: "Area"),
          const GrayLine(),
          const BedRoomsWidget(),
          const GrayLine(),
          const ListNumbersWidget(image: ImageAssets.bathGoldIcon,title: "Bathroom"),
          const GrayLine(),
          const ListNumbersWidget(image: ImageAssets.kitchenIcon,title: "Kitchen"),
          const GrayLine(),
          const ListNumbersWidget(image: ImageAssets.livingRoomIcon,title: "Living Rooms"),
          const GrayLine(),
          const ListNumbersWidget(image: ImageAssets.dinnerIcon,title: "Dining Rooms"),
          const GrayLine(),
          ListTileAllDetailsWidget(image: ImageAssets.locationGoldIcon, text: "Location",iconColor: AppColors.primary),
          Image.asset(ImageAssets.detailsMapImage),
          const GrayLine(),
          const PickImagesContainerWidget(title: "Image"),
          const GrayLine(),
          const PickImagesContainerWidget(title: "Video"),
          const GrayLine(),
          const ContactWidget(),
          CustomButton(text: "Add Property", color: AppColors.primary, onClick: (){},paddingHorizontal: 60,),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
