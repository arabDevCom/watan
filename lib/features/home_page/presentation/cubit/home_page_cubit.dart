import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/categories_domain_model.dart';
import '../../domain/entities/new_popular_domain_model.dart';
import '../../domain/entities/slider_domain_model.dart';
import '../../domain/use_cases/get_add_and_popular_items_use_case.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import '../../domain/use_cases/get_slider_use_case.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(
      {required this.getNewAndPopularItemsUseCase,
      required this.getCategoriesUseCase,
      required this.getSliderUseCase})
      : super(HomePageInitial());

  final GetSliderUseCase getSliderUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetNewAndPopularItemsUseCase getNewAndPopularItemsUseCase;

  HomeSlider? slider;
  Categories? categories;
  NewPopularItems? newPopularItems;

  Future<void> getSliderData() async {
    emit(HomePageLoading());
    Either<Failure, HomeSlider> response = await getSliderUseCase(NoParams());

    emit(response.fold(
        (failure) => HomePageError(message: _mapFailureToMessage(failure)),
        (slider) {
      this.slider = slider;
      return HomePageLoaded(slider: slider);
    }));
  }

  Future<void> getCategoriesData() async {
    emit(HomePageLoading());
    Either<Failure, Categories> response =
        await getCategoriesUseCase(NoParams());
    emit(response.fold(
        (failure) => HomePageError(message: _mapFailureToMessage(failure)),
        (categories) {
      this.categories = categories;
      return CategoriesLoaded(categories: categories);
    }));
  }

  Future<void> getNewPopularItemsData() async {
    emit(HomePageLoading());
    Either<Failure, NewPopularItems> response =
        await getNewAndPopularItemsUseCase(NoParams());
    emit(response.fold(
        (failure) => HomePageError(message: _mapFailureToMessage(failure)),
        (newPopularItems) {
      this.newPopularItems = newPopularItems;
      return NewsPopularItemsLoaded(newPopularItems: newPopularItems);
    }));
  }

  getAllMethodsOfData() {
    getSliderData();
    getCategoriesData();
    getNewPopularItemsData();
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

  finishingData() {
    if (slider != null && categories != null && newPopularItems != null) {
      emit(FinishingData(
          slider: slider!,
          categories: categories!,
          newPopularItems: newPopularItems!));
    } else {
      print("not yet");
    }
  }
}
