import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';
import 'package:elwatn/features/app_settings/domain/entities/app_setting_domain_model.dart';

import '../../data/models/app_setting_data_model.dart';
import '../repositories/base_app_setting_repositories.dart';

class GetAppSettingsUseCase extends UseCase<AppSettingModel, NoParams> {
  final BaseAppSettingsRepositories baseAppSettingRepositories;

  GetAppSettingsUseCase(this.baseAppSettingRepositories);

  @override
  Future<Either<Failure, AppSettingModel>> call(NoParams params) =>
      baseAppSettingRepositories.getAppSettingsData();
   }
