import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../show_more_posts/data/models/show_more_data_model.dart';
import '../models/show_list_projects_data_model.dart';

abstract class BaseShowListsDataSource {
  Future<ShowMoreDataModel> getShowListsData(String params);

  Future<ShowProjectsListDataModel> getShowProjectsListsData(String params);

  Future<ShowMoreDataModel> getPaginationOfShowListsData(String params);

  Future<ShowProjectsListDataModel> getPaginationOfShowProjectsListsData(
      String params);
}

class ShowListsDataSource implements BaseShowListsDataSource {
  final BaseApiConsumer apiConsumer;

  const ShowListsDataSource({required this.apiConsumer});

  @override
  Future<ShowMoreDataModel> getShowListsData(String params) async {
    final response = await apiConsumer.get(
        "${EndPoints.baseUrl}home/${params.split('@')[0]}-ads",
        queryParameters: {
          'user_id': params.split('@')[1],
        });
    return ShowMoreDataModel.fromJson(response);
  }

  @override
  Future<ShowMoreDataModel> getPaginationOfShowListsData(String params) async {
    final response =
        await apiConsumer.get(params.split('@')[0], queryParameters: {
      'user_id': params.split('@')[1],
    });
    return ShowMoreDataModel.fromJson(response);
  }

  @override
  Future<ShowProjectsListDataModel> getShowProjectsListsData(
      String params) async {
    final response = await apiConsumer.get(
        "${EndPoints.baseUrl}home/${params.split('@')[0]}-ads",
        queryParameters: {
          'user_id': params.split('@')[1],
        });
    return ShowProjectsListDataModel.fromJson(response);
  }

  @override
  Future<ShowProjectsListDataModel> getPaginationOfShowProjectsListsData(
      String params) async {
    final response =
        await apiConsumer.get(params.split('@')[0], queryParameters: {
      'user_id': params.split('@')[1],
    });
    return ShowProjectsListDataModel.fromJson(response);
  }
}
