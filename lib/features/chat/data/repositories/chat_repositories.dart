import 'package:dartz/dartz.dart';

import 'package:elwatn/core/error/failures.dart';

import 'package:elwatn/features/chat/data/models/MyRooms.dart';
import 'package:elwatn/features/chat/data/models/send_message_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/open_room_model.dart';
import '../../domain/repositories/base_chat_repositories.dart';
import '../data_sources/chat_data_source.dart';
import '../models/get_one_message_model.dart';

class ChatRepositories extends BaseChatRepositories {
  final BaseChatDataSource baseChatDataSource;

  ChatRepositories(this.baseChatDataSource);

  @override
  Future<Either<Failure, ChatModel>> getMyRooms(String token) async {
    try {
      final response = await baseChatDataSource.getMyRooms(token);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ChatModel>> getOneRoom(String roomId,String token) async {
    try {
      final response = await baseChatDataSource.getOneRoom(roomId,token);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, GetOneMessage>> sendMessage(SendMessage sendMessage) async {
    try {
      final response = await baseChatDataSource.sendMessage(sendMessage);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ChatModel>> openRoom(OpenRoom openRoom) async {
    try {
      final response = await baseChatDataSource.openRoom(openRoom);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
