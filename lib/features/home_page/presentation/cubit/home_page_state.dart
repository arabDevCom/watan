part of 'home_page_cubit.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}


class HomePageSliderLoaded extends HomePageState {
  final HomeSlider slider;
  HomePageSliderLoaded({required this.slider});
  @override
  List<Object> get props => [slider];
}
class HomePageCategoriesLoaded extends HomePageState {
  final Categories categories;

  HomePageCategoriesLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}
class HomePageNewsPopularItemsLoaded extends HomePageState {
  final NewPopularItems newPopularItems;

  HomePageNewsPopularItemsLoaded({required this.newPopularItems});

  @override
  List<Object> get props => [newPopularItems];
}

class HomePageError extends HomePageState {
  final String message;

  HomePageError({required this.message});
  @override
  List<Object> get props => [message];
}


class HomePageGetAllDataFinish extends HomePageState {
 final HomeSlider slider;
 final Categories categories;
 final NewPopularItems newPopularItems;

  HomePageGetAllDataFinish(this.slider, this.categories, this.newPopularItems);
 @override
 List<Object> get props => [slider,categories,newPopularItems];
}