import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/models/contact_us_data_model.dart';
import '../repositories/base_contact_us_repositories.dart';

class PostContactUSUseCase extends UseCase<ContactUsModel, ContactUsDataModel> {
  final BaseContactUsRepositories baseContactUsRepositories;

  PostContactUSUseCase(this.baseContactUsRepositories);

  @override
  Future<Either<Failure, ContactUsModel>> call(ContactUsDataModel params) =>
      baseContactUsRepositories.postContactUs(params);
}
