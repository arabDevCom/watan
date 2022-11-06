import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/is_language_methods.dart';
import '../cubit/filter_cubit.dart';
import 'dropdown_search.dart';

class AgencyWidget extends StatelessWidget {
  const AgencyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> getAgentList() {
      if (IsLanguage.isEnLanguage(context)) {
        return context.read<FilterCubit>().agentNameEn;
      } else if (IsLanguage.isArLanguage(context)) {
        return context.read<FilterCubit>().agentNameAr;
      } else {
        return context.read<FilterCubit>().agentNameKu;
      }
    }
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              ImageAssets.agencyIcon,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 10),
            const Text(
              "Agency",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 20),
        BlocBuilder<FilterCubit, FilterState>(
          builder: (BuildContext context, state) {
            if (state is FilterAgentsLoading) {
              return Stack(
                children: [
                  DropdownSearchWidget(
                    isEnable:
                    context.read<FilterCubit>().isAgentDropdown,
                    labelText: "Select Agent",
                    icon: Icons.search,
                    dropdownList: getAgentList(),
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              );
            } else if (state is FilterAgentsLoaded) {
              return DropdownSearchWidget(
                isEnable: context.read<FilterCubit>().isAgentDropdown,
                labelText: "Select Agent",
                icon: Icons.search,
                dropdownList: getAgentList(),
              );
            } else if (state is FilterAgentsError) {
              return Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 120,
                    child: DropdownSearchWidget(
                      isEnable:
                      context.read<FilterCubit>().isAgentDropdown,
                      labelText: "Select Agent",
                      icon: Icons.search,
                      dropdownList: getAgentList(),
                    ),
                  ),
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: IconButton(
                      onPressed: () {
                        context.read<FilterCubit>().getAgentList();
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
                isEnable: context.read<FilterCubit>().isAgentDropdown,
                labelText: "Select Agent",
                icon: Icons.search,
                dropdownList: getAgentList(),
              );
            }
          },
        ),
      ],
    );
  }
}
