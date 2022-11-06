part of 'map_cubit.dart';


abstract class MapState {}

class MapInitial extends MapState {}

class MapGetLastKnowPosition extends MapState {}
class MapGetNewPosition extends MapState {}
