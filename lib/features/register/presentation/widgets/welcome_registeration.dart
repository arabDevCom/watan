import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class WelcomeChoose extends StatefulWidget {
  const WelcomeChoose({Key? key}) : super(key: key);

  @override
  State<WelcomeChoose> createState() => _WelcomeChooseState();
}

class _WelcomeChooseState extends State<WelcomeChoose> {
  bool? choose1;
  bool? choose2;

  @override
  void initState() {
    choose1 = false;
    choose2 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                choose1 = true;
                choose2=true;
              });
            },
            child: SizedBox(
              width: null,
              height: 145,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: (choose1 == true&&choose2==true)
                        ? AppColors.primary
                        : AppColors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "User",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "He can buy, rent and offer his unit for sale or rent",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(ImageAssets.userRegisterImage),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          InkWell(
            onTap: () {
              setState(() {
                choose1 = true;
                choose2 = false;
              });
            },
            child: SizedBox(
              width: null,
              height: 145,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: (choose1 == true&&choose2==false)
                        ? AppColors.primary
                        : AppColors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Estate Office",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Can sell and rent more than one unit",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(ImageAssets.projectRegisterImage),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          InkWell(
            onTap: () {
              setState(() {
                choose1 = false;
                choose2 = true;
              });
            },
            child: SizedBox(
              width: null,
              height: 145,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: (choose2 == true&&choose1==false)
                        ? AppColors.primary
                        : AppColors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Company",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Can sell and rent more than one unit",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(ImageAssets.companyRegisterImage),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
