import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import 'package:elwatn/features/app_settings/data/models/app_setting_data_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/base_app_setting_repositories.dart';
import '../data_sources/app_setting_data_source.dart';

class AppSettingRepositories extends BaseAppSettingsRepositories {
  final BaseAppSettingDataSource baseAppSettingDataSource;

  AppSettingRepositories(this.baseAppSettingDataSource);

  @override
  Future<Either<Failure, AppSettingModel>> getAppSettingsData() async {
    try {
      final appSettingData =
          await baseAppSettingDataSource.getAppSettingsData();
      return Right(appSettingData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
