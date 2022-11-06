import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';
import '../../../project_details/presentation/screens/project_posts_screen.dart';
import '../../../report_post/presentation/screens/report_post_screen.dart';
import '../screens/user_posts_screen.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
    this.mainItemModel,
    required this.type,
    required this.mainProjectItemModel,
  }) : super(key: key);
  final MainItem? mainItemModel;
  final String type;
  final MainProjectItem? mainProjectItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (type == "ads") {
                        return ReportPostScreen(
                          postType: "ads",
                          id: mainItemModel!.id.toString(),
                        );
                      } else {
                        print("type");
                        print(type);
                        return ReportPostScreen(
                          postType: "project",
                          id: mainProjectItemModel!.id.toString(),
                        );
                      }
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  side: BorderSide.none,
                  backgroundColor: AppColors.buttonBackground),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  translateText(AppStrings.reportThisText, context),
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (type == "ads") {
                        return AllUserPostsScreen(
                          mainItemModel: mainItemModel!,
                        );
                      } else {
                        return AllUserProjectsScreen(
                          mainProjectItemModel: mainProjectItemModel!,
                        );
                      }
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  side: BorderSide.none, backgroundColor: AppColors.primary),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  "View All",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
