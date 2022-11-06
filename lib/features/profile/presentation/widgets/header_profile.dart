import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../login/data/models/login_data_model.dart';

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget(
      {Key? key, required this.loginDataModel, this.isPackage = false})
      : super(key: key);
  final LoginDataModel loginDataModel;
  final bool isPackage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset(ImageAssets.backgroundProfileShapeImage),
            const SizedBox(height: 96),
          ],
        ),
        Positioned(
          bottom: 48,
          left: 0,
          right: 0,
          child: SizedBox(
            width: 96,
            height: 96,
            child: CircleAvatar(
              radius: 120,
              backgroundColor: AppColors.transparent,
              child: ManageNetworkImage(
                imageUrl: loginDataModel.data!.user!.image!,
                width: 96,
                height: 96,
                borderRadius: 96,
              ),
            ),
          ),
        ),
        !isPackage? Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Text(
            textAlign: TextAlign.center,
            loginDataModel.data!.user!.name!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ):const SizedBox(height: 0),
      ],
    );
  }
}
