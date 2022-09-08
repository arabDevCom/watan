// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/long_text.dart';

class TermsAndConditionsScreen extends StatelessWidget {
   TermsAndConditionsScreen({Key? key}) : super(key: key);
  String text =
      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Terms and Conditions",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    ImageAssets.watanLogo,
                    width: 287,
                    height: 161,
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children:  <TextSpan>[
                  TextSpan(
                    text: 'WATAN',
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                  TextSpan(
                    text: ' helps you to',
                    style: TextStyle(color: AppColors.black,fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                ],
              ),
            ),
            LongText(text: text),
          ],
        ),
      ),
    );
  }
}
