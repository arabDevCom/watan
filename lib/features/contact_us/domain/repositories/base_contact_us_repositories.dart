import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';

import '../../data/models/contact_us_data_model.dart';

abstract class BaseContactUsRepositories{
  Future<Either<Failure,ContactUsModel>> postContactUs(ContactUsDataModel contactUsDataModel);
}