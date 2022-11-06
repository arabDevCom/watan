import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';

import '../entities/bloggs_domain_model.dart';

abstract class BaseBloggsRepositories{
  Future<Either<Failure,Bloggs>> getBloggsData();
}