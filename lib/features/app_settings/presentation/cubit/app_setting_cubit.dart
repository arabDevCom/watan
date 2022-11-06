import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/map_failure_message.dart';
import '../../data/models/app_setting_data_model.dart';
import '../../domain/use_cases/get_app_settings_use_case.dart';

part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit({required this.getAppSettingUseCase})
      : super(AppSettingInitial()){
    getAllAppSettingData();
  }

  final GetAppSettingsUseCase getAppSettingUseCase;

  getAllAppSettingData() async {
    emit(AppSettingLoading());
    Either<Failure, AppSettingModel> response =
        await getAppSettingUseCase(NoParams());
    emit(
      response.fold(
        (failure) => AppSettingError(
          MapFailureMessage.mapFailureToMessage(failure),
        ),
        (appSettingModel) => AppSettingLoaded(appSettingModel),
      ),
    );
  }
}
