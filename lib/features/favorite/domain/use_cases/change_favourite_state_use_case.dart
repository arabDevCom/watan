import 'package:dartz/dartz.dart';
import 'package:elwatn/core/models/response_message.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/base_favourites_repositories.dart';

class ChangeStatusFavouritesUseCase implements UseCase<StatusResponse, List<String>> {
  const ChangeStatusFavouritesUseCase({required this.baseFavoritesRepositories});

  final BaseFavoritesRepositories baseFavoritesRepositories;

  @override
  Future<Either<Failure, StatusResponse>> call(List<String> params) =>
      baseFavoritesRepositories.changeStatusFavourites(params);
}
