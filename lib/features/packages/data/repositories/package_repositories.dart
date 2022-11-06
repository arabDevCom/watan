import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/features/packages/domain/entities/add_package_model.dart';

import 'package:elwatn/features/packages/domain/entities/package_domain_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/base_package_repositories.dart';
import '../data_sources/package_data_source.dart';

class PackageRepositories extends BasePackageRepositories {
  final BasePackageDataSource basePackageDataSource;

  PackageRepositories(this.basePackageDataSource);

  @override
  Future<Either<Failure, Package>> getListOfPackage() async {
    try {
      final package = await basePackageDataSource.getListOfPackage();
      return Right(package);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AddPackageModel>> addPackage(AddPackageModel addPackageModel) async {
    try {
      final package = await basePackageDataSource.addPackage(addPackageModel);
      return Right(package);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
