import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import '../../../../core/models/response_message.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../home_page/data/models/main_item_data_model.dart';
import '../repositories/base_profile_repositories.dart';

class PostNewAgentUseCase implements UseCase<StatusResponse, AgentModel> {
  final BaseProfileRepositories baseProfileRepositories;

  PostNewAgentUseCase(this.baseProfileRepositories);

  @override
  Future<Either<Failure, StatusResponse>> call(AgentModel params) =>
      baseProfileRepositories.postNewAgent(params);
}
