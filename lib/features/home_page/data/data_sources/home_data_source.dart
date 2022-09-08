
import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/categories_domain_model.dart';
import '../../domain/entities/slider_domain_model.dart';
import '../models/categories_data_model.dart';
import '../models/slider_data_model.dart';

abstract class BaseHomePageDataSource {
  Future<HomeSlider> getSliderImages();
  Future<Categories> getCategories();
}

class HomePageDataSource implements BaseHomePageDataSource {
  final BaseApiConsumer apiConsumer;

  const HomePageDataSource({required this.apiConsumer});

  @override
  Future<HomeSlider> getSliderImages() async {
    final response = await apiConsumer.get(EndPoints.sliderUrl);
    return SliderModel.fromJson(response);
  }

  @override
  Future<Categories> getCategories() async {
    final response = await apiConsumer.get(EndPoints.categoriesUrl);
    return CategoriesModel.fromJson(response);
  }


}
