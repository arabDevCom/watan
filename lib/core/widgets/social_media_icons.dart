import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/app_strings.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../utils/translate_text_method.dart';

// ignore: must_be_immutable
class SocialMediaWidget extends StatefulWidget {
  SocialMediaWidget(
      {Key? key,
      required this.isEnable,
      required this.topRight,
      required this.topLeft,
      required this.facebookController,
      required this.instaController,
      required this.twitterController,
      required this.snapController})
      : super(key: key);
  final bool isEnable;
  double topRight;
  double topLeft;
  final TextEditingController facebookController;
  final TextEditingController instaController;

  final TextEditingController twitterController;
  final TextEditingController snapController;

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  late String hint;

  int controllerIndex = 0;
  TextEditingController facebookController = TextEditingController();
  TextEditingController instaController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController snapController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    if(controllerIndex==0){
      hint = translateText(AppStrings.facebookText, context);
    }
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
                        IsLanguage.isEnLanguage(context)
                            ? widget.topRight = 10
                            : widget.topRight = 0;
                        IsLanguage.isEnLanguage(context)
                            ? widget.topLeft = 0
                            : widget.topLeft = 10;
                        hint = translateText(AppStrings.facebookText, context);
                        controllerIndex = index;
                      });
                    } else if (index == 1) {
                      setState(() {
                        widget.topRight = 10;
                        widget.topLeft = 10;
                        hint = translateText(AppStrings.instagramText, context);
                        controllerIndex = index;
                      });
                    } else if (index == 2) {
                      setState(() {
                        widget.topRight = 10;
                        widget.topLeft = 10;
                        hint = translateText(AppStrings.twitterText, context);
                        controllerIndex = index;
                      });
                    } else if (index == 3) {
                      setState(() {
                        IsLanguage.isEnLanguage(context)
                            ? widget.topRight = 0
                            : widget.topRight = 10;
                        IsLanguage.isEnLanguage(context)
                            ? widget.topLeft = 10
                            : widget.topLeft = 0;
                        hint = translateText(AppStrings.snapText, context);
                        controllerIndex = index;
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
                    topRight: Radius.circular(widget.topRight),
                    topLeft: Radius.circular(widget.topLeft)),
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
      facebookController = widget.facebookController;
      return facebookController;
    } else if (index == 1) {
      instaController = widget.instaController;
      return instaController;
    } else if (index == 2) {
      twitterController = widget.twitterController;
      return twitterController;
    } else {
      snapController = widget.snapController;
      return snapController;
    }
  }
}
