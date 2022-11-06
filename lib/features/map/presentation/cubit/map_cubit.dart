import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/helper/location_helper.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial()) {
    getCurrantLocation().whenComplete(() {
      cameraPosition = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        bearing: 0,
        tilt: 0,
        zoom: 17,
      );
    });
  }

  Position? position;
  CameraPosition? cameraPosition;
  Completer<GoogleMapController> mapController = Completer();

  Future<void> getCurrantLocation() async {
    position = await LocationHelper.getCurrantLocation().whenComplete(() {
      emit(MapGetLastKnowPosition());
    });
  }

  Future<void> goToMyCurrantLocation() async {
    final GoogleMapController controller =
        await mapController.future.whenComplete(() => print("hello"));
    controller.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition!),
    ).whenComplete(() => emit(MapGetLastKnowPosition()));
  }
}
