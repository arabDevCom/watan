import 'package:elwatn/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/list_tile.dart';

class ListTileProfileItem extends StatelessWidget {
  const ListTileProfileItem(
      {Key? key,
      required this.text,
      required this.image,
      required this.onClick})
      : super(key: key);

  final String text;
  final String image;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.scaffoldBackground),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: MyListTile(text: text, onClick: onClick, image: image),
      ),
    );
  }
}
