import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/add/presentation/cubit/add_ads_cubit.dart';
import '../../features/add_project/presentation/cubit/add_project_cubit.dart';
import '../../features/filter/presentation/cubit/filter_cubit.dart';
import '../../features/filter/presentation/widgets/dropdown_search.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/is_language_methods.dart';
import '../utils/translate_text_method.dart';

class SelectCityWidget extends StatelessWidget {
  const SelectCityWidget({Key? key, required this.kind}) : super(key: key);
  final String kind;

  @override
  Widget build(BuildContext context) {
    List<String> getFilterCitiesList() {
      if (IsLanguage.isEnLanguage(context)) {
        return context.read<FilterCubit>().citiesEn;
      } else if (IsLanguage.isArLanguage(context)) {
        return context.read<FilterCubit>().citiesAr;
      } else {
        return context.read<FilterCubit>().citiesKu;
      }
    }

    List<String> getAddCitiesList() {
      if (IsLanguage.isEnLanguage(context)) {
        return context.read<AddAdsCubit>().citiesEn;
      } else if (IsLanguage.isArLanguage(context)) {
        return context.read<AddAdsCubit>().citiesAr;
      } else {
        return context.read<AddAdsCubit>().citiesKu;
      }
    }

    List<String> getAddProjectCitiesList() {
      if (IsLanguage.isEnLanguage(context)) {
        return context.read<AddProjectCubit>().citiesEn;
      } else if (IsLanguage.isArLanguage(context)) {
        return context.read<AddProjectCubit>().citiesAr;
      } else {
        return context.read<AddProjectCubit>().citiesKu;
      }
    }

    return kind == 'filter'
        ? BlocBuilder<FilterCubit, FilterState>(
            builder: (BuildContext context, state) {
              if (state is FilterCitiesLoading) {
                return Stack(
                  children: [
                    DropdownSearchWidget(
                      isEnable: context.read<FilterCubit>().isCitiesDropdown,
                      update: 'loading',
                      labelText:
                          translateText(AppStrings.selectCityText, context),
                      icon: Icons.location_on,
                      dropdownList: getFilterCitiesList(),
                    ),
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                );
              } else if (state is FilterCitiesLoaded) {
                return DropdownSearchWidget(
                  isEnable: context.read<FilterCubit>().isCitiesDropdown,
                  labelText: translateText(AppStrings.selectCityText, context),
                  icon: Icons.location_on,
                  dropdownList: getFilterCitiesList(),
                );
              } else if (state is FilterCitiesError) {
                return Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120,
                      child: DropdownSearchWidget(
                        isEnable: context.read<FilterCubit>().isCitiesDropdown,
                        labelText:
                            translateText(AppStrings.selectCityText, context),
                        icon: Icons.location_on,
                        dropdownList: getFilterCitiesList(),
                      ),
                    ),
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: IconButton(
                        onPressed: () {
                          context.read<FilterCubit>().getAllFilterCities();
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
                return DropdownSearchWidget(
                  isEnable: context.read<FilterCubit>().isCitiesDropdown,
                  labelText: translateText(AppStrings.selectCityText, context),
                  icon: Icons.location_on,
                  dropdownList: getFilterCitiesList(),
                );
              }
            },
          )
        : kind == 'addProject'
            ? BlocBuilder<AddProjectCubit, AddProjectState>(
                builder: (BuildContext context, state) {
                  print('666666666666666666');
                  if (state is AddProjectCitiesLoading) {
                    return Stack(
                      children: [
                        DropdownSearchWidget(
                          kind: "addProject",
                          isEnable:
                              context.read<AddProjectCubit>().isCitiesDropdown,
                          labelText:
                              translateText(AppStrings.selectCityText, context),
                          icon: Icons.location_on,
                          dropdownList: getAddProjectCitiesList(),
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    );
                  } else if (state is AddProjectCitiesLoaded) {
                    return DropdownSearchWidget(
                      kind: "addProject",
                      isEnable:
                          context.read<AddProjectCubit>().isCitiesDropdown,
                      labelText:
                          translateText(AppStrings.selectCityText, context),
                      icon: Icons.location_on,
                      dropdownList: getAddProjectCitiesList(),
                    );
                  } else if (state is AddProjectCitiesError) {
                    return Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          child: DropdownSearchWidget(
                            kind: "addProject",
                            isEnable: context
                                .read<AddProjectCubit>()
                                .isCitiesDropdown,
                            labelText: translateText(
                                AppStrings.selectCityText, context),
                            icon: Icons.location_on,
                            dropdownList: getAddProjectCitiesList(),
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<AddProjectCubit>()
                                  .getAllFilterCities();
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
                    return DropdownSearchWidget(
                      kind: "addProject",
                      isEnable:
                          context.read<AddProjectCubit>().isCitiesDropdown,
                      labelText:
                          translateText(AppStrings.selectCityText, context),
                      icon: Icons.location_on,
                      dropdownList: getAddProjectCitiesList(),
                    );
                  }
                },
              )
            : BlocBuilder<AddAdsCubit, AddAdsState>(
                builder: (BuildContext context, state) {
                  if (state is AddCitiesLoading) {
                    return Stack(
                      children: [
                        DropdownSearchWidget(
                          kind: "addAds",
                          isEnable:
                              context.read<AddAdsCubit>().isCitiesDropdown,
                          labelText:
                              translateText(AppStrings.selectCityText, context),
                          icon: Icons.location_on,
                          dropdownList: getAddCitiesList(),
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    );
                  } else if (state is AddCitiesLoaded) {
                    return DropdownSearchWidget(
                      kind: "addAds",
                      isEnable: context.read<AddAdsCubit>().isCitiesDropdown,
                      labelText:
                          translateText(AppStrings.selectCityText, context),
                      icon: Icons.location_on,
                      dropdownList: getAddCitiesList(),
                    );
                  } else if (state is AddCitiesError) {
                    return Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          child: DropdownSearchWidget(
                            kind: "addAds",
                            isEnable:
                                context.read<AddAdsCubit>().isCitiesDropdown,
                            labelText: translateText(
                                AppStrings.selectCityText, context),
                            icon: Icons.location_on,
                            dropdownList: getAddCitiesList(),
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: IconButton(
                            onPressed: () {
                              context.read<AddAdsCubit>().getAllFilterCities();
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
                    return DropdownSearchWidget(
                      kind: "addAds",
                      isEnable: context.read<AddAdsCubit>().isCitiesDropdown,
                      labelText:
                          translateText(AppStrings.selectCityText, context),
                      icon: Icons.location_on,
                      dropdownList: getAddCitiesList(),
                    );
                  }
                },
              );
  }
}
