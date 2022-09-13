
import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/show_more_domain_model.dart';
import '../models/show_more_data_model.dart';

abstract class BaseShowDataDataSource {
  Future<ShowMore> getShowMoreData(String params);
  Future<ShowMore> getPaginationData(String params);
}

class ShowMoreDataSource implements BaseShowDataDataSource {
  final BaseApiConsumer apiConsumer;

  const ShowMoreDataSource({required this.apiConsumer});

  @override
  Future<ShowMore> getShowMoreData(String params) async {
    final response = await apiConsumer.get(EndPoints.showMorePostsUrl, queryParameters:{
      "show_more_type": "params"
    });
    return ShowMoreModel.fromJson(response);
  }

  @override
  Future<ShowMore> getPaginationData(String params) async {
    final response = await apiConsumer.get(params);
    return ShowMoreModel.fromJson(response);
  }


}
