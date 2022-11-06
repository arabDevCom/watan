part of 'show_more_cubit.dart';

abstract class ShowMoreState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShowMoreInitial extends ShowMoreState {}

class ShowMoreLoading extends ShowMoreState {}

class ShowMoreLoaded extends ShowMoreState {
  final ShowMore showMore;

  ShowMoreLoaded({required this.showMore});

  @override
  List<Object> get props => [showMore];
}

class ShowMoreLoadedError extends ShowMoreState {
  final String message;

  ShowMoreLoadedError({required this.message});

  @override
  List<Object> get props => [message];
}
class ChangeBoolean extends ShowMoreState {}
