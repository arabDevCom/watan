import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../entities/package_domain_model.dart';
import '../repositories/base_package_repositories.dart';

class GetPackageUseCase implements UseCase<Package, NoParams> {
  final BasePackageRepositories basePackageRepositories;

  GetPackageUseCase(this.basePackageRepositories);

  @override
  Future<Either<Failure, Package>> call(NoParams params) =>
      basePackageRepositories.getListOfPackage();
}
