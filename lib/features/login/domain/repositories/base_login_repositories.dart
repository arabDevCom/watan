import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/login_domain_model.dart';


abstract class BaseLoginRepositories{
  Future<Either<Failure, LoginModel>> postLogin(String email,String password);
}