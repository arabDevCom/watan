import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/login_domain_model.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.postLoginUseCase}) : super(LoginInitial());

  final PostLoginUseCase postLoginUseCase;

  Future<void> postLoginData(
      {required String email, required String password}) async {
    emit(LoginLoading());
    print("email");
    print(email);
    print("password");
    print(password);
    Either<Failure, LoginModel> response =
        await postLoginUseCase([email, password]);
    emit(
      response.fold(
        (failure) => LoginLoadedError(message: _mapFailureToMessage(failure)),
        (loginModel) {
          return LoginLoaded(loginModel: loginModel);
        },
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
