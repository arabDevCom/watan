import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/helper/location_helper.dart';

class BuildMap extends StatefulWidget {
   BuildMap({Key? key, this.position, this.mapController}) : super(key: key);
   Position? position;
  final Completer<GoogleMapController>? mapController ;

  @override
  State<BuildMap> createState() => _BuildMapState();
}

class _BuildMapState extends State<BuildMap> {

  @override
  Widget build(BuildContext context) {
    final CameraPosition cameraPosition = CameraPosition(
      target: LatLng(widget.position!.latitude, widget.position!.longitude),
      bearing: 0,
      tilt: 0,
      zoom: 17,
    );
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController controller) {
        widget.mapController!.complete(controller);
      },
    );
  }
}
