import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/filterModel.dart';
import '../entities/filter_response_domian_model.dart';
import '../repositories/base_filter_repositories.dart';

class GetFiltersResponseUseCase implements UseCase<FilterResponse, FilterModel> {
  final BaseFilterRepositories baseFilterRepositories;

  const GetFiltersResponseUseCase({required this.baseFilterRepositories});

  @override
  Future<Either<Failure, FilterResponse>> call(FilterModel filterModel) =>
      baseFilterRepositories.getFiltersResponse(filterModel);
}
