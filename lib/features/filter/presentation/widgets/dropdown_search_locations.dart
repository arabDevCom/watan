import 'package:dropdown_search/dropdown_search.dart';
import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../add_project/presentation/cubit/add_project_cubit.dart';
import '../cubit/filter_cubit.dart';

class DropdownSearchLocationWidget extends StatelessWidget {
  const DropdownSearchLocationWidget({
    Key? key,
    required this.dropdownList,
    required this.icon,
    required this.labelText,
    required this.isEnable,
    this.kind = 'null',
  }) : super(key: key);
  final List<String> dropdownList;
  final IconData icon;
  final String labelText;
  final bool isEnable;
  final String kind;

  @override
  Widget build(BuildContext context) {
    List<String> s = [];
    List<String> ids = [];
    for (var element in dropdownList) {
      s.add(element.split("/")[0]);
      ids.add(element.split("/")[1]);
    }
    return DropdownSearch<String>(
      selectedItem: kind == 'addAds'
          ? context.read<AddAdsCubit>().btnText == 'update'
              ? context.read<AddAdsCubit>().citiesLocationEn.isNotEmpty
                  ? ids.contains(
                          context.read<AddAdsCubit>().locationId.toString())
                      ? s[ids.indexOf(
                          context.read<AddAdsCubit>().locationId.toString())]
                      : null
                  : null
              : null
          : kind == "addProject"
              ? context.read<AddProjectCubit>().btnText == 'update'
                  ? context.read<AddProjectCubit>().citiesLocationEn.isNotEmpty
                      ? ids.contains(context
                              .read<AddProjectCubit>()
                              .locationId
                              .toString())
                          ? s[ids.indexOf(context
                              .read<AddProjectCubit>()
                              .locationId
                              .toString())]
                          : null
                      : null
                  : null
              : null,
      popupProps: const PopupProps.menu(
        showSelectedItems: true,
        fit: FlexFit.loose,
      ),
      enabled: isEnable,
      items: s,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          enabled: true,
          isCollapsed: false,
          hintText: labelText,
          iconColor: AppColors.primary,
          focusColor: AppColors.primary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(
            icon,
            color: AppColors.gray,
          ),
        ),
      ),
      autoValidateMode: AutovalidateMode.always,
      onChanged: (text) {
        if (labelText ==
            translateText(AppStrings.selectLocationText, context)) {
          for (var element in dropdownList) {
            if (element.contains(text!)) {
              if (kind == 'addAds') {
                context.read<AddAdsCubit>().locationId =
                    int.parse(element.split("/")[1]);
              } else if (kind == 'addProject') {
                context.read<AddProjectCubit>().locationId =
                    int.parse(element.split("/")[1]);
              } else {
                context.read<FilterCubit>().locationId =
                    int.parse(element.split("/")[1]);
              }
            }
          }
        }
      },
    );
  }
}
