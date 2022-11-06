part of 'show_lists_cubit.dart';

abstract class ShowListsState extends Equatable{
  @override
List<Object?> get props => [];
}

class ShowListsInitial extends ShowListsState {}

class ShowListsLoading extends ShowListsState {}

class ShowListsLoaded extends ShowListsState {
  final ShowMoreDataModel showLists;

  ShowListsLoaded({required this.showLists});

  @override
  List<Object> get props => [showLists];
}

class ShowProjectListsLoaded extends ShowListsState {
  final ShowProjectsListDataModel showProjectLists;

  ShowProjectListsLoaded({required this.showProjectLists});

  @override
  List<Object> get props => [showProjectLists];
}
class ShowListsLoadedError extends ShowListsState {
  final String message;

  ShowListsLoadedError({required this.message});

  @override
  List<Object> get props => [message];
}

class ChangeBoolean extends ShowListsState {}
