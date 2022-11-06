import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../../data/models/MyRooms.dart';
import '../repositories/base_chat_repositories.dart';

class GetOneRoomUseCase extends UseCase<ChatModel, List<String>> {
  final BaseChatRepositories baseChatRepositories;

  GetOneRoomUseCase(this.baseChatRepositories);

  @override
  Future<Either<Failure, ChatModel>> call(List<String> params) =>
      baseChatRepositories.getOneRoom(params[0], params[1]);
}
