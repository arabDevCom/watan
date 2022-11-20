import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/favourites_model.dart';
import '../repositories/base_favourites_repositories.dart';

class GetMyFavouritesUseCase implements UseCase<FavouritesModel, String> {
  const GetMyFavouritesUseCase({required this.baseFavoritesRepositories});

  final BaseFavoritesRepositories baseFavoritesRepositories;

  @override
  Future<Either<Failure, FavouritesModel>> call(String params) =>
      baseFavoritesRepositories.getMyFavourites(params);
}
