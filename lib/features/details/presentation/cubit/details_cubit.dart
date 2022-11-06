import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/map_failure_message.dart';
import '../../../home_page/data/models/main_item_data_model.dart';
import '../../domain/entities/all_posts_for_user.dart';
import '../../domain/entities/more_posts.dart';
import '../../domain/use_cases/all_posts_for_user_use_case.dart';
import '../../domain/use_cases/increase_view_use_case.dart';
import '../../domain/use_cases/more_posts_use_case.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.increaseViewUseCase, this.morePostsUseCase,
      this.allPostsForUserUseCase)
      : super(DetailsInitial());

  final IncreaseViewUseCase increaseViewUseCase;
  final MorePostsUseCase morePostsUseCase;
  final AllPostsForUserUseCase allPostsForUserUseCase;

  List<MainItemModel> moreAds = [];

  // increaseViewsOfAds(String id) async {
  //   await increaseViewUseCase(id).then((value) => morePostsDetails(id));
  // }

  morePostsDetails(String id) async {
    emit(MorePostsDetailsLoading());
    var response = await morePostsUseCase(id);
    emit(
      response.fold(
        (failure) => MorePostsDetailsLoadError(
          message: MapFailureMessage.mapFailureToMessage(failure),
        ),
        (morePosts) {
          moreAds = morePosts.data!.moreAds!;
          return MorePostsDetailsLoaded(morePosts);
        },
      ),
    );
  }

  allUserPosts(String id) async {
    emit(AllUserPostsLoading());
    final response = await allPostsForUserUseCase(id);
    emit(
      response.fold(
        (failure) => AllUserPostsLoadError(
          message: MapFailureMessage.mapFailureToMessage(failure),
        ),
        (allUserPosts) => AllUserPostsLoaded(allUserPosts),
      ),
    );
  }
}
