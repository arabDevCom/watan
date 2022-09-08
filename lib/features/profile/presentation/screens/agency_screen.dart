import 'package:elwatn/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/agency_item.dart';

class AgencyScreen extends StatelessWidget {
  const AgencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            "Agency",
            style: TextStyle(color: AppColors.black),
          ),
          iconTheme: IconThemeData(
            color: AppColors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                12,
                (index) => const AgencyItem(),
              ),
              const SizedBox(height: 25),
              CustomButton(
                paddingHorizontal:65 ,
                text: "Add Agency",
                color: AppColors.primary,
                onClick: () {
                  Navigator.pushNamed(context, Routes.newAndEditAgencyScreenRoute);
                },
              ),
              const SizedBox(height: 35),
            ],
          ),
        ));
  }
}
