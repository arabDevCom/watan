import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../../domain/entities/get_all_location_model.dart';
import '../../domain/use_cases/get_all_location_use_case.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this.getAllLocationsUseCase) : super(MapInitial()){
    getAllLocations();
  }

  final GetAllLocationsUseCase getAllLocationsUseCase;

  List<GeoPoint> geoPoints = [];

  getAllLocations() async {
    emit(AllMapLocationsLoading());
    Either<Failure, AllLocationsModel> response =
        await getAllLocationsUseCase(NoParams());
    emit(
      response.fold(
        (failure) => AllMapLocationsError(),
        (allLocations) {
          allLocations.data!.adsLocations!.forEach((element) {
            geoPoints
                .add(GeoPoint(latitude: element.latitude!, longitude: element.longitude!));
          });

          allLocations.data!.projectsLocations!.forEach((element) {
            geoPoints
                .add(GeoPoint(latitude: element.latitude!, longitude: element.longitude!));
          });
          return AllMapLocationsLoaded();
        },
      ),
    );
  }
}
