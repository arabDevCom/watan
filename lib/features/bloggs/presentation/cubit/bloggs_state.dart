part of 'bloggs_cubit.dart';

@immutable
abstract class BloggsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BloggsInitial extends BloggsState {}

class BloggsLoading extends BloggsState {}

class BloggsLoaded extends BloggsState {
  final Bloggs bloggs;

  BloggsLoaded(this.bloggs);

  @override
  List<Object?> get props => [bloggs];
}

class BloggsFailure extends BloggsState {
  final String message;

  BloggsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
