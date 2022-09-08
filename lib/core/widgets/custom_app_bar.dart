import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/routes/app_routes.dart';
import '../utils/app_colors.dart';
import '../utils/assets_manager.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.openMyDrawer}) : super(key: key);

  final VoidCallback openMyDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        IconButton(
            onPressed: openMyDrawer,
            icon: SvgPicture.asset(
              ImageAssets.menuIcon,
              width: 21,
              height: 21,
            )),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.filterRoute);
          },
          child: Row(
            children: [
              Text(
                "Search",
                style:
                TextStyle(fontSize: 12, color: AppColors.black),
              ),
              const SizedBox(width: 5,),
              SvgPicture.asset(ImageAssets.filterIcon)
            ],
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Agency",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Projects",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Estates",
            style: TextStyle(fontSize: 12, color: AppColors.black),
          ),
        ),
        const Spacer(),
        Image.asset(ImageAssets.logoIcon),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
