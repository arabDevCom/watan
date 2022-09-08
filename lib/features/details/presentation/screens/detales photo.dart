import 'package:flutter/material.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/title_scroll_navigation.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/scound_main_item.dart';
import '../../../notification/presentation/widgets/bloggs_item.dart';

class DetailsPhotoScreen extends StatelessWidget {
  const DetailsPhotoScreen({Key? key, this.initialPage = 0}) : super(key: key);
  final int initialPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Details",
          style: TextStyle(color: AppColors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: TitleScrollNavigation(
        initialPage: initialPage,
        showIdentifier: false,
        barStyle: TitleNavigationBarStyle(
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 16,
                vertical: 12),
            spaceBetween: MediaQuery.of(context).size.width / 8,
            activeColor: AppColors.primary,
            background: AppColors.buttonBackground),
        titles: const [
          "Image",
          "Videos",
          "Schema",
          "Map",
        ],
        pages: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("Found Images (5)"),
                ),
                ...List.generate(
                    5,
                    (index) => const BloggsItem(
                          isTitle: false,
                        ))
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("Found Video (3)"),
                ),
                ...List.generate(
                    3,
                    (index) => const BloggsItem(
                          isTitle: false,
                        ))
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8),
                  child:  Text("Found Schema (2)"),
                ),
                ...List.generate(
                    2,
                    (index) => const BloggsItem(
                          isTitle: false,
                        ))
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8),
                  child:  Text("Found Map (1)"),
                ),
                ...List.generate(
                    1,
                    (index) => const BloggsItem(
                          isTitle: false,
                        ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
