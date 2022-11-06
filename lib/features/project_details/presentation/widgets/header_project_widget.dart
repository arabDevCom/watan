import 'package:flutter/material.dart';

import '../../../../core/utils/convert_numbers_method.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../../../details/presentation/widgets/details_images_banner_widget.dart';
import '../../../details/presentation/widgets/icon_shape.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';
import '../screens/details_photo_project_screen.dart';

class ProjectHeaderWidget extends StatelessWidget {
  const ProjectHeaderWidget({Key? key, required this.mainProjectItemModel})
      : super(key: key);
  final bool isMap = true;
  final MainProjectItem mainProjectItemModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailsBannerWidget(
            isDotes: false, imagesBanner: mainProjectItemModel.images!),
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
                      }),
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
              mainProjectItemModel.images!.isNotEmpty
                  ? const Spacer()
                  : const SizedBox(width: 0),
              mainProjectItemModel.images!.isNotEmpty
                  ? IconShapeWidget(
                      text: IsLanguage.isEnLanguage(context)
                          ? mainProjectItemModel.images!.length.toString()
                          : replaceToArabicNumber(
                              mainProjectItemModel.images!.length.toString()),
                      icon: Icons.image,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPhotoProjectScreen(
                                initialPage: 0,
                                mainProjectItemModel: mainProjectItemModel,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              mainProjectItemModel.videos.isNotEmpty
                  ? const Spacer()
                  : const SizedBox(width: 0),
              mainProjectItemModel.videos.isNotEmpty
                  ? IconShapeWidget(
                      text: IsLanguage.isEnLanguage(context)
                          ? mainProjectItemModel.videos.length.toString()
                          : replaceToArabicNumber(
                              mainProjectItemModel.videos.length.toString()),
                      icon: Icons.video_camera_back,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPhotoProjectScreen(
                                initialPage: 1,
                                mainProjectItemModel: mainProjectItemModel,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              mainProjectItemModel.floorPlans!.isNotEmpty
                  ? const Spacer()
                  : const SizedBox(width: 0),
              mainProjectItemModel.floorPlans!.isNotEmpty
                  ? IconShapeWidget(
                      text: IsLanguage.isEnLanguage(context)
                          ? mainProjectItemModel.floorPlans!.length.toString()
                          : replaceToArabicNumber(mainProjectItemModel
                              .floorPlans!.length
                              .toString()),
                      icon: Icons.schema_outlined,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsPhotoProjectScreen(
                                initialPage: 2,
                                mainProjectItemModel: mainProjectItemModel,
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
