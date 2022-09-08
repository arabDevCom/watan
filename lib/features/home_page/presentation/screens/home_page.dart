import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/widgets/custom_app_bar.dart';
import 'package:elwatn/features/home_page/presentation/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/banner_ads.dart';
import '../widgets/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        BannerWidget(),
        const CategoriesWidget(),
        const HomeModelWidget(kind: "add New"),
        const HomeModelWidget(kind: "popular",)
      ],
    );
  }
}
