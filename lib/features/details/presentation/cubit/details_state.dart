part of 'details_cubit.dart';

abstract class DetailsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsViewsLoading extends DetailsState {}
class DetailsViewsLoaded extends DetailsState {}
class DetailsViewsLoadError extends DetailsState {
  final String message;

  DetailsViewsLoadError({required this.message});

  @override
  List<Object?> get props => [message];
}


class MorePostsDetailsLoading extends DetailsState {}
class MorePostsDetailsLoaded extends DetailsState {
  final MorePostsDetails morePostsDetails;

  MorePostsDetailsLoaded(this.morePostsDetails);
  @override
  List<Object?> get props => [morePostsDetails];
}
class MorePostsDetailsLoadError extends DetailsState {
  final String message;
  MorePostsDetailsLoadError({required this.message});
  @override
  List<Object?> get props => [message];
}



class AllUserPostsLoading extends DetailsState {}
class AllUserPostsLoaded extends DetailsState {
  final AllPostsUser allPostsUser;

  AllUserPostsLoaded(this.allPostsUser);
  @override
  List<Object?> get props => [allPostsUser];
}
class AllUserPostsLoadError extends DetailsState {
  final String message;
  AllUserPostsLoadError({required this.message});
  @override
  List<Object?> get props => [message];
}
