import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/features/home_page/domain/entities/slider_domain_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/models/slider_data_model.dart';
import '../repositories/base_home_repositories.dart';

class GetSliderUseCase implements UseCase<HomeSlider, NoParams> {
  final BaseHomeRepositories baseHomeRepositories;

  const GetSliderUseCase({required this.baseHomeRepositories});

  @override
  Future<Either<Failure, HomeSlider>> call(NoParams params) =>
      baseHomeRepositories.getSliderData();
}
