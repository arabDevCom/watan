import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/categories_domain_model.dart';
import '../../domain/entities/slider_domain_model.dart';
import '../../domain/use_cases/get_categories_use_case.dart';
import '../../domain/use_cases/get_slider_use_case.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.getCategoriesUseCase, required this.getSliderUseCase})
      : super(HomePageInitial());

  final GetSliderUseCase getSliderUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  HomeSlider? slider;
  Categories? categories;

  Future<void> getSliderData() async {
    emit(HomePageLoading());
    Either<Failure, HomeSlider> response = await getSliderUseCase(NoParams());

    emit(response.fold(
        (failure) => HomePageError(message:_mapFailureToMessage(failure)),
        (slider) => HomePageLoaded(slider: slider)));
  }

  Future<void> getCategoriesData() async {
    emit(HomePageLoading());
    Either<Failure, Categories> response =
        await getCategoriesUseCase(NoParams());
    emit(response.fold(
        (failure) => HomePageError(message:_mapFailureToMessage(failure)),
        (categories) => CategoriesLoaded(categories: categories)));
  }

  getAllMethodsOfData() {
    getSliderData();
    getCategoriesData();
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
  finishingData(){
    if(slider!=null&&categories!=null){
      emit(FinishingData());
    }
  }

}
