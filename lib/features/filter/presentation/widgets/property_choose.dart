import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../add_project/presentation/cubit/add_project_cubit.dart';
import '../cubit/filter_cubit.dart';

class PropertyChooseWidget extends StatefulWidget {
  const PropertyChooseWidget({
    Key? key,
    required this.listTitle,
    required this.listImage,
    required this.propertyInt,
    required this.kind,
  }) : super(key: key);
  final List<String> listTitle;
  final List<String> listImage;
  final int propertyInt;
  final String kind;

  @override
  State<PropertyChooseWidget> createState() => _PropertyChooseWidgetState();
}

class _PropertyChooseWidgetState extends State<PropertyChooseWidget> {
  @override
  void initState() {
    super.initState();

    if (widget.kind == 'addAds') {
      if (context.read<AddAdsCubit>().btnText == 'update') {
        if (context.read<AddAdsCubit>().type == 1 ||
            context.read<AddAdsCubit>().type == 3 ||
            context.read<AddAdsCubit>().type == 5) {
          context.read<AddAdsCubit>().propertySelected = 0;
        } else {
          context.read<AddAdsCubit>().propertySelected = 1;
        }
      }
    } else if (widget.kind == 'addProject') {
      if (context.read<AddProjectCubit>().btnText == 'update') {
        if (context.read<AddProjectCubit>().type == 1 ||
            context.read<AddProjectCubit>().type == 3 ||
            context.read<AddProjectCubit>().type == 5) {
          context.read<AddProjectCubit>().propertySelected = 0;
        } else {
          context.read<AddProjectCubit>().propertySelected = 1;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            widget.listTitle.length,
            (index) => GestureDetector(
              onTap: () {
                if (widget.kind == "filter") {
                  setState(() {
                    context.read<FilterCubit>().propertySelected = index;
                  });
                  if (index == 0 && widget.propertyInt == 0) {
                    context.read<FilterCubit>().type = 1;
                  } else if (index == 1 && widget.propertyInt == 0) {
                    context.read<FilterCubit>().type = 2;
                  } else if (index == 0 && widget.propertyInt == 1) {
                    context.read<FilterCubit>().type = 3;
                  } else if (index == 1 && widget.propertyInt == 1) {
                    context.read<FilterCubit>().type = 4;
                  } else if (index == 0 && widget.propertyInt == 2) {
                    context.read<FilterCubit>().type = 5;
                  } else if (index == 1 && widget.propertyInt == 2) {
                    context.read<FilterCubit>().type = 6;
                  }
                } else if (widget.kind == "addProject") {
                  setState(() {
                    context.read<AddProjectCubit>().propertySelected = index;
                  });
                  if (index == 0 && widget.propertyInt == 0) {
                    context.read<AddProjectCubit>().type = 1;
                  } else if (index == 1 && widget.propertyInt == 0) {
                    context.read<AddProjectCubit>().type = 2;
                  } else if (index == 0 && widget.propertyInt == 1) {
                    context.read<AddProjectCubit>().type = 3;
                  } else if (index == 1 && widget.propertyInt == 1) {
                    context.read<AddProjectCubit>().type = 4;
                  } else if (index == 0 && widget.propertyInt == 2) {
                    context.read<AddProjectCubit>().type = 5;
                  } else if (index == 1 && widget.propertyInt == 2) {
                    context.read<AddProjectCubit>().type = 6;
                  }
                } else {
                  setState(() {
                    context.read<AddAdsCubit>().propertySelected = index;
                  });
                  if (index == 0 && widget.propertyInt == 0) {
                    context.read<AddAdsCubit>().type = 1;
                  } else if (index == 1 && widget.propertyInt == 0) {
                    context.read<AddAdsCubit>().type = 2;
                  } else if (index == 0 && widget.propertyInt == 1) {
                    context.read<AddAdsCubit>().type = 3;
                  } else if (index == 1 && widget.propertyInt == 1) {
                    context.read<AddAdsCubit>().type = 4;
                  } else if (index == 0 && widget.propertyInt == 2) {
                    context.read<AddAdsCubit>().type = 5;
                  } else if (index == 1 && widget.propertyInt == 2) {
                    context.read<AddAdsCubit>().type = 6;
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: (widget.kind == "filter"
                            ? context.read<FilterCubit>().propertySelected
                            : widget.kind == "addProject"
                                ? context
                                    .read<AddProjectCubit>()
                                    .propertySelected
                                : context
                                    .read<AddAdsCubit>()
                                    .propertySelected) ==
                        index
                    ? Container(
                        width: 160,
                        height: 80,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: SvgPicture.asset(
                                widget.listImage[index],
                                color: AppColors.primary,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                widget.listTitle[index],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: 160,
                        height: 80,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.gray),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: SvgPicture.asset(
                                widget.listImage[index],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                widget.listTitle[index],
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
