part of 'project_details_cubit.dart';

abstract class ProjectDetailsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProjectDetailsInitial extends ProjectDetailsState {}

class ProjectDetailsViewsLoading extends ProjectDetailsState {}
class ProjectDetailsViewsLoaded extends ProjectDetailsState {}
class ProjectDetailsViewsLoadError extends ProjectDetailsState {
  final String message;

  ProjectDetailsViewsLoadError({required this.message});

  @override
  List<Object?> get props => [message];
}


class ProjectMorePostsDetailsLoading extends ProjectDetailsState {}
class ProjectMorePostsDetailsLoaded extends ProjectDetailsState {
  final MoreProjectPostsDetails moreProjectPostsDetails;

  ProjectMorePostsDetailsLoaded(this.moreProjectPostsDetails);
  @override
  List<Object?> get props => [moreProjectPostsDetails];
}
class ProjectMorePostsDetailsLoadError extends ProjectDetailsState {
  final String message;
  ProjectMorePostsDetailsLoadError({required this.message});
  @override
  List<Object?> get props => [message];
}



class ProjectAllUserPostsLoading extends ProjectDetailsState {}
class ProjectAllUserPostsLoaded extends ProjectDetailsState {
  final AllPostsProject allPostsProject;

  ProjectAllUserPostsLoaded(this.allPostsProject);
  @override
  List<Object?> get props => [allPostsProject];
}
class ProjectAllUserPostsLoadError extends ProjectDetailsState {
  final String message;
  ProjectAllUserPostsLoadError({required this.message});
  @override
  List<Object?> get props => [message];
}
