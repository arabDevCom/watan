import 'package:elwatn/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/banner_ads.dart';
import '../../../../core/widgets/scound_main_item.dart';

class NewAdded extends StatelessWidget {
  const NewAdded({Key? key, required this.kind}) : super(key: key);
final String kind;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title:  Text(kind.toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             const BannerWidget(sliderData: []),
            const SizedBox(height: 12),
            const Divider(
              endIndent: 26,
              indent: 26,
            ),
             Text("20 New Added found",style: TextStyle(color: AppColors.primary),),
            const Divider(
              endIndent: 26,
              indent: 26,
            ),
            ...List.generate(20, (index) => const SecondMainItemWidget())
          ],
        ),
      ),
    );
  }
}
