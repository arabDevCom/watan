import 'package:dartz/dartz.dart';
import 'package:elwatn/core/error/failures.dart';
import 'package:elwatn/core/usecases/usecase.dart';

import '../../data/models/MyRooms.dart';
import '../entities/open_room_model.dart';
import '../repositories/base_chat_repositories.dart';

class OpenRoomUseCase extends UseCase<ChatModel,OpenRoom>{
  final BaseChatRepositories baseChatRepositories;

  OpenRoomUseCase(this.baseChatRepositories);
  @override
  Future<Either<Failure, ChatModel>> call(OpenRoom params) =>
      baseChatRepositories.openRoom(params);
}