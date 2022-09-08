part of 'home_page_cubit.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final HomeSlider slider;

  HomePageLoaded({required this.slider});
  @override
  List<Object> get props => [slider];
}

class HomePageError extends HomePageState {
  final String message;

  HomePageError({required this.message});

  @override
  List<Object> get props => [message];
}

//Categories



class CategoriesLoaded extends HomePageState {
  final Categories categories;

  CategoriesLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

class FinishingData extends HomePageState {}
