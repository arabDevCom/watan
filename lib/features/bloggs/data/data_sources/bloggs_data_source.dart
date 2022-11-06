import 'package:elwatn/core/api/base_api_consumer.dart';

import '../../../../core/api/end_points.dart';
import '../../domain/entities/bloggs_domain_model.dart';
import '../models/bloggs_data_model.dart';

abstract class BaseBloggsDataSource{
  Future<Bloggs> getBloggsData();
}

class BloggsDataSource extends BaseBloggsDataSource{
 final BaseApiConsumer baseApiConsumer;

  BloggsDataSource(this.baseApiConsumer);
  @override
  Future<Bloggs> getBloggsData() async {
    final response = await baseApiConsumer.get(EndPoints.blogsUrl);
    return BloggsModel.fromJson(response);
  }
}