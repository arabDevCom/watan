import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import 'package:elwatn/features/contact_us/data/models/contact_us_data_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/base_contact_us_repositories.dart';
import '../data_sources/contact_us_data_source.dart';

class ContactUsRepositories extends BaseContactUsRepositories {
  final BaseContactUsDataSource baseContactUsDataSource;

  ContactUsRepositories(this.baseContactUsDataSource);

  @override
  Future<Either<Failure, ContactUsModel>> postContactUs(
      ContactUsDataModel contactUsDataModel) async {
    try {
      final contactUs =
          await baseContactUsDataSource.postContactUs(contactUsDataModel);
      return Right(contactUs);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
