import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/all_project_posts.dart';
import '../../domain/entities/more_project_posts.dart';

abstract class BaseProjectDetailsDataSource {
  Future<void> increaseViews(String id);

  Future<MoreProjectPostsDetails> morePosts(String id);

  Future<AllPostsProject> allUserPosts(String id);
}

class ProjectDetailsDataSource extends BaseProjectDetailsDataSource {
  final BaseApiConsumer apiConsumer;

  ProjectDetailsDataSource(this.apiConsumer);

  @override
  Future<void> increaseViews(String id) async {
    await apiConsumer.get("${EndPoints.viewsUrl}/$id");
  }

  @override
  Future<MoreProjectPostsDetails> morePosts(String id) async {
    final response = await apiConsumer.get("${EndPoints.moreProjectPostsUrl}/$id");
    return MoreProjectPostsDetails.fromJson(response);
  }

  @override
  Future<AllPostsProject> allUserPosts(String id) async {
    final response = await apiConsumer.get("${EndPoints.projectByUserUrl}/$id");
    return AllPostsProject.fromJson(response);
  }
}
