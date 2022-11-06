import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../entities/add_package_model.dart';
import '../entities/package_domain_model.dart';
import '../repositories/base_package_repositories.dart';

class AddPackageUseCase implements UseCase<AddPackageModel, AddPackageModel> {
  final BasePackageRepositories basePackageRepositories;

  AddPackageUseCase(this.basePackageRepositories);

  @override
  Future<Either<Failure, AddPackageModel>> call(AddPackageModel params) =>
      basePackageRepositories.addPackage(params);
}
