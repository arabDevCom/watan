import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/agent_list_data_model.dart';
import '../repositories/base_filter_repositories.dart';

class GetAgentUseCase implements UseCase<FilterAgentListModel, NoParams> {
  final BaseFilterRepositories baseFilterRepositories;

  const GetAgentUseCase({required this.baseFilterRepositories});

  @override
  Future<Either<Failure, FilterAgentListModel>> call(NoParams params) =>
      baseFilterRepositories.getAgentListData();
}
