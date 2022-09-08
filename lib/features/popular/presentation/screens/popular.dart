
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/banner_ads.dart';
import '../../../../core/widgets/scound_main_item.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({Key? key, required this.kind}) : super(key: key);
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
             BannerWidget(),
            const SizedBox(height: 12),
            const Divider(
              endIndent: 26,
              indent: 26,
            ),
            Text("30 Popular found",style: TextStyle(color: AppColors.primary),),
            const Divider(
              endIndent: 26,
              indent: 26,
            ),
            ...List.generate(30, (index) => const SecondMainItemWidget())
          ],
        ),
      ),
    );
  }
}
