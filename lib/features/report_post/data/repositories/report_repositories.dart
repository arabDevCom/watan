import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/models/response_message.dart';
import 'package:elwatn/features/report_post/data/models/report_data_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/base_report_repositories.dart';
import '../data_sources/report_data_source.dart';

class ReportRepositories implements BaseReportRepositories {
  final BaseReportDataSource baseReportDataSource;

  const ReportRepositories({required this.baseReportDataSource});

  @override
  Future<Either<Failure, StatusResponse>> postReportPost(
      ReportPostModel reportPostModel) async {
    try {
      final reportPost =
          await baseReportDataSource.postReportPost(reportPostModel);
      return Right(reportPost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
