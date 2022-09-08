import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {Key? key,
      required this.image,
      required this.text,
      required this.onClick})
      : super(key: key);
  final String image;
  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Expanded(
                  child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: image == ImageAssets.deleteAccountIcon
                    ? const SizedBox(width: 0)
                    : Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.primary,
                      ),
              )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Text(
                  text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: image == ImageAssets.deleteAccountIcon
                          ? AppColors.error
                          : AppColors.black),
                ),
              ),
              SvgPicture.asset(
                image,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
