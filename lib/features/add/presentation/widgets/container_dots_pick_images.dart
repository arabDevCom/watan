import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';

class PickImagesContainerWidget extends StatelessWidget {
  const PickImagesContainerWidget({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTileAllDetailsWidget(image: ImageAssets.cameraIcon, text: title,iconColor: AppColors.primary),
      Container(
        decoration: DottedDecoration(
          shape: Shape.box,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssets.addIcon),
              const SizedBox(width: 5),
              Text("Upload Property ${title}s",style: TextStyle(color: AppColors.gray,fontSize: 16),)
            ],),
        ),

      ),
    ],);
  }
}
