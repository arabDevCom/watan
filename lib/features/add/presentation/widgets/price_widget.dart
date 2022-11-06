import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';
import '../../../filter/presentation/widgets/dropdown_search.dart';

class PriceAddWidget extends StatelessWidget {
  const PriceAddWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileAllDetailsWidget(
            image: title == "Price"
                ? ImageAssets.priceIcon
                : ImageAssets.areaGoldIcon,
            text: title,
            iconColor: AppColors.primary),
        const SizedBox(height: 6),
        title == "Price"
            ? Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      controller: context.read<AddAdsCubit>().priceController,
                      image: "null",
                      title: title == "Area" ? "$title in m" : title,
                      textInputType: TextInputType.number,
                      validatorMessage: title == 'Area'
                          ? "Please Inter The Area"
                          : "Please Inter The Price",
                    ),
                  ),
                  Expanded(
                    child: DropdownSearchWidget(
                      kind: "addPriceCurrency",
                      dropdownList: const ["USD/1", "IQD/2"],
                      isEnable: true,
                      labelText:
                          translateText(AppStrings.currencyText, context),
                      icon: Icons.abc,
                    ),
                  )
                ],
              )
            : CustomTextField(
                controller: context.read<AddAdsCubit>().areaController,
                image: "null",
                title: title == "Area" ? "$title in m" : title,
                textInputType: TextInputType.number,
                validatorMessage: title == 'Area'
                    ? "Please Inter The Area"
                    : "Please Inter The Price",
              ),
      ],
    );
  }
}
