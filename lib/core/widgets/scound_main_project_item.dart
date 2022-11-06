import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/widgets/three_icon_details.dart';
import 'package:elwatn/core/widgets/views.dart';
import 'package:elwatn/features/home_page/domain/entities/main_item_domain_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../config/locale/app_localizations.dart';
import '../../features/details/presentation/widgets/list_tile_all_details.dart';
import '../../features/home_page/domain/entities/main_project_item_domain_model.dart';
import '../../features/project_details/presentation/screens/project_details.dart';
import '../utils/app_strings.dart';
import '../utils/convert_numbers_method.dart';
import '../utils/is_language_methods.dart';
import 'network_image.dart';

class SecondMainProjectItemWidget extends StatelessWidget {
  const SecondMainProjectItemWidget(
      {Key? key, this.isFavorite = false, this.mainProjectItemModel})
      : super(key: key);

  final bool isFavorite;
  final MainProjectItem? mainProjectItemModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ProjectDetails(mainProjectItemModel: mainProjectItemModel!);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: mainProjectItemModel!.images!.isNotEmpty
                          ? ManageNetworkImage(
                              imageUrl:
                                  mainProjectItemModel!.images!.first.attachment!,
                              width: 120,
                              height: 160,
                              borderRadius: 12,
                            )
                          : Image.asset(
                              ImageAssets.watanLogo,
                              width: 120,
                              height: 120,
                            ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.isEnLocale
                                  ? mainProjectItemModel!.titleEn ?? "No Title"
                                  : (AppLocalizations.of(context)!.isArLocale
                                      ? mainProjectItemModel!.titleAr ?? "لا عنوان"
                                      : mainProjectItemModel!.titleKu ??
                                          "هیچ ناونیشانێک نییە"),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        //ToDo Categories Languages
                        Text(
                          mainProjectItemModel!.type ?? "no title",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on,size: 20,),
                            Text(
                              IsLanguage.isEnLanguage(context)
                                  ? mainProjectItemModel!.locationNameEn??"NO Location"
                                  : (IsLanguage.isArLanguage(context)
                                      ? mainProjectItemModel!.locationNameAr!
                                      : mainProjectItemModel!.locationNameKu!),
                              style: const TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 6),
                          child: Row(
                            children: [
                              Expanded(child: SvgPicture.asset(ImageAssets.clockIcon,width: 14,height: 14,color: Colors.black,)),

                              Expanded(flex: 8,child: Text("${AppLocalizations.of(context)!.translate(AppStrings.postedOnText)}"
                                  "  :  "
                                  "${mainProjectItemModel!.projectStatus}",textAlign: TextAlign.justify,style: TextStyle(fontSize: 14),))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 6),
                          child: Row(
                            children: [
                              Expanded(child: SvgPicture.asset(ImageAssets.dateIcon,width: 14,height: 14,color: Colors.black,)),

                              Expanded(flex: 8,child: Text("${AppLocalizations.of(context)!.translate(AppStrings.postedOnText)}"
                                  "  :  "
                                  "${IsLanguage.isEnLanguage(context) ? mainProjectItemModel!.createdAt.toString().substring(0, 10) : replaceToArabicDate(mainProjectItemModel!.createdAt.toString())}",textAlign: TextAlign.justify,style: TextStyle(fontSize: 14),))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .isEnLocale
                                          ? "${mainProjectItemModel!.minPrice} - ${mainProjectItemModel!.maxPrice}"

                                          : "${replaceToArabicNumber(mainProjectItemModel!.minPrice.toString())}"
                                          " - "
                                          "${replaceToArabicNumber(mainProjectItemModel!.maxPrice.toString())}",
                                      style: TextStyle(
                                          fontSize: 16, color: AppColors.black),
                                    ),
                                    //ToDo Currancy of price
                                    TextSpan(
                                      text:
                                          " USD",
                                          // "  ${AppLocalizations.of(context)!.isEnLocale ? mainProjectItemModel!.id! : "دولار"}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppColors.black),
                                    ),
                                  ],
                                ),
                              ),
                              ViewsWidget(views: mainProjectItemModel!.views.toString()),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
