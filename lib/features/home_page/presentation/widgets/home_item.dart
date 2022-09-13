import 'package:elwatn/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/convert_numbers_method.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../details/presentation/screens/details.dart';
import '../../domain/entities/main_item_domain_model.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({Key? key, required this.mainItem}) : super(key: key);
  final MainItem mainItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return DetailsScreen(mainItemModel: mainItem);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: AppColors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  mainItem.images!.isNotEmpty
                      ? ManageNetworkImage(
                          imageUrl: mainItem.images!.first.attachment!,
                          width: double.infinity,
                        )
                      : Image.asset(ImageAssets.watanLogo),
                  //ToDo Status  Language
                  Positioned(
                    top: 16,
                    left: 9,
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColors.white,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 4,
                    child: Container(
                      width: 52,
                      height: 33,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(18))),
                      child: Center(
                        child: Text(
                          mainItem.status!,
                          style:
                              TextStyle(color: AppColors.primary, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.isEnLocale
                              ? mainItem.titleEn ?? "No Title"
                              : (AppLocalizations.of(context)!.isArLocale
                                  ? mainItem.titleAr ?? "لا عنوان"
                                  : mainItem.titleKo ?? "هیچ ناونیشانێک نییە"),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        //ToDo Categories Name
                        Text(
                          mainItem.titleEn ?? "No Title",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.location_on),
                            //ToDo Location Name
                            Text(
                              "erbil,32 park (sarbasti)",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(ImageAssets.areaIcon),
                            //ToDo Area Num
                            Padding(
                              padding: const EdgeInsets.only(right: 8, left: 8),
                              child: Text(" ${mainItem.size}",
                                  style: const TextStyle(fontSize: 12)),
                            ),
                            SvgPicture.asset(ImageAssets.roomsIcon),
                            Padding(
                              padding: const EdgeInsets.only(right: 8, left: 8),
                              child: Text(
                                "${AppLocalizations.of(context)!.isEnLocale ? mainItem.bedroom ?? "0" : replaceToArabicNumber(mainItem.bedroom.toString())}",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            SvgPicture.asset(ImageAssets.bathIcon),
                            Text(
                              "  ${AppLocalizations.of(context)!.isEnLocale ? mainItem.bathRoom ?? "0" : replaceToArabicNumber(mainItem.bathRoom.toString())}",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    '${AppLocalizations.of(context)!.isEnLocale ? mainItem.price ?? "0" : replaceToArabicNumber(
                                        mainItem.price.toString(),
                                      )}',
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.black),
                              ),
                              TextSpan(
                                  text:
                                      "  ${AppLocalizations.of(context)!.isEnLocale ? mainItem.currency! : "دولار"}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: AppColors.black)),
                            ],
                          ),
                        ),
                        //ToDo Company Icon
                        Image.asset(
                          ImageAssets.companyLogo,
                          width: 36,
                          height: 28,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
