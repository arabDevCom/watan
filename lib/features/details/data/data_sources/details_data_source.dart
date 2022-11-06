import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/all_posts_for_user.dart';
import '../../domain/entities/more_posts.dart';

abstract class BaseDetailsDataSource {
  Future<void> increaseViews(String id);

  Future<MorePostsDetails> morePosts(String id);

  Future<AllPostsUser> allUserPosts(String id);
}

class DetailsDataSource extends BaseDetailsDataSource {
  final BaseApiConsumer apiConsumer;

  DetailsDataSource(this.apiConsumer);

  @override
  Future<void> increaseViews(String id) async {
    await apiConsumer.get("${EndPoints.viewsUrl}/$id");
  }

  @override
  Future<MorePostsDetails> morePosts(String id) async {
    final response = await apiConsumer.get("${EndPoints.morePostsUrl}/$id");
    return MorePostsDetails.fromJson(response);
  }

  @override
  Future<AllPostsUser> allUserPosts(String id) async {
    final response = await apiConsumer.get("${EndPoints.adsByUserUrl}/$id");
    return AllPostsUser.fromJson(response);
  }
}
