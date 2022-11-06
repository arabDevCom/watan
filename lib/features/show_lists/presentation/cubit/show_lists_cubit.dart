import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/map_failure_message.dart';
import '../../../home_page/data/models/main_project_item_data_model.dart';
import '../../../home_page/domain/entities/main_item_domain_model.dart';
import '../../../show_more_posts/data/models/show_more_data_model.dart';
import '../../data/models/show_list_projects_data_model.dart';
import '../../domain/use_cases/pagination_show_list_use_case.dart';
import '../../domain/use_cases/pagination_show_projects_list_use_case.dart';
import '../../domain/use_cases/show_lists_use_case.dart';
import '../../domain/use_cases/show_projects_lists_use_case.dart';

part 'show_lists_state.dart';

class ShowListsCubit extends Cubit<ShowListsState> {
  ShowListsCubit(this.getShowListsUseCase, this.getPaginationShowListUseCase, this.getShowProjectsListsUseCase, this.getPaginationShowProjectsListUseCase)
      : super(ShowListsInitial()){
    getShowListsData(pram: kind);
  }

  String kind='';
  final GetShowListsUseCase getShowListsUseCase;
  final GetPaginationShowListUseCase getPaginationShowListUseCase;
  final GetShowProjectsListsUseCase getShowProjectsListsUseCase;
  final GetPaginationShowProjectsListUseCase getPaginationShowProjectsListUseCase;
  bool isLoadingVertical = false;
  late ShowMoreDataModel showLists;
  List<MainItem> mainItemsList = [];
  List<MainItem> newMainItemsList = [];

  late ShowProjectsListDataModel showProjectLists;
  List<MainProjectItemModel> mainProjectItemsList = [];
  List<MainProjectItemModel> newMainProjectItemsList = [];


  Future<void> getShowListsData({required String pram}) async {
    emit(ShowListsLoading());
    Either<Failure, ShowMoreDataModel> response = await getShowListsUseCase(pram);
    emit(
      response.fold(
        (failure) => ShowListsLoadedError(
            message: MapFailureMessage.mapFailureToMessage(failure)),
        (showLists) {
          this.showLists = showLists;
          mainItemsList = showLists.mainItem!;
          return ShowListsLoaded(showLists: showLists);
        },
      ),
    );
  }

  Future<void> getPaginationShowListsData({required String pram}) async {
    Either<Failure, ShowMoreDataModel> response =
        await getPaginationShowListUseCase(pram);
    emit(
      response.fold(
        (failure) => ShowListsLoadedError(
            message: MapFailureMessage.mapFailureToMessage(failure)),
        (showLists) {
          this.showLists = showLists;
          newMainItemsList = showLists.mainItem!;
          loadMoreVertical();
          return ShowListsLoaded(showLists: showLists);
        },
      ),
    );
  }

 Future<void> getShowProjectListsData({required String pram}) async {
    emit(ShowListsLoading());
    Either<Failure, ShowProjectsListDataModel> response = await getShowProjectsListsUseCase(pram);
    emit(
      response.fold(
        (failure) => ShowListsLoadedError(
            message: MapFailureMessage.mapFailureToMessage(failure)),
        (showProjectLists) {
          this.showProjectLists = showProjectLists;
          mainProjectItemsList = showProjectLists.mainProjectItem!;
          return ShowProjectListsLoaded(showProjectLists: showProjectLists);
        },
      ),
    );
  }

  Future<void> getPaginationProjectShowListsData({required String pram}) async {
    Either<Failure, ShowProjectsListDataModel> response =
        await getPaginationShowProjectsListUseCase(pram);
    emit(
      response.fold(
        (failure) => ShowListsLoadedError(
            message: MapFailureMessage.mapFailureToMessage(failure)),
        (showProjectLists) {
          this.showProjectLists = showProjectLists;
          newMainProjectItemsList = showProjectLists.mainProjectItem!;
          loadMoreProjectVertical();
          return ShowProjectListsLoaded(showProjectLists: showProjectLists);
        },
      ),
    );
  }

  loadMoreVertical() async {
    changeBool(isLoadingVertical);
    mainItemsList = List.from(mainItemsList)..addAll(newMainItemsList);
    changeBool(isLoadingVertical);
  }

  loadMoreProjectVertical() async {
    changeBool(isLoadingVertical);
    mainProjectItemsList = List.from(mainProjectItemsList)..addAll(newMainProjectItemsList);
    changeBool(isLoadingVertical);
  }

  changeBool(bool theChangeBoolean) {
    isLoadingVertical = !theChangeBoolean;
    emit(ChangeBoolean());
  }
}
