import 'package:dartz/dartz.dart';
import 'package:elwatn/core/models/response_message.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/favourites_model.dart';
import '../../domain/repositories/base_favourites_repositories.dart';
import '../data_sources/favourites_data_source.dart';

class FavoritesRepositories implements BaseFavoritesRepositories {
  final BaseFavouritesDataSource baseFavouritesDataSource;

  FavoritesRepositories({required this.baseFavouritesDataSource});

  @override
  Future<Either<Failure, FavouritesModel>> getMyFavourites(String token) async {
    try {
      final profileAdsModel =
          await baseFavouritesDataSource.getMyFavourites(token);
      return Right(profileAdsModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StatusResponse>> changeStatusFavourites(
      List<String> data) async {
    try {
      final profileAdsModel =
          await baseFavouritesDataSource.changeStatusFavourites(data);
      return Right(profileAdsModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
