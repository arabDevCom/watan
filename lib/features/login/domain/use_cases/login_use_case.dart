import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login_domain_model.dart';
import '../repositories/base_login_repositories.dart';

class PostLoginUseCase implements UseCase<LoginModel, List<String>> {
  final BaseLoginRepositories baseLoginRepositories;

  const PostLoginUseCase({required this.baseLoginRepositories});

  @override
  Future<Either<Failure, LoginModel>> call(List<String> loginData) =>
      baseLoginRepositories.postLogin(loginData[0], loginData[1]);
}
