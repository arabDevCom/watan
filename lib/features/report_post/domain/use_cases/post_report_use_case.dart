import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/models/response_message.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/models/report_data_model.dart';
import '../repositories/base_report_repositories.dart';

class PostReportUseCase implements UseCase<StatusResponse, ReportPostModel> {
  final BaseReportRepositories baseReportRepositories;

  const PostReportUseCase({required this.baseReportRepositories});

  @override
  Future<Either<Failure, StatusResponse>> call(ReportPostModel params) =>baseReportRepositories.postReportPost(params);
}


