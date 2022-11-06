import 'package:flutter/material.dart';

import '../../../../core/widgets/scound_main_item.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';

class ShowListBodyWidget extends StatelessWidget {
  const ShowListBodyWidget({Key? key, required this.mainItemModel}) : super(key: key);

  final List<MainItem> mainItemModel;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      itemCount: mainItemModel.length,
      itemBuilder: (context, position) {
        return SecondMainItemWidget(
          isFavorite: true,
          mainItemModel: mainItemModel[position],
        );
      },
    );
  }
}
