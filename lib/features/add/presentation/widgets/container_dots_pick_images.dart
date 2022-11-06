import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:elwatn/core/widgets/network_image.dart';
import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../add_project/presentation/cubit/add_project_cubit.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';

class PickImagesContainerWidget extends StatefulWidget {
  const PickImagesContainerWidget({
    Key? key,
    required this.title,
    this.kind = 'null',
    required this.isUpdate,
  }) : super(key: key);
  final String title;
  final String kind;
  final bool isUpdate;

  @override
  State<PickImagesContainerWidget> createState() =>
      _PickImagesContainerWidgetState();
}

class _PickImagesContainerWidgetState extends State<PickImagesContainerWidget> {
  final picker = ImagePicker();

  int indexCount = 0;

  @override
  void initState() {
    super.initState();
    if (widget.kind == 'addProject') {
      if (widget.title == 'Image') {
        context.read<AddProjectCubit>().image = [];
      } else {
        context.read<AddProjectCubit>().floorPlan = [];
      }
    } else {
      if (widget.isUpdate) {
        indexCount = context.read<AddAdsCubit>().image.length;
      } else {
        context.read<AddAdsCubit>().image = [];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileAllDetailsWidget(
          image: ImageAssets.cameraIcon,
          text: widget.title,
          iconColor: AppColors.primary,
        ),
        GestureDetector(
          onTap: () async {
            if (widget.kind == 'addProject') {
              if (context.read<AddProjectCubit>().image.isEmpty ||
                  context.read<AddProjectCubit>().floorPlan.isEmpty) {
                await picker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  setState(() {
                    if (widget.title == 'Image') {
                      context.read<AddProjectCubit>().image.add(value!.path);
                      context.read<AddProjectCubit>().convertImage(value.path);
                    } else {
                      context
                          .read<AddProjectCubit>()
                          .floorPlan
                          .add(value!.path);
                      context
                          .read<AddProjectCubit>()
                          .convertFloorPlan(value.path);
                    }
                  });
                });
              }
            } else {
              if (context.read<AddAdsCubit>().image.isEmpty) {
                await picker
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  setState(() {
                    context.read<AddAdsCubit>().image.add(value!.path);
                    context.read<AddAdsCubit>().convertImage(value.path);
                  });
                });
              }
            }
          },
          child: Container(
            decoration: DottedDecoration(
              shape: Shape.box,
              borderRadius: BorderRadius.circular(10),
            ),
            child: widget.kind != 'addProject'
                ? context.read<AddAdsCubit>().image.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(ImageAssets.addIcon),
                            const SizedBox(width: 5),
                            Text(
                              "Upload Property ${widget.title}s",
                              style: TextStyle(
                                color: AppColors.gray,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemBuilder: (context, index) => Center(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: context
                                              .read<AddAdsCubit>()
                                              .image[index]
                                              .contains(
                                                  'https://watan.motaweron.com')
                                          ? ManageNetworkImage(
                                              width: 110,
                                              height: 110,
                                              imageUrl: context
                                                  .read<AddAdsCubit>()
                                                  .image[index],
                                            )
                                          : Image.file(
                                              File(
                                                context
                                                    .read<AddAdsCubit>()
                                                    .image[index],
                                              ),
                                              width: 110,
                                              height: 110,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          if (widget.isUpdate) {
                                            if (context
                                                .read<AddAdsCubit>()
                                                .image[index]
                                                .contains(
                                                    'https://watan.motaweron.com')) {
                                              setState(
                                                () {
                                                  context
                                                      .read<AddAdsCubit>()
                                                      .removedImages
                                                      .add(
                                                        context
                                                            .read<AddAdsCubit>()
                                                            .image[index],
                                                      );
                                                  indexCount = indexCount - 1;
                                                  context
                                                      .read<AddAdsCubit>()
                                                      .image
                                                      .removeAt(index);
                                                },
                                              );
                                            } else {
                                              setState(
                                                () {
                                                  context
                                                      .read<AddAdsCubit>()
                                                      .images
                                                      .removeAt(
                                                        index - indexCount,
                                                      );
                                                  context
                                                      .read<AddAdsCubit>()
                                                      .image
                                                      .removeAt(index);
                                                },
                                              );
                                            }
                                          } else {
                                            setState(
                                              () {
                                                context
                                                    .read<AddAdsCubit>()
                                                    .images
                                                    .removeAt(index);
                                                context
                                                    .read<AddAdsCubit>()
                                                    .image
                                                    .removeAt(index);
                                              },
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: AppColors.primary,
                                          ),
                                          child: Icon(
                                            Icons.clear,
                                            size: 16,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              itemCount:
                                  context.read<AddAdsCubit>().image.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: InkWell(
                              onTap: () async {
                                await picker
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) {
                                  setState(() {
                                    context
                                        .read<AddAdsCubit>()
                                        .image
                                        .add(value!.path);
                                    print(value.path);
                                    context
                                        .read<AddAdsCubit>()
                                        .convertImage(value.path);
                                  });
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: AppColors.primary)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        ImageAssets.addIcon,
                                        width: 16,
                                        height: 16,
                                        color: AppColors.primary,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Upload",
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                : (widget.title == 'Image'
                        ? context.read<AddProjectCubit>().image.isEmpty
                        : context.read<AddProjectCubit>().floorPlan.isEmpty)
                    ? Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(ImageAssets.addIcon),
                            const SizedBox(width: 5),
                            Text(
                              "Upload Property ${widget.title}s",
                              style: TextStyle(
                                color: AppColors.gray,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemBuilder: (context, index) => Center(
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.file(
                                        File(
                                          widget.title == 'Image'
                                              ? context
                                                  .read<AddProjectCubit>()
                                                  .image[index]
                                              : context
                                                  .read<AddProjectCubit>()
                                                  .floorPlan[index],
                                        ),
                                        width: 110,
                                        height: 110,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (widget.title == 'Image') {
                                              context
                                                  .read<AddProjectCubit>()
                                                  .images
                                                  .removeAt(index);
                                              context
                                                  .read<AddProjectCubit>()
                                                  .image
                                                  .removeAt(index);
                                            } else {
                                              context
                                                  .read<AddProjectCubit>()
                                                  .floorPlans
                                                  .removeAt(index);
                                              context
                                                  .read<AddProjectCubit>()
                                                  .floorPlan
                                                  .removeAt(index);
                                            }
                                          });
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: AppColors.primary,
                                            ),
                                            child: Icon(
                                              Icons.clear,
                                              size: 16,
                                              color: AppColors.white,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              itemCount: widget.title == 'Image'
                                  ? context.read<AddProjectCubit>().image.length
                                  : context
                                      .read<AddProjectCubit>()
                                      .floorPlan
                                      .length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: InkWell(
                              onTap: () async {
                                await picker
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) {
                                  setState(() {
                                    if (widget.title == 'Image') {
                                      context
                                          .read<AddProjectCubit>()
                                          .image
                                          .add(value!.path);
                                      context
                                          .read<AddProjectCubit>()
                                          .convertImage(value.path);
                                    } else {
                                      context
                                          .read<AddProjectCubit>()
                                          .floorPlan
                                          .add(value!.path);
                                      context
                                          .read<AddProjectCubit>()
                                          .convertFloorPlan(value.path);
                                    }
                                  });
                                });
                              },
                              child: Container(
                                height: 80,
                                width: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: AppColors.primary)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        ImageAssets.addIcon,
                                        width: 16,
                                        height: 16,
                                        color: AppColors.primary,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Upload",
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
          ),
        ),
      ],
    );
  }
}
