import 'package:elwatn/features/details/presentation/screens/detales%20photo.dart';
import 'package:elwatn/features/details/presentation/widgets/icon_shape.dart';
import 'package:flutter/material.dart';

import '../../../home_page/domain/entities/main_item_domain_model.dart';
import 'details_images_banner_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.itemImagesList})
      : super(key: key);

  final bool isImage = true;
  final bool isVideo = true;
  final bool isMap = true;
  final bool isSchema = true;
  final List<ItemImages> itemImagesList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailsBannerWidget(isDotes: false, imagesBanner: itemImagesList),
        Positioned(
          top: 8,
          left: 0,
          right: 0,
          child: Row(
            children: [
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
              isImage ? const Spacer() : const SizedBox(width: 0),
              isImage
                  ? IconShapeWidget(
                      text: "5",
                      icon: Icons.image,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const DetailsPhotoScreen(
                                initialPage: 0,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              isMap ? const Spacer() : const SizedBox(width: 0),
              isMap
                  ? IconShapeWidget(
                      text: "map",
                      icon: Icons.location_on,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const DetailsPhotoScreen(
                                initialPage: 1,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              isVideo ? const Spacer() : const SizedBox(width: 0),
              isVideo
                  ? IconShapeWidget(
                      text: "video",
                      icon: Icons.video_camera_back,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const DetailsPhotoScreen(
                                initialPage: 2,
                              );
                            },
                          ),
                        );
                      },
                    )
                  : const SizedBox(width: 0),
              isSchema ? const Spacer() : const SizedBox(width: 0),
              isSchema
                  ? IconShapeWidget(
                      text: "Scheme",
                      icon: Icons.schema_outlined,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const DetailsPhotoScreen(
                                initialPage: 3,
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
