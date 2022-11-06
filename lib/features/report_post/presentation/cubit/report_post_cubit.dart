import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../login/data/models/login_data_model.dart';
import '../../data/models/report_data_model.dart';
import '../../domain/use_cases/post_report_use_case.dart';

part 'report_post_state.dart';

class ReportPostCubit extends Cubit<ReportPostState> {
  ReportPostCubit(this.postReportUseCase) : super(ReportPostInitial()) {
    getStoreUser();
  }

  XFile? image;
  final picker = ImagePicker();
  final PostReportUseCase postReportUseCase;
  TextEditingController reasonController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  late LoginDataModel loginDataModel;

  String projectId = '';
  String userId = '';
  String postType = '';

  getImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    emit(NewImagePicked());
  }

  Future<LoginDataModel> getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginDataModel loginDataModel;
    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      loginDataModel = LoginDataModel.fromJson(userMap);
      this.loginDataModel = loginDataModel;
    } else {
      loginDataModel = LoginDataModel.fromJson(const {});
    }
    return loginDataModel;
  }

  postReportPost() async {
    emit(ReportPostLoading());
    final response = await postReportUseCase(
      ReportPostModel(
        title: reasonController.text,
        description: detailsController.text,
        image: image != null ? image!.path : "",
        token: loginDataModel.data!.accessToken,
        postId: userId,
        projectId: projectId,
        type: postType,
      ),
    );
    response.fold(
      (failure) => emit(ReportPostError()),
      (statusResponse) => emit(ReportPostLoaded()),
    );
  }
}
