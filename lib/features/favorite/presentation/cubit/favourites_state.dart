part of 'favourites_cubit.dart';

@immutable
abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}

class FavouritesLoading extends FavouritesState {}
class FavouritesLoaded extends FavouritesState {}
class FavouritesFailure extends FavouritesState {}

class FavouritesResponseMessage extends FavouritesState {}
class FavouritesChangeState extends FavouritesState {}
