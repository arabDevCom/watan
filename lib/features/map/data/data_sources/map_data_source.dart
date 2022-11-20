import 'package:elwatn/core/api/base_api_consumer.dart';
import 'package:elwatn/core/api/end_points.dart';

import '../../domain/entities/get_all_location_model.dart';

abstract class BaseMapDataSource {
  Future<AllLocationsModel> getAllLocations();
}

class MapDataSource extends BaseMapDataSource {
  final BaseApiConsumer apiConsumer;

  MapDataSource(this.apiConsumer);

  @override
  Future<AllLocationsModel> getAllLocations() async {
    final response = await apiConsumer.get(EndPoints.getAllLocationsUrl);
    return AllLocationsModel.fromJson(response);
  }
}
