import 'package:elwatn/core/helper/location_helper.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/core/utils/toast_message_method.dart';
import 'package:elwatn/core/widgets/custom_button.dart';
import 'package:elwatn/features/add/presentation/cubit/add_ads_cubit.dart';
import 'package:elwatn/features/add_project/presentation/cubit/add_project_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../register/presentation/cubit/register_cubit.dart';

class SelectMapLocationScreen extends StatefulWidget {
  const SelectMapLocationScreen({Key? key, required this.kindOfSelected})
      : super(key: key);

  final String kindOfSelected;

  @override
  State<SelectMapLocationScreen> createState() =>
      _SelectMapLocationScreenState();
}

class _SelectMapLocationScreenState extends State<SelectMapLocationScreen> {
  MapController? controller;
  late GlobalKey<ScaffoldState> scaffoldKey;
  ValueNotifier<bool> showFab = ValueNotifier(true);
  ValueNotifier<GeoPoint?> lastGeoPoint = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    LocationHelper.getCurrantLocation().then((value) {
      setState(() {
        controller = MapController(
          initMapWithUserPosition: false,
          initPosition: GeoPoint(
            latitude: value.latitude,
            longitude: value.longitude,
          ),
        );
        scaffoldKey = GlobalKey<ScaffoldState>();
        controller!.listenerMapSingleTapping.addListener(() async {
          if (controller!.listenerMapSingleTapping.value != null) {
            print(
                " Current Location ${controller!.listenerMapSingleTapping.value}");
            print(
                " Current latitude ${controller!.listenerMapSingleTapping.value!.latitude}");
            print(
                " Current longitude ${controller!.listenerMapSingleTapping.value!.longitude}");

            if (lastGeoPoint.value != null) {
              controller!.changeLocationMarker(
                oldLocation: lastGeoPoint.value!,
                newLocation: controller!.listenerMapSingleTapping.value!,
              );
            } else {
              await controller!.addMarker(
                controller!.listenerMapSingleTapping.value!,
                markerIcon: MarkerIcon(
                  assetMarker: AssetMarker(
                      image: AssetImage(
                        ImageAssets.markerImage,
                      ),
                      scaleAssetImage: 2),
                ),
              );
            }
            lastGeoPoint.value = controller!.listenerMapSingleTapping.value;
          }
        });
      });
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller != null
        ? Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: OSMFlutter(
                controller: controller!,
                trackMyPosition: false,
                androidHotReloadSupport: true,
                mapIsLoading: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                initZoom: 8,
                minZoomLevel: 3,
                maxZoomLevel: 18,
                stepZoom: 1.0,
                showContributorBadgeForOSM: true,
                showDefaultInfoWindow: true,
              ),
            ),
            floatingActionButton: CustomButton(
              text: 'Select This Location',
              color: AppColors.primary,
              onClick: () {
                print('---------------------------------');
                if (controller!.listenerMapSingleTapping.value != null) {
                  if (widget.kindOfSelected == 'addAds') {
                    context.read<AddAdsCubit>().latitude =
                        controller!.listenerMapSingleTapping.value!.latitude;
                    context.read<AddAdsCubit>().longitude =
                        controller!.listenerMapSingleTapping.value!.longitude;
                    Future.delayed(Duration(milliseconds: 250), () {
                      Navigator.pop(context);
                    });
                  }else if(widget.kindOfSelected=='register'){
                    context.read<RegisterCubit>().latitude =
                        controller!.listenerMapSingleTapping.value!.latitude;
                    context.read<RegisterCubit>().longitude =
                        controller!.listenerMapSingleTapping.value!.longitude;
                    Future.delayed(Duration(milliseconds: 250), () {
                      Navigator.pop(context);
                    });
                  } else {
                    context.read<AddProjectCubit>().latitude =
                        controller!.listenerMapSingleTapping.value!.latitude;
                    context.read<AddProjectCubit>().longitude =
                        controller!.listenerMapSingleTapping.value!.longitude;
                    Future.delayed(Duration(milliseconds: 250), () {
                      Navigator.pop(context);
                    });
                  }

                  print(
                      " Current Location ${controller!.listenerMapSingleTapping.value}");
                  print(
                      " Current latitude ${controller!.listenerMapSingleTapping.value!.latitude}");
                  print(
                      " Current longitude ${controller!.listenerMapSingleTapping.value!.longitude}");
                } else {
                  toastMessage('Please Select The Location', context,
                      color: AppColors.error);
                }
                print('---------------------------------');
              },
              paddingHorizontal: 80,
            ),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
  }
}
