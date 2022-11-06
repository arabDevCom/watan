import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/map_failure_message.dart';
import '../../data/models/contact_us_data_model.dart';
import '../../domain/use_cases/post_contact_us_use_case.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this.postContactUSUseCase) : super(ContactUsInitial());

  final PostContactUSUseCase postContactUSUseCase;

  Future<void> postContactUs(ContactUsDataModel contactUsDataModel) async {
    emit(ContactUsLoading());
    final response = await postContactUSUseCase(contactUsDataModel);
    emit(
      response.fold(
        (failure) => ContactUsError(
          MapFailureMessage.mapFailureToMessage(failure),
        ),
        (contactUsModel) {
          Future.delayed(
            const Duration(milliseconds: 700),
                () {
              messageSendSuccessfully();
            },
          );
          return ContactUsLoaded(contactUsModel);
        },
      ),
    );
  }

  messageSendSuccessfully(){
    emit(ContactUsInitial());
  }
}
