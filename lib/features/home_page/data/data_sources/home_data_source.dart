import '../../../../core/api/base_api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/categories_domain_model.dart';
import '../../domain/entities/new_popular_domain_model.dart';
import '../../domain/entities/slider_domain_model.dart';
import '../models/categories_data_model.dart';
import '../models/new_popular_data_model.dart';
import '../models/slider_data_model.dart';

abstract class BaseHomePageDataSource {
  Future<HomeSlider> getSliderImages();

  Future<Categories> getCategories();

  Future<NewPopularItems> getNewPopularItems();
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

  @override
  Future<NewPopularItems> getNewPopularItems() async {
    print("ooooo");
    final response = await apiConsumer.get(EndPoints.newPopularUrl);
    print("response");
    print(response);
    print("NewPopularItemsModel.fromJson(response)");
    // print(NewPopularItemsModel.fromJson(response).data!.dataNew);
    return NewPopularItemsModel.fromJson(response);
  }
}
