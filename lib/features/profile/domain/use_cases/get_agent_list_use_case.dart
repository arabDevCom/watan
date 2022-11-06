import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/agent_list_domain_model.dart';
import '../repositories/base_profile_repositories.dart';

class GetAgentProfileListUseCase implements UseCase<AgentProfileList, String> {
  final BaseProfileRepositories baseProfileRepositories;

  GetAgentProfileListUseCase(this.baseProfileRepositories);

  @override
  Future<Either<Failure, AgentProfileList>> call(String params) =>
      baseProfileRepositories.getAgentList(params);
}
