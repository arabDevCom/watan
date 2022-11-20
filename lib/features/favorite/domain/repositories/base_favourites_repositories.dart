import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/response_message.dart';
import '../entities/favourites_model.dart';


abstract class BaseFavoritesRepositories{
  Future<Either<Failure, FavouritesModel>> getMyFavourites(String token);
  Future<Either<Failure, StatusResponse>> changeStatusFavourites(List<String> data);
}