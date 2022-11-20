import 'dart:convert';

import 'package:elwatn/core/utils/translate_text_method.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';
import '../../../login/data/models/login_data_model.dart';
import '../../../login/presentation/screens/login.dart';
import '../../../project_details/presentation/screens/project_posts_screen.dart';
import '../../../report_post/presentation/screens/report_post_screen.dart';
import '../screens/user_posts_screen.dart';

class BottomWidget extends StatefulWidget {
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
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  LoginDataModel? loginDataModel;

  _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      LoginDataModel loginDataModel = LoginDataModel.fromJson(userMap);
      this.loginDataModel = loginDataModel;
      if (this.loginDataModel != null) {
        setState(() {});
      }
    }
  }
@override
  void initState() {
    super.initState();
    _getStoreUser();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                loginDataModel == null
                    ? Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "\n ${translateText(AppStrings.shouldLoginText, context)} ",
                  buttons: [
                    DialogButton(
                      onPressed: () => Navigator.pop(context),
                      color: AppColors.buttonBackground,
                      child:  Text(
                        translateText(AppStrings.cancelBtn, context),
                        style: TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    DialogButton(
                      onPressed: () =>
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          ),
                      color: AppColors.error,
                      child:  Text(
                        translateText(AppStrings.loginText, context),
                        style: TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ).show(): Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (widget.type == "ads") {
                        return ReportPostScreen(
                          postType: "ads",
                          id: widget.mainItemModel!.id.toString(),
                        );
                      } else {
                        return ReportPostScreen(
                          postType: "project",
                          id: widget.mainProjectItemModel!.id.toString(),
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
                      if (widget.type == "ads") {
                        return AllUserPostsScreen(
                          mainItemModel: widget.mainItemModel!,
                        );
                      } else {
                        return AllUserProjectsScreen(
                          mainProjectItemModel: widget.mainProjectItemModel!,
                        );
                      }
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  side: BorderSide.none, backgroundColor: AppColors.primary),
              child:  Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  translateText(AppStrings.viewMoreText, context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
