import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class DropdownSearchWidget extends StatelessWidget {
  const DropdownSearchWidget(
      {Key? key,
      required this.dropdownList,
      required this.icon,
      required this.labelText})
      : super(key: key);
  final List<String> dropdownList;
  final IconData icon;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSelectedItems: true,
        fit: FlexFit.loose,
      ),
      items: dropdownList,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          focusColor: AppColors.primary,
          filled: true,
          enabled: true,
          iconColor: AppColors.primary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(
            icon,
            color: AppColors.gray,
          ),
          labelText: labelText,
        ),
      ),
      onChanged: print,
    );
  }
}
