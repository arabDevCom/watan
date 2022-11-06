import 'package:dartz/dartz.dart';
import 'package:elwatn/core/models/response_message.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/report_data_model.dart';

abstract class BaseReportRepositories{
  Future<Either<Failure, StatusResponse>> postReportPost(ReportPostModel reportPostModel);

}