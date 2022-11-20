
import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/show_more_domain_model.dart';
import '../models/show_more_data_model.dart';

abstract class BaseShowDataDataSource {
  Future<ShowMore> getShowMoreData(List<String> params);
  Future<ShowMore> getPaginationData(List<String> params);
}

class ShowMoreDataSource implements BaseShowDataDataSource {
  final BaseApiConsumer apiConsumer;

  const ShowMoreDataSource({required this.apiConsumer});

  @override
  Future<ShowMore> getShowMoreData(List<String> params) async {
    final response = await apiConsumer.get(EndPoints.showMorePostsUrl, queryParameters:{
      "show_more_type": params[0],
      'user_id':params[1],
    });
    return ShowMoreModel.fromJson(response);
  }

  @override
  Future<ShowMore> getPaginationData(List<String> params) async {
    final response = await apiConsumer.get(params[0], queryParameters:{
      "show_more_type": params[1],
      'user_id':params[2],
    });
    return ShowMoreModel.fromJson(response);
  }


}
