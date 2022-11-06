import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../add_project/presentation/cubit/add_project_cubit.dart';
import 'amenities_body_widget.dart';

class AmenitiesAddWidget extends StatelessWidget {
  const AmenitiesAddWidget(
      {Key? key, required this.isSelected, this.kind = 'null'})
      : super(key: key);
  final bool isSelected;
  final String kind;

  @override
  Widget build(BuildContext context) {
    print("kind");
    print(kind);
    return kind == 'addProject'
        ? BlocBuilder<AddProjectCubit, AddProjectState>(
            builder: (context, state) {
              if (state is AddProjectAmenitiesLoaded) {
                return AmenitiesBodyWidget(
                  kind: kind,
                  amenitiesFilterModel: state.amenitiesFilterModel,
                );
              } else if (state is AddProjectAmenitiesLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              } else if (state is AddProjectAmenitiesError) {
                return ErrorWidget(() {
                  context.read<AddProjectCubit>().getAllFilterAmenities();
                });
              }
              return context.read<AddProjectCubit>().amenitiesFilterModel !=
                      null
                  ? AmenitiesBodyWidget(
                      kind: kind,
                      amenitiesFilterModel:
                          context.read<AddProjectCubit>().amenitiesFilterModel!,
                    )
                  : Center(
                      child:
                          CircularProgressIndicator(color: AppColors.primary),
                    );
            },
          )
        : BlocBuilder<AddAdsCubit, AddAdsState>(
            builder: (context, state) {
              if (state is AddAmenitiesLoaded) {
                return AmenitiesBodyWidget(
                  kind: kind,
                  amenitiesFilterModel: state.amenitiesFilterModel,
                );
              } else if (state is AddAmenitiesLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              } else if (state is AddAmenitiesError) {
                return ErrorWidget(() {
                  context.read<AddAdsCubit>().getAllFilterAmenities();
                });
              }
              return context.read<AddAdsCubit>().amenitiesFilterModel != null
                  ? AmenitiesBodyWidget(
                      kind: kind,
                      amenitiesFilterModel:
                          context.read<AddAdsCubit>().amenitiesFilterModel!,
                    )
                  : Center(
                      child:
                          CircularProgressIndicator(color: AppColors.primary),
                    );
            },
          );
  }
}
