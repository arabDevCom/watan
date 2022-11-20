import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:elwatn/features/filter/presentation/widgets/property_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/translate_text_method.dart';
import '../../../add_project/presentation/cubit/add_project_cubit.dart';
import '../cubit/filter_cubit.dart';

class PropertyTypeWidget extends StatefulWidget {
  const PropertyTypeWidget({Key? key, required this.kind}) : super(key: key);
  final String kind;

  @override
  State<PropertyTypeWidget> createState() => _PropertyTypeWidgetState();
}

class _PropertyTypeWidgetState extends State<PropertyTypeWidget> {
  List<List<String>> images = [
    [(ImageAssets.apartmentIcon), (ImageAssets.villaIcon)],
    [(ImageAssets.industrialLandIcon), (ImageAssets.commercialPlotIcon)],
    [(ImageAssets.shopIcon), (ImageAssets.officeIcon)],
  ];

  int selected = 0;

  @override
  void initState() {
    super.initState();
    if (widget.kind == 'addAds') {
      if (context.read<AddAdsCubit>().btnText == 'update') {
        if (context.read<AddAdsCubit>().type == 1 ||
            context.read<AddAdsCubit>().type == 2) {
          selected = 0;
        } else if (context.read<AddAdsCubit>().type == 3 ||
            context.read<AddAdsCubit>().type == 4) {
          selected = 1;
        } else if (context.read<AddAdsCubit>().type == 5 ||
            context.read<AddAdsCubit>().type == 6) {
          selected = 2;
        }
      }
    } else if (widget.kind == 'addProject') {
      if (context.read<AddProjectCubit>().btnText == 'update') {
        if (context.read<AddProjectCubit>().type == 1 ||
            context.read<AddProjectCubit>().type == 2) {
          selected = 0;
        } else if (context.read<AddProjectCubit>().type == 3 ||
            context.read<AddProjectCubit>().type == 4) {
          selected = 1;
        } else if (context.read<AddProjectCubit>().type == 5 ||
            context.read<AddProjectCubit>().type == 6) {
          selected = 2;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      translateText(AppStrings.residentialText, context),
      translateText(AppStrings.plotText, context),
      translateText(AppStrings.commercialText, context),
    ];
    List<List<String>> titles = [
      [
        translateText(AppStrings.apartmentText, context),
        translateText(AppStrings.villaText, context),
      ],
      [
        translateText(AppStrings.industrialLandText, context),
        translateText(AppStrings.commercialPlotText, context),
      ],
      [
        translateText(AppStrings.shopText, context),
        translateText(AppStrings.officeText, context),
      ],
    ];
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              ImageAssets.propertyTypeIcon,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 10),
             Text(
              translateText(AppStrings.propertyTypeText, context),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              list.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index;
                    if (widget.kind == 'addProject') {
                      context.read<AddProjectCubit>().propertySelected = -1;
                    } else if (widget.kind == 'addAds') {
                      context.read<AddAdsCubit>().propertySelected = -1;
                    } else {
                      context.read<FilterCubit>().propertySelected = -1;
                    }
                  });
                },
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selected == index
                          ? AppColors.primary
                          : AppColors.gray,
                      width: selected == index ? 2 : 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      list[index],
                      style: TextStyle(
                        fontSize: 12,
                        color: selected == index ? AppColors.primary : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        PropertyChooseWidget(
          listTitle: titles[selected],
          listImage: images[selected],
          propertyInt: selected,
          kind: widget.kind,
        )
      ],
    );
  }
}
