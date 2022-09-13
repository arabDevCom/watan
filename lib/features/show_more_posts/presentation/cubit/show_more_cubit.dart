import 'package:dartz/dartz.dart';
import 'package:elwatn/features/home_page/domain/entities/main_item_domain_model.dart';
import 'package:elwatn/features/show_more_posts/domain/use_cases/show_more_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/show_more_domain_model.dart';
import '../../domain/use_cases/pagination_use_case.dart';

part 'show_more_state.dart';

class ShowMoreCubit extends Cubit<ShowMoreState> {
  ShowMoreCubit({required this.getPaginationUseCase,required this.getShowMoreUseCase}) : super(ShowMoreInitial());
  final GetShowMoreUseCase getShowMoreUseCase;
  final GetPaginationUseCase getPaginationUseCase;

  bool isLoadingVertical= false;
  late ShowMore showMore;
  List<MainItem> mainItemsList=[];
  List<MainItem> newMainItemsList=[];
  late ShowMore newShowMore;

  Future<void> getShowMoreData({required String pram}) async {
    emit(ShowMoreLoading());
    Either<Failure, ShowMore> response = await getShowMoreUseCase(pram);
    emit(
      response.fold(
        (failure) =>
            ShowMoreLoadedError(message: _mapFailureToMessage(failure)),
        (showMore) {
          this.showMore=showMore;
          mainItemsList=showMore.data!.mainItem!;
          return ShowMoreLoaded(showMore: showMore);
        },
      ),
    );
  }

  Future<void> getPaginationData({required String pram}) async {
    emit(PaginationLoading());
    Either<Failure, ShowMore> response = await getPaginationUseCase(pram);
    emit(
      response.fold(
            (failure) =>
            ShowMoreLoadedError(message: _mapFailureToMessage(failure)),
            (showMore) {
             newShowMore=showMore;
             newMainItemsList=showMore.data!.mainItem!;
             loadMoreVertical();
             return PaginationLoaded(showMore: showMore);
        },
      ),
    );
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

   loadMoreVertical()  async {
    changeBool(isLoadingVertical);
    // await Future.delayed(const Duration(seconds: 3));
    mainItemsList =List.from(mainItemsList)..addAll(newMainItemsList);
    changeBool(isLoadingVertical);
  }

  changeBool(bool theChangeBoolean){
    isLoadingVertical=!theChangeBoolean;
    emit(ChangeBoolean());
  }
}
