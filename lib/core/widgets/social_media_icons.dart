import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({Key? key, required this.isEnable}) : super(key: key);
final bool isEnable;
  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  double topRight = 10;
  double topLeft = 0;
  String hint = "Facebook";
  int controllerIndex = 0;
  TextEditingController facebookController = TextEditingController();
  TextEditingController instaController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController snapController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            DefaultTabController(
              length: 4,
              initialIndex: 0,
              child: Material(
                color: AppColors.transparent,
                child: TabBar(
                  indicatorColor: AppColors.transparent,
                  onTap: (index) {
                    if (index == 0) {
                      setState(() {
                        topRight = 10;
                        topLeft = 0;
                        hint = "FaceBook";
                        controllerIndex=index;
                      });
                    } else if (index == 1) {
                      setState(() {
                        topRight = 10;
                        topLeft = 10;
                        hint = "Instagram";
                        controllerIndex=index;
                      });
                    } else if (index == 2) {
                      setState(() {
                        topRight = 10;
                        topLeft = 10;
                        hint = "Twitter";
                        controllerIndex=index;
                      });
                    } else if (index == 3) {
                      setState(() {
                        topRight = 0;
                        topLeft = 10;
                        hint = "Snap Chat";
                        controllerIndex=index;
                      });
                    }
                  },
                  tabs: [
                    Tab(icon: SvgPicture.asset(ImageAssets.facebookIcon)),
                    Tab(icon: SvgPicture.asset(ImageAssets.instaIcon)),
                    Tab(icon: SvgPicture.asset(ImageAssets.twitterIcon)),
                    Tab(icon: SvgPicture.asset(ImageAssets.snapIcon)),
                  ],
                  indicator: RectangularIndicator(
                    color: AppColors.buttonBackground,
                    bottomLeftRadius: 0,
                    bottomRightRadius: 0,
                    topLeftRadius: 10,
                    topRightRadius: 10,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.buttonBackground,
                borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(10),
                    bottomRight: const Radius.circular(10),
                    topRight: Radius.circular(topRight),
                    topLeft: Radius.circular(topLeft)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enabled: widget.isEnable,
                  controller: controller(controllerIndex),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: hint,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      fillColor: AppColors.scaffoldBackground,
                      filled: true),
                  textAlign: TextAlign.left,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextEditingController controller(int index) {
    if (index == 0) {
      return facebookController;
    } else if (index == 1) {
      return instaController;
    } else if (index == 2) {
      return twitterController;
    } else {
      return snapController;
    }
  }
}
