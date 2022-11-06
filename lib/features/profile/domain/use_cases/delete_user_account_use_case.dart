import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import '../../../../core/models/response_message.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/base_profile_repositories.dart';

class DeleteUserAccountUseCase implements UseCase<StatusResponse, String> {
  final BaseProfileRepositories baseProfileRepositories;

  DeleteUserAccountUseCase(this.baseProfileRepositories);

  @override
  Future<Either<Failure, StatusResponse>> call(String params) =>
      baseProfileRepositories.deleteUserAccount(params);
}
