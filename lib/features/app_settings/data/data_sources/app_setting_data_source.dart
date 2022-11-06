import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/app_setting_data_model.dart';

abstract class BaseAppSettingDataSource{
  Future<AppSettingModel> getAppSettingsData();
}

class AppSettingDataSource extends BaseAppSettingDataSource{
  final BaseApiConsumer apiConsumer;

  AppSettingDataSource(this.apiConsumer);
  @override
  Future<AppSettingModel> getAppSettingsData() async {
  final response = await apiConsumer.get(EndPoints.settingsUrl);
  return AppSettingModel.fromJson(response);
  }
}