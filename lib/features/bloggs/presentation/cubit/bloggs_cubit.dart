import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elwatn/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/map_failure_message.dart';
import '../../domain/entities/bloggs_domain_model.dart';
import '../../domain/use_cases/get_bloggs_use_case.dart';

part 'bloggs_state.dart';

class BloggsCubit extends Cubit<BloggsState> {
  BloggsCubit({required this.baseBloggsUseCase}) : super(BloggsInitial());

  final GetBloggsUseCase baseBloggsUseCase;

  Future<void> getBloggs() async {
    emit(BloggsLoading());
    Either<Failure, Bloggs> response = await baseBloggsUseCase(NoParams());
    emit(
      response.fold(
        (failure) => BloggsFailure(MapFailureMessage.mapFailureToMessage(failure)),
        (bloggs) => BloggsLoaded(bloggs),
      ),
    );
  }

}
