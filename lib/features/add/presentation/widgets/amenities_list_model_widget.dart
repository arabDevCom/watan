import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../add_project/presentation/cubit/add_project_cubit.dart';
import '../../../filter/data/models/amenities_data_model.dart';

class AmenitiesListModelWidget extends StatefulWidget {
  const AmenitiesListModelWidget({
    Key? key,
    required this.amenitiesDatumModel,
    required this.index,
    required this.kind,
  }) : super(key: key);

  final AmenitiesDatumModel amenitiesDatumModel;
  final int index;
  final String kind;

  @override
  State<AmenitiesListModelWidget> createState() =>
      _AmenitiesListModelWidgetState();
}

class _AmenitiesListModelWidgetState extends State<AmenitiesListModelWidget> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.kind == 'addProject') {
      if (context
          .read<AddProjectCubit>()
          .amenitiesId
          .contains(widget.amenitiesDatumModel.id)) {
        isSelected = true;
      } else {
        isSelected = false;
      }
    } else if (widget.kind == 'addAds') {
      if (context
          .read<AddAdsCubit>()
          .amenitiesId
          .contains(widget.amenitiesDatumModel.id)) {
        isSelected = true;
      } else {
        isSelected = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSelected) {
          if (widget.kind == 'addProject') {
            context.read<AddProjectCubit>().amenitiesId.removeAt(
                  context.read<AddProjectCubit>().amenitiesId.indexWhere(
                        (element) => element == widget.amenitiesDatumModel.id!,
                      ),
                );
            setState(() {
              isSelected = false;
            });
          } else {
            context.read<AddAdsCubit>().amenitiesId.removeAt(
                  context.read<AddAdsCubit>().amenitiesId.indexWhere(
                        (element) => element == widget.amenitiesDatumModel.id!,
                      ),
                );
            setState(() {
              isSelected = false;
            });
          }
        } else {
          if (widget.kind == 'addProject') {
            context
                .read<AddProjectCubit>()
                .amenitiesId
                .add(widget.amenitiesDatumModel.id!);
            setState(() {
              isSelected = true;
            });
          } else {
            context
                .read<AddAdsCubit>()
                .amenitiesId
                .add(widget.amenitiesDatumModel.id!);
            setState(() {
              isSelected = true;
            });
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Container(
              width: 120,
              height: 106,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color: isSelected ? AppColors.primary : AppColors.gray,
                ),
              ),
              child: Center(
                child: ManageNetworkImage(
                  imageUrl: widget.amenitiesDatumModel.icon == null
                      ? "https://cdn-icons-png.flaticon.com/512/8546/8546452.png"
                      : widget.amenitiesDatumModel.icon!,
                  width: 70,
                  height: 70,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              IsLanguage.isEnLanguage(context)
                  ? widget.amenitiesDatumModel.nameEn!
                  : (IsLanguage.isArLanguage(context)
                      ? widget.amenitiesDatumModel.nameAr!
                      : widget.amenitiesDatumModel.nameKo!),
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? AppColors.primary : AppColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
