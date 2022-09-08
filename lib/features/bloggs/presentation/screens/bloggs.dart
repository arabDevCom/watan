import 'package:elwatn/features/notification/presentation/widgets/bloggs_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class BloggsScreen extends StatelessWidget {
  const BloggsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Bloggs",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        actions: [Image.asset(ImageAssets.logoIcon)],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => const BloggsItem(),
                separatorBuilder: (context, index) => const SizedBox(height: 18),
                itemCount: 3),
          )
          // ...List.generate(10, (index) => const BloggsItem())
        ],
      ),
    );
  }
}
