import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/icon_with_text_widget.dart';
import '../../../details/presentation/widgets/list_tile_all_details.dart';
import '../cubit/add_project_cubit.dart';

class UnitDetailsFloorPlanesWidget extends StatefulWidget {
  const UnitDetailsFloorPlanesWidget({Key? key}) : super(key: key);

  @override
  State<UnitDetailsFloorPlanesWidget> createState() =>
      _UnitDetailsFloorPlanesWidgetState();
}

class _UnitDetailsFloorPlanesWidgetState
    extends State<UnitDetailsFloorPlanesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProjectCubit, AddProjectState>(
      listener: (context, state) {
        if (state is ChangePaymentState) {
          // setState(() {});
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTileAllDetailsWidget(
                    image: ImageAssets.homeAddIcon,
                    text: "unit Details & Floor Planes",
                    iconColor: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 6),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: AppColors.primary),
                  ),
                  onPressed: () {
                    addDialog(context);
                  },
                  child: Icon(
                    Icons.add,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            context.read<AddProjectCubit>().unitPlanPrice.isEmpty
                ? const SizedBox()
                : Column(
                    children: [
                      ...List.generate(
                        context.read<AddProjectCubit>().unitPlanPrice.length,
                        (index) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconWithTextWidget(
                                    text: "Floor Plan",
                                    icon: ImageAssets.packagesIcon,
                                    iconColor: AppColors.black,
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconWithTextWidget(
                                          text:
                                              "${context.read<AddProjectCubit>().unitPlanArea[index]}",
                                          icon: ImageAssets.areaGoldIcon,
                                          iconColor: AppColors.black,
                                        ),
                                        IconWithTextWidget(
                                          text: context
                                              .read<AddProjectCubit>()
                                              .unitPlanBedroom[index],
                                          icon: ImageAssets.roomsIcon,
                                          iconColor: AppColors.black,
                                        ),
                                        IconWithTextWidget(
                                          text: context
                                              .read<AddProjectCubit>()
                                              .unitPlanBathroom[index],
                                          icon: ImageAssets.bathGoldIcon,
                                          iconColor: AppColors.black,
                                        ),
                                        IconWithTextWidget(
                                          text:
                                              "${context.read<AddProjectCubit>().unitPlanPrice[index]}",
                                          icon: ImageAssets.priceIcon,
                                          iconColor: AppColors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<AddProjectCubit>()
                                          .removeUnitPlan(index);
                                    },
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: AppColors.error,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
          ],
        );
      },
    );
  }

  Future<void> addDialog(context) {
    final formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        content: SizedBox(
          height: 550,
          width: MediaQuery.of(context).size.width - 50,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  imageColor: AppColors.primary,
                  controller: context.read<AddProjectCubit>().priceController,
                  image: ImageAssets.priceIcon,
                  title: translateText(AppStrings.priceText, context),
                  validatorMessage: "Please Inter The Price",
                  textInputType: TextInputType.number,
                ),
                CustomTextField(
                  imageColor: AppColors.primary,
                  controller: context.read<AddProjectCubit>().areaController,
                  image: ImageAssets.areaIcon,
                  title: translateText(AppStrings.areaText, context),
                  validatorMessage: "Please Inter The Area",
                  textInputType: TextInputType.number,
                ),
                CustomTextField(
                  imageColor: AppColors.primary,
                  controller: context.read<AddProjectCubit>().bedroomController,
                  image: ImageAssets.furnitureIcon,
                  title: translateText(AppStrings.bedroomText, context),
                  validatorMessage: "Please Inter The Bedroom",
                  textInputType: TextInputType.number,
                ),
                CustomTextField(
                  imageColor: AppColors.primary,
                  controller:
                      context.read<AddProjectCubit>().bathroomController,
                  image: ImageAssets.bathIcon,
                  title: translateText(AppStrings.bathroomText, context),
                  validatorMessage: "Please Inter The Bathroom",
                  textInputType: TextInputType.number,
                ),
                CustomButton(
                  text: "Add",
                  color: AppColors.primary,
                  paddingHorizontal: 60,
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AddProjectCubit>().addUnitPlan();
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
