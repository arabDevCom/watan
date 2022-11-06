import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import '../../../../core/utils/assets_manager.dart';

class ViewMapWidget extends StatefulWidget {
  const ViewMapWidget(
      {Key? key,
      required this.latitude,
      required this.longitude})
      : super(key: key);
  final double latitude;
  final double longitude;

  @override
  State<ViewMapWidget> createState() => _ViewMapWidgetState();
}

class _ViewMapWidgetState extends State<ViewMapWidget> {
  late CameraPosition cameraPosition;
  BitmapDescriptor? icon;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _add() {
    var markerIdVal = '1';
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
      markerId: markerId,
      icon: icon!,
      position: LatLng(
          widget.latitude, widget.longitude),
    );

    setState(() {
      markers[markerId] = marker;
    });
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width, targetHeight: 128);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    getBytesFromAsset(ImageAssets.markerImage, 135).then((onValue) {
      icon = BitmapDescriptor.fromBytes(onValue);
    }).whenComplete(() => _add());
  }

  @override
  Widget build(BuildContext context) {
    cameraPosition = (widget.latitude != 0 &&
            widget.longitude != 0)
        ? CameraPosition(
            target: LatLng(widget.latitude,
                widget.longitude),
            bearing: 0,
            tilt: 0,
            zoom: 17,
          )
        : const CameraPosition(target: LatLng(0, 0));
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: false,
      zoomControlsEnabled: true,
      markers: Set<Marker>.of(markers.values),
      myLocationButtonEnabled: true,
      initialCameraPosition: cameraPosition,
    );
  }
}
