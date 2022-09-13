part of 'login_cubit.dart';


abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginModel loginModel;

  LoginLoaded({required this.loginModel});

  @override
  List<Object> get props => [loginModel];
}

class LoginLoadedError extends LoginState {
  final String message;

  LoginLoadedError({required this.message});

  @override
  List<Object> get props => [message];
}
