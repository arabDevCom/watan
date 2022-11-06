import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/widgets/show_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/helper/location_helper.dart';
import '../cubit/map_cubit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController? controller;
  GeoPoint? geoPoint;
  getLocation() async {
    await LocationHelper.getCurrantLocation().then((value) {

      controller = MapController(
        initMapWithUserPosition: false,
        initPosition: GeoPoint(latitude: value.latitude, longitude: value.longitude),
        // // initMapWithUserPosition: false,
        // initPosition:
        //     GeoPoint(latitude: value.latitude, longitude: value.longitude),
      );
    }).then((value) => setState(() {}));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    controller!.listenerMapLongTapping.addListener(() async {
      if (controller!.listenerMapLongTapping.value != null) {
        /// put you logic here
        print("clickkkkkk");
        // await controller!.addMarker(geoPoint!,markerIcon:MarkerIcon(icon: ),angle:pi/3);

      }
    });
    return Scaffold(
      body: SafeArea(
        child: controller != null
            ? OSMFlutter(

          onGeoPointClicked:(geo){
                   },
                controller: controller!,
                trackMyPosition: false,
                initZoom: 12,
                minZoomLevel: 2,
                maxZoomLevel: 19,
                stepZoom: 1.0,
                userLocationMarker: UserLocationMaker(
                  personMarker: MarkerIcon(
                    icon: Icon(
                      Icons.location_history_rounded,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: MarkerIcon(
                    icon: Icon(
                      Icons.double_arrow,
                      size: 48,
                    ),
                  ),
                ),
                roadConfiguration: RoadConfiguration(
                  startIcon: MarkerIcon(
                    icon: Icon(
                      Icons.person,
                      size: 64,
                      color: Colors.brown,
                    ),
                  ),
                  roadColor: Colors.yellowAccent,
                ),
                markerOption: MarkerOption(
                    defaultMarker: MarkerIcon(
                  icon: Icon(
                    Icons.person_pin_circle,
                    color: Colors.blue,
                    size: 56,
                  ),
                )),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );

    // return Scaffold(
    //   body: SafeArea(
    //     child: BlocBuilder<MapCubit, MapState>(
    //       builder: (context, state) {
    //         if (state is MapGetLastKnowPosition) {
    //           return Stack(
    //             children: [
    //               GoogleMap(
    //                 mapType: MapType.normal,
    //                 myLocationEnabled: true,
    //                 zoomControlsEnabled: false,
    //                 myLocationButtonEnabled: true,
    //                 initialCameraPosition:
    //                     context.read<MapCubit>().cameraPosition!,
    //                 onMapCreated: (GoogleMapController controller) {
    //                   if (!context.read<MapCubit>().mapController.isCompleted) {
    //                     print("again");
    //
    //                     context
    //                         .read<MapCubit>()
    //                         .mapController
    //                         .complete(controller);
    //                   }
    //                 },
    //               ),
    //               Positioned(
    //                 bottom: 30,
    //                 right: 8,
    //                 child: FloatingActionButton(
    //                   backgroundColor: AppColors.primary,
    //                   onPressed: () {
    //                     print("لالالا");
    //                     context.read<MapCubit>().goToMyCurrantLocation();
    //                   },
    //                   child: const Icon(Icons.place),
    //                 ),
    //               )
    //             ],
    //           );
    //         } else if (state is MapGetNewPosition) {
    //           CameraPosition cameraPosition = CameraPosition(
    //             target: LatLng(context.read<MapCubit>().position!.latitude,
    //                 context.read<MapCubit>().position!.longitude),
    //             bearing: 0,
    //             tilt: 0,
    //             zoom: 17,
    //           );
    //           print("yes");
    //           return Stack(
    //             children: [
    //               GoogleMap(
    //                 mapType: MapType.normal,
    //                 myLocationEnabled: true,
    //                 zoomControlsEnabled: false,
    //                 myLocationButtonEnabled: true,
    //                 initialCameraPosition: cameraPosition,
    //                 onMapCreated: (GoogleMapController controller) {
    //                   context
    //                       .read<MapCubit>()
    //                       .mapController
    //                       .complete(controller);
    //                 },
    //               ),
    //               Positioned(
    //                 bottom: 30,
    //                 right: 8,
    //                 child: FloatingActionButton(
    //                   backgroundColor: AppColors.primary,
    //                   onPressed: () {
    //                     context.read<MapCubit>().goToMyCurrantLocation();
    //                   },
    //                   child: const Icon(Icons.place),
    //                 ),
    //               )
    //             ],
    //           );
    //         } else {
    //           print("noooooo");
    //           return const ShowLoadingIndicator();
    //         }
    //       },
    //     ),
    //   ),
    // );
  }
}
