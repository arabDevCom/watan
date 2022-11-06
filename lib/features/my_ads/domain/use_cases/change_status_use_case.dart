import 'package:dartz/dartz.dart';
import 'package:elwatn/core/models/response_message.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/base_my_ads_repositories.dart';

class ChangeStatusMyAdsUseCase implements UseCase<StatusResponse, List<String>> {
  const ChangeStatusMyAdsUseCase({required this.baseMyAdsRepositories});

  final BaseMyAdsRepositories baseMyAdsRepositories;

  @override
  Future<Either<Failure, StatusResponse>> call(List<String> params) =>
      baseMyAdsRepositories.changeStatusMyAds(params);
}
