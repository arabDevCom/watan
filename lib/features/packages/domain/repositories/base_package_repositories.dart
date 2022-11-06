import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';

import '../entities/add_package_model.dart';
import '../entities/package_domain_model.dart';

abstract class BasePackageRepositories {
  Future<Either<Failure, Package>> getListOfPackage();
  Future<Either<Failure, AddPackageModel>> addPackage(AddPackageModel addPackageModel);
}
