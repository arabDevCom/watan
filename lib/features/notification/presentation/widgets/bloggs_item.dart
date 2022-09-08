import 'package:elwatn/config/routes/app_routes.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class BloggsItem extends StatelessWidget {
  const BloggsItem({Key? key, this.isTitle = true}) : super(key: key);
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.bloggsDetailsRoute);
        },
        child: SizedBox(
          height: 210,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  ImageAssets.bloggsImage,
                  fit: BoxFit.fill,
                )),
                isTitle ? const SizedBox(height: 5) : const SizedBox(height: 0),
                isTitle
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "var park project",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "10 Months",
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.grayLite),
                            )
                          ],
                        ),
                      )
                    : const SizedBox(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
