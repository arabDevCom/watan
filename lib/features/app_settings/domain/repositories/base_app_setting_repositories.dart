import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';

import '../../data/models/app_setting_data_model.dart';

abstract class BaseAppSettingsRepositories{
  Future<Either<Failure,AppSettingModel>> getAppSettingsData();
}