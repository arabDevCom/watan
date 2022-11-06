import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/my_ads_data_model.dart';
import '../repositories/base_my_ads_repositories.dart';

class GetMyAdsUseCase implements UseCase<ProfileAdsModel, List<String>> {
  const GetMyAdsUseCase({required this.baseMyAdsRepositories});

  final BaseMyAdsRepositories baseMyAdsRepositories;

  @override
  Future<Either<Failure, ProfileAdsModel>> call(List<String> params) =>
      baseMyAdsRepositories.getMyAds(params);
}
