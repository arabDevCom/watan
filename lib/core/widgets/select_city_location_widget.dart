import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/add_project/presentation/cubit/add_project_cubit.dart';
import '../../features/filter/presentation/cubit/filter_cubit.dart';
import '../../features/filter/presentation/widgets/dropdown_search_locations.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/is_language_methods.dart';
import '../utils/translate_text_method.dart';

class SelectCityLocation extends StatelessWidget {
  const SelectCityLocation({Key? key, required this.kind}) : super(key: key);

  final String kind;

  @override
  Widget build(BuildContext context) {
    List<String> getFilterCitiesLocationList() {
      if (IsLanguage.isEnLanguage(context)) {
        return context.read<FilterCubit>().citiesLocationEn;
      } else if (IsLanguage.isArLanguage(context)) {
        return context.read<FilterCubit>().citiesLocationAr;
      } else {
        return context.read<FilterCubit>().citiesLocationKu;
      }
    }

    List<String> getAddCitiesLocationList() {
      if (IsLanguage.isEnLanguage(context)) {
        return context.read<AddAdsCubit>().citiesLocationEn;
      } else if (IsLanguage.isArLanguage(context)) {
        return context.read<AddAdsCubit>().citiesLocationAr;
      } else {
        return context.read<AddAdsCubit>().citiesLocationKu;
      }
    }

    List<String> getAddProjectCitiesLocationList() {
      if (IsLanguage.isEnLanguage(context)) {
        return context.read<AddProjectCubit>().citiesLocationEn;
      } else if (IsLanguage.isArLanguage(context)) {
        return context.read<AddProjectCubit>().citiesLocationAr;
      } else {
        return context.read<AddProjectCubit>().citiesLocationKu;
      }
    }

    return kind == 'filter'
        ? BlocBuilder<FilterCubit, FilterState>(
            builder: (BuildContext context, state) {
              if (state is FilterCitiesLocationLoading) {
                return Stack(
                  children: [
                    DropdownSearchLocationWidget(
                      isEnable: context.read<FilterCubit>().isCitiesDropdown,
                      labelText:
                          translateText(AppStrings.selectLocationText, context),
                      icon: Icons.location_on,
                      dropdownList: getFilterCitiesLocationList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is FilterCitiesLocationLoaded) {
                return DropdownSearchLocationWidget(
                  isEnable:
                      context.read<FilterCubit>().isCitiesLocationsDropdown,
                  labelText:
                      translateText(AppStrings.selectLocationText, context),
                  icon: Icons.location_on,
                  dropdownList: getFilterCitiesLocationList(),
                );
              } else if (state is FilterCitiesLocationError) {
                return Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120,
                      child: DropdownSearchLocationWidget(
                        isEnable: context.read<FilterCubit>().isCitiesDropdown,
                        labelText: translateText(
                            AppStrings.selectLocationText, context),
                        icon: Icons.location_on,
                        dropdownList: getFilterCitiesLocationList(),
                      ),
                    ),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: IconButton(
                        onPressed: () {
                          context
                              .read<FilterCubit>()
                              .getAllLocationOfCitiesById(
                                context.read<FilterCubit>().cityId.toString(),
                              );
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return DropdownSearchLocationWidget(
                  isEnable:
                      context.read<FilterCubit>().isCitiesLocationsDropdown,
                  labelText:
                      translateText(AppStrings.selectLocationText, context),
                  icon: Icons.location_on,
                  dropdownList: getFilterCitiesLocationList(),
                );
              }
            },
          )
        : kind == 'addProject'
            ? BlocBuilder<AddProjectCubit, AddProjectState>(
                builder: (BuildContext context, state) {
                  if (state is AddProjectCitiesLocationLoading) {
                    return Stack(
                      children: [
                        DropdownSearchLocationWidget(
                          kind: "addProject",
                          isEnable:
                              context.read<AddProjectCubit>().isCitiesDropdown,
                          labelText: translateText(
                              AppStrings.selectLocationText, context),
                          icon: Icons.location_on,
                          dropdownList: getAddProjectCitiesLocationList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is AddProjectCitiesLocationLoaded) {
                    return DropdownSearchLocationWidget(
                      kind: "addProject",
                      isEnable: context
                          .read<AddProjectCubit>()
                          .isCitiesLocationsDropdown,
                      labelText:
                          translateText(AppStrings.selectLocationText, context),
                      icon: Icons.location_on,
                      dropdownList: getAddProjectCitiesLocationList(),
                    );
                  } else if (state is AddProjectCitiesLocationError) {
                    return Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          child: DropdownSearchLocationWidget(
                            kind: "addProject",
                            isEnable: context
                                .read<AddProjectCubit>()
                                .isCitiesDropdown,
                            labelText: translateText(
                                AppStrings.selectLocationText, context),
                            icon: Icons.location_on,
                            dropdownList: getAddProjectCitiesLocationList(),
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<AddProjectCubit>()
                                  .getAllLocationOfCitiesById(
                                    context
                                        .read<AddProjectCubit>()
                                        .cityId
                                        .toString(),
                                  );
                            },
                            icon: Icon(
                              Icons.refresh,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return DropdownSearchLocationWidget(
                      kind: "addProject",
                      isEnable: context
                          .read<AddProjectCubit>()
                          .isCitiesLocationsDropdown,
                      labelText:
                          translateText(AppStrings.selectLocationText, context),
                      icon: Icons.location_on,
                      dropdownList: getAddProjectCitiesLocationList(),
                    );
                  }
                },
              )
            : BlocBuilder<AddAdsCubit, AddAdsState>(
                builder: (BuildContext context, state) {
                  if (state is AddCitiesLocationLoading) {
                    return Stack(
                      children: [
                        DropdownSearchLocationWidget(
                          kind: "addAds",
                          isEnable:
                              context.read<AddAdsCubit>().isCitiesDropdown,
                          labelText: translateText(
                              AppStrings.selectLocationText, context),
                          icon: Icons.location_on,
                          dropdownList: getAddCitiesLocationList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is AddCitiesLocationLoaded) {
                    return DropdownSearchLocationWidget(
                      kind: "addAds",
                      isEnable:
                          context.read<AddAdsCubit>().isCitiesLocationsDropdown,
                      labelText:
                          translateText(AppStrings.selectLocationText, context),
                      icon: Icons.location_on,
                      dropdownList: getAddCitiesLocationList(),
                    );
                  } else if (state is AddCitiesLocationError) {
                    return Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          child: DropdownSearchLocationWidget(
                            kind: "addAds",
                            isEnable:
                                context.read<AddAdsCubit>().isCitiesDropdown,
                            labelText: translateText(
                                AppStrings.selectLocationText, context),
                            icon: Icons.location_on,
                            dropdownList: getAddCitiesLocationList(),
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<AddAdsCubit>()
                                  .getAllLocationOfCitiesById(
                                    context
                                        .read<AddAdsCubit>()
                                        .cityId
                                        .toString(),
                                  );
                            },
                            icon: Icon(
                              Icons.refresh,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return DropdownSearchLocationWidget(
                      kind: "addAds",
                      isEnable:
                          context.read<AddAdsCubit>().isCitiesLocationsDropdown,
                      labelText:
                          translateText(AppStrings.selectLocationText, context),
                      icon: Icons.location_on,
                      dropdownList: getAddCitiesLocationList(),
                    );
                  }
                },
              );
  }
}
