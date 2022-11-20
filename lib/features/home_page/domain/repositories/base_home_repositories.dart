import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/categories_domain_model.dart';
import '../entities/new_popular_domain_model.dart';
import '../entities/slider_domain_model.dart';

abstract class BaseHomeRepositories{
  Future<Either<Failure, HomeSlider>> getSliderData();
  Future<Either<Failure, Categories>> getCategoriesData();
  Future<Either<Failure, NewPopularItems>> getNewPopularItems(String userId);

}