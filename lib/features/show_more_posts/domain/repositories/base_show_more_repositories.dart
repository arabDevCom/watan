import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/show_more_domain_model.dart';


abstract class BaseShowMoreRepositories{
  Future<Either<Failure, ShowMore>> getShowMoreData(String param);
  Future<Either<Failure, ShowMore>> getPaginationData(String param);
}