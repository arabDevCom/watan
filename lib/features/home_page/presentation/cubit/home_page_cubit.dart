import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/map_failure_message.dart';
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
      : super(HomePageInitial()) {
    getAllDataOfHomePage();
  }

  final GetSliderUseCase getSliderUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetNewAndPopularItemsUseCase getNewAndPopularItemsUseCase;

  HomeSlider? slider;
  Categories? categories;
  NewPopularItems? newPopularItems;

  getAllDataOfHomePage() {
    getSliderData().whenComplete(
      () => getCategoriesData().whenComplete(
        () => getNewPopularItemsData().whenComplete(
          () => emit(
              HomePageGetAllDataFinish(slider!, categories!, newPopularItems!)),
        ),
      ),
    );
  }

  Future<void> getSliderData() async {
    emit(HomePageLoading());
    Either<Failure, HomeSlider> response = await getSliderUseCase(NoParams());

    emit(
      response.fold(
        (failure) => HomePageError(
            message: MapFailureMessage.mapFailureToMessage(failure)),
        (slider) {
          this.slider = slider;
          return HomePageSliderLoaded(slider: slider);
        },
      ),
    );
  }

  Future<void> getCategoriesData() async {
    emit(HomePageLoading());
    Either<Failure, Categories> response =
        await getCategoriesUseCase(NoParams());
    emit(
      response.fold(
        (failure) => HomePageError(
            message: MapFailureMessage.mapFailureToMessage(failure)),
        (categories) {
          this.categories = categories;
          return HomePageCategoriesLoaded(categories: categories);
        },
      ),
    );
  }

  Future<void> getNewPopularItemsData() async {
    print("5555555");
    emit(HomePageLoading());
    Either<Failure, NewPopularItems> response =
        await getNewAndPopularItemsUseCase(NoParams());
    emit(
      response.fold(
        (failure) => HomePageError(
            message: MapFailureMessage.mapFailureToMessage(failure)),
        (newPopularItems) {
          print("ufufuufuwy");
          print(newPopularItems);
          this.newPopularItems = newPopularItems;
          return HomePageNewsPopularItemsLoaded(
              newPopularItems: newPopularItems);
        },
      ),
    );
  }
}
