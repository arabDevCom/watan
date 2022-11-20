part of 'map_cubit.dart';


abstract class MapState {}

class MapInitial extends MapState {}

class AllMapLocationsLoading extends MapState {}
class AllMapLocationsLoaded extends MapState {}
class AllMapLocationsError extends MapState {}