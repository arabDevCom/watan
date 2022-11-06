import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../add_project/presentation/cubit/add_project_cubit.dart';
import '../../../filter/data/models/amenities_data_model.dart';
import '../cubit/add_ads_cubit.dart';
import 'amenities_list_model_widget.dart';

class AmenitiesBodyWidget extends StatefulWidget {
  const AmenitiesBodyWidget(
      {Key? key, required this.amenitiesFilterModel, required this.kind})
      : super(key: key);

  final AmenitiesFilterModel amenitiesFilterModel;
  final String kind;

  @override
  State<AmenitiesBodyWidget> createState() => _AmenitiesBodyWidgetState();
}

class _AmenitiesBodyWidgetState extends State<AmenitiesBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.kind == 'addProject'
        ? BlocBuilder<AddProjectCubit, AddProjectState>(
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translateText(AppStrings.amenitiesText, context),
                    ),
                    const SizedBox(height: 18),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            ...List.generate(
                              widget.amenitiesFilterModel.data!.length,
                              (index) =>
                                  widget.amenitiesFilterModel.data![index].id !=
                                          null
                                      ? AmenitiesListModelWidget(
                                          kind: widget.kind,
                                          amenitiesDatumModel: widget
                                              .amenitiesFilterModel
                                              .data![index],
                                          index: index,
                                        )
                                      : const SizedBox(width: 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : BlocBuilder<AddAdsCubit, AddAdsState>(
            builder: (context, state) {
              print('tttttttttttttttttttt');
              print(widget.kind);
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translateText(AppStrings.amenitiesText, context),
                    ),
                    const SizedBox(height: 18),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            ...List.generate(
                              widget.amenitiesFilterModel.data!.length,
                              (index) =>
                                  widget.amenitiesFilterModel.data![index].id !=
                                          null
                                      ? AmenitiesListModelWidget(
                                          kind: widget.kind,
                                          amenitiesDatumModel: widget
                                              .amenitiesFilterModel
                                              .data![index],
                                          index: index,
                                        )
                                      : const SizedBox(width: 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
