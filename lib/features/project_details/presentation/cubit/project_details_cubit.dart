import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/map_failure_message.dart';
import '../../../home_page/domain/entities/main_project_item_domain_model.dart';
import '../../domain/entities/all_project_posts.dart';
import '../../domain/entities/more_project_posts.dart';
import '../../domain/use_cases/all_posts_for_project_use_case.dart';
import '../../domain/use_cases/more_project_posts_use_case.dart';

part 'project_details_state.dart';

class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  ProjectDetailsCubit(this.moreProjectPostsUseCase, this.allPostsForProjectUseCase) : super(ProjectDetailsInitial());

  final MoreProjectPostsUseCase moreProjectPostsUseCase;
  final AllPostsForProjectUseCase allPostsForProjectUseCase;

  List<MainProjectItem> moreProject = [];

  moreProjectPostsDetails(String id) async {
    emit(ProjectMorePostsDetailsLoading());
    var response = await moreProjectPostsUseCase(id);
    emit(
      response.fold(
            (failure) => ProjectMorePostsDetailsLoadError(
          message: MapFailureMessage.mapFailureToMessage(failure),
        ),
            (moreProjectPosts) {
              moreProject = moreProjectPosts.data!.moreProject!;
          return ProjectMorePostsDetailsLoaded(moreProjectPosts);
        },
      ),
    );
  }

  allProjectPosts(String id) async {
    emit(ProjectAllUserPostsLoading());
    final response = await allPostsForProjectUseCase(id);
    emit(
      response.fold(
            (failure) => ProjectAllUserPostsLoadError(
          message: MapFailureMessage.mapFailureToMessage(failure),
        ),
            (allProjectUserPosts) => ProjectAllUserPostsLoaded(allProjectUserPosts),
      ),
    );
  }
}