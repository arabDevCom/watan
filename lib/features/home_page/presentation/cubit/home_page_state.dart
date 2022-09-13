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

class NewsPopularItemsLoaded extends HomePageState {
  final NewPopularItems newPopularItems;

  NewsPopularItemsLoaded({required this.newPopularItems});

  @override
  List<Object> get props => [newPopularItems];
}

class FinishingData extends HomePageState {
  final HomeSlider slider;
  final Categories categories;
  final NewPopularItems newPopularItems;

  FinishingData({required this.newPopularItems,required this.slider, required this.categories});

}
