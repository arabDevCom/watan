  import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/features/home_page/domain/entities/categories_domain_model.dart';
import 'package:elwatn/features/home_page/domain/entities/new_popular_domain_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/slider_domain_model.dart';
import '../../domain/repositories/base_home_repositories.dart';
import '../data_sources/home_data_source.dart';

class HomePageRepositories implements BaseHomeRepositories {
  final BaseNetworkInfo networkInfo;
  final BaseHomePageDataSource homePageDataSource;

  const HomePageRepositories(
      {required this.networkInfo, required this.homePageDataSource});

  @override
  Future<Either<Failure, HomeSlider>> getSliderData() async {
    try {
      final sliderData = await homePageDataSource.getSliderImages();
      return Right(sliderData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Categories>> getCategoriesData() async {
    try {
      final categoriesData = await homePageDataSource.getCategories();
      return Right(categoriesData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NewPopularItems>> getNewPopularItems() async {
    try {
      final newPopularData = await homePageDataSource.getNewPopularItems();
      print("1111111");
      print(newPopularData);
      return Right(newPopularData);
    } on ServerException {
      print("9999999");
      return Left(ServerFailure());
    }
  }




}
