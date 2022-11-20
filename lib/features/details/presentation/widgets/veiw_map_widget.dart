import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../../../../core/utils/app_colors.dart';

class ViewMapWidget extends StatefulWidget {
  const ViewMapWidget({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  final double  latitude;
 final double longitude;
  @override
  State<ViewMapWidget> createState() => _ViewMapWidgetState();
}

class _ViewMapWidgetState extends State<ViewMapWidget> {
  MapController? controller;
   GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  void initState() {
    super.initState();
    if(controller==null||scaffoldKey==null){
      controller = MapController(
        initMapWithUserPosition: false,
        initPosition: GeoPoint(
          latitude: widget.latitude,
          longitude: widget.longitude,
        ),
      );
      scaffoldKey = GlobalKey<ScaffoldState>();
    }
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          staticPoints: [
            StaticPositionGeoPoint(
              "line 1",
              MarkerIcon(
                assetMarker: AssetMarker(
                    image: AssetImage(
                      ImageAssets.markerImage,
                    ),
                    scaleAssetImage: 2),
              ),
              [
                GeoPoint(latitude: widget.latitude, longitude: widget.longitude)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
