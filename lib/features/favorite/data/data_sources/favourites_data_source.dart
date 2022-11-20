import 'package:dio/dio.dart';
import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/models/response_message.dart';
import '../../domain/entities/favourites_model.dart';

abstract class BaseFavouritesDataSource {
  Future<FavouritesModel> getMyFavourites(String token);

  Future<StatusResponse> changeStatusFavourites(List<String> data);
}

class FavouritesDataSource implements BaseFavouritesDataSource {
  final BaseApiConsumer apiConsumer;

  const FavouritesDataSource({required this.apiConsumer});

  @override
  Future<FavouritesModel> getMyFavourites(String token) async {
    final response = await apiConsumer.get(
      EndPoints.favouritesUrl,
      options: Options(
        headers: {"Authorization": token},
      ),
    );
    return FavouritesModel.fromJson(response);
  }

  @override
  Future<StatusResponse> changeStatusFavourites(List<String> data) async {
    final response = await apiConsumer.post(
      data[2] == 'project'
          ? EndPoints.changeProjectFavouriteStatusUrl
          : EndPoints.changePostFavouriteStatusUrl,
      body:
          data[2] == 'project' ? {'project_id': data[0]} : {'post_id': data[0]},
      options: Options(
        headers: {"Authorization": data[1]},
      ),
    );
    return StatusResponse.fromJson(response);
  }
}
