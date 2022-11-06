import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../add_project/presentation/cubit/add_project_cubit.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';
import '../cubit/add_ads_cubit.dart';

class PropertyDetailsWidget extends StatelessWidget {
  const PropertyDetailsWidget({Key? key, this.kind = 'null'}) : super(key: key);
  final String kind;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileAllDetailsWidget(
          image: ImageAssets.areaIcon,
          text: "Property Details",
          iconColor: AppColors.primary,
        ),
        const SizedBox(height: 6),
        CustomTextField(
          image: "null",
          title: "Title",
          controller: kind == 'addProject'
              ? context.read<AddProjectCubit>().titleController
              : context.read<AddAdsCubit>().titleController,
          textInputType: TextInputType.text,
          validatorMessage: "Please Inter The Title",
        ),
        CustomTextField(
          image: "null",
          title: "Description",
          textInputType: TextInputType.text,
          minLine: 5,
          controller: kind == 'addProject'
              ? context.read<AddProjectCubit>().descController
              : context.read<AddAdsCubit>().descController,
          validatorMessage: "Please Inter The Description",
        ),
      ],
    );
  }
}
