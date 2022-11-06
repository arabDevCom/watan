import 'package:elwatn/core/utils/convert_numbers_method.dart';
import 'package:elwatn/core/utils/is_language_methods.dart';
import 'package:elwatn/features/details/presentation/screens/detales%20photo.dart';
import 'package:elwatn/features/details/presentation/widgets/icon_shape.dart';
import 'package:flutter/material.dart';

import '../../../home_page/domain/entities/main_item_domain_model.dart';
import 'details_images_banner_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.mainItem}) : super(key: key);
  final MainItem mainItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailsBannerWidget(isDotes: false, imagesBanner: mainItem.images!),
        Positioned(
          top: 8,
          left: 0,
          right: 0,
          child: Row(
            children: [
              //ToDo Icons Actions of fav & share
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: IconShapeWidget(
                    text: "null",
                    icon: Icons.arrow_back_sharp,
                    onClick: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Expanded(
                  child: IconShapeWidget(
                      text: "null", icon: Icons.share, onClick: () {})),
              Expanded(
                  child: IconShapeWidget(
                      text: "null",
                      icon: Icons.favorite_border,
                      onClick: () {})),
            ],
          ),
        ),
        Positioned(
          bottom: 8,
          left: 20,
          right: 20,
          child: Row(
            children: [
              mainItem.images!.isNotEmpty
                  ? const Spacer()
                  : const SizedBox(width: 0),
              mainItem.images!.isNotEmpty
                  ? IconShapeWidget(
                      text: IsLanguage.isEnLanguage(context)
                          ? mainItem.images!.length.toString()
                          : replaceToArabicNumber(
                              mainItem.images!.length.toString()),
                      icon: Icons.image,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPhotoScreen(
                                initialPage: 0,
                                mainItem: mainItem,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              mainItem.videos!.isNotEmpty
                  ? const Spacer()
                  : const SizedBox(width: 0),
              mainItem.videos!.isNotEmpty
                  ? IconShapeWidget(
                      text: IsLanguage.isEnLanguage(context)
                          ? mainItem.videos!.length.toString()
                          : replaceToArabicNumber(
                              mainItem.videos!.length.toString()),
                      icon: Icons.video_camera_back,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPhotoScreen(
                                initialPage: 1,
                                mainItem: mainItem,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              mainItem.floorPlans!.isNotEmpty
                  ? const Spacer()
                  : const SizedBox(width: 0),
              mainItem.floorPlans!.isNotEmpty
                  ? IconShapeWidget(
                      text: IsLanguage.isEnLanguage(context)
                          ? mainItem.floorPlans!.length.toString()
                          : replaceToArabicNumber(
                              mainItem.floorPlans!.length.toString()),
                      icon: Icons.schema_outlined,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPhotoScreen(
                                initialPage: 2,
                                mainItem: mainItem,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
