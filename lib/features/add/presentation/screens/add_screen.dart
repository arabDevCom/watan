import 'package:elwatn/core/utils/snackbar_method.dart';
import 'package:elwatn/core/widgets/show_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';
import '../cubit/add_ads_cubit.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/widgets/custom_button.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/translate_text_method.dart';
import '../../../../core/widgets/gray_line.dart';
import '../../../../core/widgets/select_city_location_widget.dart';
import '../../../../core/widgets/select_city_widget.dart';
import '../../../filter/presentation/widgets/bathroom.dart';
import '../../../filter/presentation/widgets/bedrooms.dart';
import '../../../filter/presentation/widgets/property_type.dart';
import '../widgets/amenities_widget.dart';
import '../widgets/connection_widget.dart';

import '../widgets/container_dots_pick_images.dart';
import '../widgets/container_dots_pick_videos.dart';
import '../widgets/furnished_widget.dart';
import '../widgets/price_widget.dart';
import '../widgets/property_details_widget.dart';
import '../widgets/select_your_location.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    Key? key,
    this.isUpdate = false,
    this.mainItemModel,
  }) : super(key: key);

  final bool isUpdate;
  final MainItem? mainItemModel;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if(!widget.isUpdate){
      context.read<AddAdsCubit>().btnText='';
    }
    if(context.read<AddAdsCubit>().btnText!='update'){
      context.read<AddAdsCubit>().clearData();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdsCubit, AddAdsState>(
      builder: (context, state) {
        AddAdsCubit addAdsCubit = context.read<AddAdsCubit>();
        if (state is AddAdsPostLoaded) {
          Future.delayed(const Duration(milliseconds: 500), () {
            snackBar("SuccessFully", context, color: AppColors.success);
          });
        }
        if (state is AddAdsPostError ||
            state is AddAdsPostErrorResponse ||
            state is AddAdsPostError) {
          Future.delayed(
            const Duration(milliseconds: 500),
            () {
              snackBar("Error", context, color: AppColors.error);
            },
          );
        }
        if (state is AddAdsPostLoading) {
          return const ShowLoadingIndicator();
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
                      length: 2,
                      initialIndex: widget.isUpdate
                          ? widget.mainItemModel!.status != 'rent'
                              ? 0
                              : 1
                          : 0,
                      child: Material(
                        color: AppColors.white,
                        child: TabBar(
                          indicatorColor: AppColors.primary,
                          tabs: [
                            Tab(
                              text: translateText(
                                  AppStrings.statusSaleText, context),
                            ),
                            Tab(
                              text: translateText(
                                  AppStrings.statusRentText, context),
                            ),
                          ],
                          labelColor: AppColors.white,
                          unselectedLabelColor: AppColors.black,
                          onTap: (index) {
                            if (index == 0) {
                              context.read<AddAdsCubit>().status = 'sale';
                            } else {
                              context.read<AddAdsCubit>().status = 'rent';
                            }
                          },
                          indicator: RectangularIndicator(
                            color: AppColors.primary,
                            bottomLeftRadius: 100,
                            bottomRightRadius: 100,
                            topLeftRadius: 100,
                            topRightRadius: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const SelectCityWidget(kind: "addAds"),
                  const SizedBox(height: 12),
                  const SelectCityLocation(kind: 'addAds'),
                  const GrayLine(),
                  const PropertyTypeWidget(kind: "addAds"),
                  const GrayLine(),
                  const PropertyDetailsWidget(),
                  const GrayLine(),
                  const FurnishedWidget(),
                  const GrayLine(),
                  const PriceAddWidget(title: "Price"),
                  const GrayLine(),
                  const PriceAddWidget(title: "Area"),
                  const GrayLine(),
                  const AmenitiesAddWidget(isSelected: true, kind: 'addAds'),
                  const GrayLine(),
                  const BedRoomsWidget(typeClass: 'add'),
                  const GrayLine(),
                  const ListNumbersWidget(
                    image: ImageAssets.bathGoldIcon,
                    title: "Bathroom",
                    kind: 'bathroom',
                  ),
                  const GrayLine(),
                  const ListNumbersWidget(
                    image: ImageAssets.kitchenIcon,
                    title: "Kitchen",
                    kind: 'kitchen',
                  ),
                  const GrayLine(),
                  const ListNumbersWidget(
                    image: ImageAssets.livingRoomIcon,
                    title: "Living Rooms",
                    kind: 'living',
                  ),
                  const GrayLine(),
                  const ListNumbersWidget(
                    image: ImageAssets.dinnerIcon,
                    title: "Dining Rooms",
                    kind: 'dining',
                  ),
                  const GrayLine(),
                  const SelectYourLocation(),
                  const GrayLine(),
                  PickImagesContainerWidget(
                      title: "Image", isUpdate: widget.isUpdate),
                  const GrayLine(),
                  const PickVideosContainerWidget(
                    title: "Video",
                    kind: 'addAds',
                  ),
                  const GrayLine(),
                  const ContactWidget(),
                  CustomButton(
                    text: context.read<AddAdsCubit>().btnText == 'update'
                        ? "Update"
                        : "Add Property",
                    color: AppColors.primary,
                    paddingHorizontal: 60,
                    onClick: () {
                      if (formKey.currentState!.validate()) {
                        if (addAdsCubit.cityId == 0) {
                          snackBar("Please Select Your City", context,
                              color: AppColors.primary);
                        } else if (addAdsCubit.locationId == 0) {
                          snackBar("Please Select Your Location", context,
                              color: AppColors.primary);
                        } else if (addAdsCubit.type == -1) {
                          snackBar("Please Select Your Property Type", context,
                              color: AppColors.primary);
                        } else if (addAdsCubit.currency == '') {
                          snackBar("Please Select Currency of Price ", context,
                              color: AppColors.primary);
                        } else if (addAdsCubit.bedroom == -1) {
                          snackBar("Please Select BedRoom Count ", context,
                              color: AppColors.primary);
                        } else if (addAdsCubit.kitchen == 0) {
                          snackBar("Please Select Kitchen Count ", context,
                              color: AppColors.primary);
                        } else if (addAdsCubit.bathroom == 0) {
                          snackBar("Please Select BathRoom Count ", context,
                              color: AppColors.primary);
                        } else if (addAdsCubit.livingRoom == 0) {
                          snackBar("Please Select LivingRoom Count ", context,
                              color: AppColors.primary);
                        } else if (addAdsCubit.diningRoom == 0) {
                          snackBar("Please Select DiningRoom Count ", context,
                              color: AppColors.primary);
                        } else if (addAdsCubit.image.isEmpty) {
                          snackBar("Please Select Your Image ", context,
                              color: AppColors.primary);
                        } else {
                          context.read<AddAdsCubit>().btnText == 'update'
                              ? context.read<AddAdsCubit>().addAdsPost()
                              : context.read<AddAdsCubit>().addAdsPost();

                          // context
                          //     .read<AddAdsCubit>()
                          //     .addAdsPost(loginModel.data!.accessToken!);
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
