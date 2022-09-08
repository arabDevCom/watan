import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/slider_data_model.dart';
import '../entities/categories_domain_model.dart';
import '../entities/slider_domain_model.dart';

abstract class BaseHomeRepositories{
  Future<Either<Failure, HomeSlider>> getSliderData();
  Future<Either<Failure, Categories>> getCategoriesData();

}