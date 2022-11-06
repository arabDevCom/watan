import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';

class ProjectOverView extends StatefulWidget {
  const ProjectOverView({Key? key, required this.mainProjectItemModel}) : super(key: key);
  final MainProjectItem mainProjectItemModel;

  @override
  State<ProjectOverView> createState() => _ProjectOverViewState();
}

class _ProjectOverViewState extends State<ProjectOverView> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translateText(AppStrings.overviewText, context),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            width: MediaQuery.of(context).size.width,
            child: Text(
              IsLanguage.isEnLanguage(context)
                  ? widget.mainProjectItemModel.descriptionEn!
                  : (IsLanguage.isArLanguage(context)
                  ? widget.mainProjectItemModel.descriptionAr!
                  : widget.mainProjectItemModel.descriptionKu!),
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
