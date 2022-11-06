import 'package:flutter/material.dart';

import '../../../../core/widgets/scound_main_item.dart';
import '../../../../core/widgets/scound_main_project_item.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';

class ShowProjectListBodyWidget extends StatelessWidget {
  const ShowProjectListBodyWidget({Key? key, required this.mainProjectItemModel}) : super(key: key);

  final List<MainProjectItem> mainProjectItemModel;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      itemCount: mainProjectItemModel.length,
      itemBuilder: (context, position) {
        return SecondMainProjectItemWidget(
          isFavorite: true,
          mainProjectItemModel: mainProjectItemModel[position],
        );
      },
    );
  }
}
