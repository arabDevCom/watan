import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class IconShapeWidget extends StatelessWidget {
  const IconShapeWidget({Key? key, required this.text, required this.icon, required this.onClick}) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          text=="null"?
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.opacityWhite),
            child: Icon(icon),
          ):Container(
            height: null,
            padding: EdgeInsets.symmetric(vertical: 2,horizontal: 0),
            width: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.opacityWhite),
            child: Row(
              children: [
                const Spacer(),
                Icon(icon),
                const Spacer(),
                Text(text,style:  const TextStyle(fontSize: 12),),
                const Spacer(),
              ],),
          ),
        ],
      ),
    );
  }
}
