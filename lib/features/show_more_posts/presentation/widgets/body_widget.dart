import 'package:elwatn/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/convert_numbers_method.dart';
import '../../../../core/widgets/banner_ads.dart';
import '../../../../core/widgets/scound_main_item.dart';
import '../../../home_page/data/models/slider_data_model.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget(
      {Key? key,
      required this.showMoreList,
      required this.myContext,
      required this.sliderList})
      : super(key: key);
  final List<MainItem> showMoreList;
  final BuildContext myContext;
  final List<DatumModel> sliderList;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        children: [
          BannerWidget(sliderData: sliderList),
          const SizedBox(height: 12),
          const Divider(
            endIndent: 26,
            indent: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.isEnLocale
                    ? showMoreList.length.toString()
                    : replaceToArabicNumber(showMoreList.length.toString()),
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.error),
              ),
              Text(
                "   ${AppLocalizations.of(context)!.translate(AppStrings.newAddedFoundText)}",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
          const Divider(
            endIndent: 26,
            indent: 26,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: showMoreList.length,
            itemBuilder: (context, position) {
              return SecondMainItemWidget(
                isFavorite: true,
                mainItemModel: showMoreList[position],
              );
            },
          ),
        ],
      ),
    );
  }
}
