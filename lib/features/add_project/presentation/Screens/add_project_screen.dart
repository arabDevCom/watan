import 'package:elwatn/core/utils/snackbar_method.dart';
import 'package:elwatn/core/widgets/custom_button.dart';
import 'package:elwatn/core/widgets/show_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elwatn/core/widgets/error_widget.dart' as error_widget;
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/gray_line.dart';
import '../../../../core/widgets/select_city_location_widget.dart';
import '../../../../core/widgets/select_city_widget.dart';
import '../../../add/presentation/widgets/amenities_widget.dart';
import '../../../add/presentation/widgets/connection_widget.dart';
import '../../../add/presentation/widgets/container_dots_pick_images.dart';
import '../../../add/presentation/widgets/container_dots_pick_videos.dart';
import '../../../add/presentation/widgets/property_details_widget.dart';
import '../../../add/presentation/widgets/select_your_location.dart';
import '../../../filter/presentation/widgets/property_type.dart';
import '../../../login/data/models/login_data_model.dart';
import '../cubit/add_project_cubit.dart';
import '../widgets/payment_planes_widget.dart';
import '../widgets/unit_detales_floor_planes_widget.dart';

class AddProjectScreen extends StatelessWidget {
  AddProjectScreen({Key? key, required this.loginModel}) : super(key: key);

  final LoginDataModel loginModel;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProjectCubit, AddProjectState>(
      builder: (context, state) {
        AddProjectCubit addProjectCubit = context.read<AddProjectCubit>();
        if (state is AddProjectPostLoaded) {
          Future.delayed(const Duration(milliseconds: 500), () {
            snackBar("SuccessFully", context, color: AppColors.success);
          });
        }
        if (state is AddProjectPostError ||
            state is AddProjectPostErrorResponse) {
          Future.delayed(const Duration(milliseconds: 500), () {
            snackBar("Error", context, color: AppColors.error);
          });
        }
        if (state is AddProjectPostLoading) {
          return const ShowLoadingIndicator();
        } else if (state is AddProjectPostError) {
          return error_widget.ErrorWidget(
            onPressed: () => context
                .read<AddProjectCubit>()
                .addProjectPost(loginModel.data!.accessToken!),
          );
        }
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Material(
                        color: AppColors.white,
                        child: TabBar(
                          indicatorColor: AppColors.primary,
                          tabs: const[
                            Tab(
                              text: 'New',
                            ),
                            Tab(
                              text: 'On Going',
                            ),
                            Tab(
                              text: 'Finished',
                            ),
                          ],
                          labelColor: AppColors.white,
                          unselectedLabelColor: AppColors.black,
                          onTap: (index) {
                            if (index == 0) {
                              context.read<AddProjectCubit>().statusProject = 'new';
                            } else if(index==1) {
                              context.read<AddProjectCubit>().statusProject = 'ongoing';
                            }else{
                              context.read<AddProjectCubit>().statusProject = 'finished';
                            }
                          },
                          indicator: RectangularIndicator(
                            color: AppColors.primary,
                            bottomLeftRadius: 10,
                            bottomRightRadius: 10,
                            topLeftRadius: 10,
                            topRightRadius: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SelectCityWidget(kind: "addProject"),
                  const SizedBox(height: 12),
                  const SelectCityLocation(kind: 'addProject'),
                  const GrayLine(),
                  const PropertyTypeWidget(kind: "addProject"),
                  const GrayLine(),
                  const PropertyDetailsWidget(kind: "addProject"),
                  const GrayLine(),
                  const PaymentPlanesWidget(),
                  const GrayLine(),
                  const UnitDetailsFloorPlanesWidget(),
                  const GrayLine(),
                  const AmenitiesAddWidget(
                      isSelected: true, kind: 'addProject'),
                  const GrayLine(),
                  const SelectYourLocation(),
                  const GrayLine(),
                  const PickImagesContainerWidget(
                      title: "Image", kind: 'addProject',isUpdate: false),
                  const GrayLine(),
                  const PickImagesContainerWidget(
                      title: "Floor Planes", kind: 'addProject',isUpdate: false),
                  const GrayLine(),
                  const PickVideosContainerWidget(
                      title: "Video", kind: 'addProject'),
                  const GrayLine(),
                  const ContactWidget(kind: 'addProject'),
                  CustomButton(
                    text: "Add Property",
                    color: AppColors.primary,
                    paddingHorizontal: 60,
                    onClick: () {
                      if (formKey.currentState!.validate()) {
                        if (addProjectCubit.cityId == 0) {
                          snackBar("Please Select Your City", context,
                              color: AppColors.primary);
                        } else if (addProjectCubit.locationId == 0) {
                          snackBar("Please Select Your Location", context,
                              color: AppColors.primary);
                        } else if (addProjectCubit.type == -1) {
                          snackBar("Please Select Your Property Type", context,
                              color: AppColors.primary);
                        } else if (addProjectCubit.images.isEmpty) {
                          snackBar("Please Select Your Image ", context,
                              color: AppColors.primary);
                        }else if (addProjectCubit.floorPlans.isEmpty) {
                          snackBar("Please Select Your Floor Plans ", context,
                              color: AppColors.primary);
                        }else if (addProjectCubit.unitPlanArea.isEmpty) {
                          snackBar("Please inter Some Units ", context,
                              color: AppColors.primary);
                        }else if (addProjectCubit.unitPlanArea.length<2) {
                          snackBar("Your Should Insert more units ", context,
                              color: AppColors.primary);
                        }else if (addProjectCubit.paymentPlanPresent.isEmpty) {
                          snackBar("Please inter Some Payment Plans ", context,
                              color: AppColors.primary);
                        }else if (addProjectCubit.paymentPlanPresent.length<2) {
                          snackBar("Your Should Insert more Payment Plans ", context,
                              color: AppColors.primary);
                        } else {
                          print("all is done");
                          // context.read<AddProjectCubit>().addProjectPost(loginModel.data!.accessToken!);
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// // context.read<AddAdsCubit>().translateText();
// print(
//     'furnished : ${context.read<AddAdsCubit>().furnished}');
// print('status : ${context.read<AddAdsCubit>().status}');
// print('currency : ${context.read<AddAdsCubit>().currency}');
// print(
//     'title : ${context.read<AddAdsCubit>().titleController.text}');
// print(
//     'desc : ${context.read<AddAdsCubit>().descController.text}');
// print(
//     'price : ${context.read<AddAdsCubit>().priceController.text}');
// print(
//     'area :${context.read<AddAdsCubit>().areaController.text}');
// print(
//     'name : ${context.read<AddAdsCubit>().nameController.text}');
// print(
//     'phone : ${context.read<AddAdsCubit>().phoneController.text}');
// print(
//     'whatsapp : ${context.read<AddAdsCubit>().whatsappController.text}');
// print('bathroom : ${context.read<AddAdsCubit>().bathroom}');
// print(
//     'livingRoom : ${context.read<AddAdsCubit>().livingRoom}');
// print(
//     'diningRoom : ${context.read<AddAdsCubit>().diningRoom}');
// print('kitchen : ${context.read<AddAdsCubit>().kitchen}');
// print('cityId : ${context.read<AddAdsCubit>().cityId}');
// print(
//     'locationId : ${context.read<AddAdsCubit>().locationId}');
// print('type : ${context.read<AddAdsCubit>().type}');
// print(
//     'amenitiesId : ${context.read<AddAdsCubit>().amenitiesId}');
// print('images : ${context.read<AddAdsCubit>().image}');
// print('----------------------------------------');
