import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:elwatn/core/models/response_message.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';
import '../../../home_page/data/models/main_item_data_model.dart';
import '../../../home_page/data/models/main_project_item_data_model.dart';
import '../../../login/data/models/login_data_model.dart';
import '../../domain/entities/favourites_model.dart';
import '../../domain/use_cases/change_favourite_state_use_case.dart';
import '../../domain/use_cases/my_favourites_use_case.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit(
      this.getMyFavouritesUseCase, this.changeStatusFavouritesUseCase)
      : super(FavouritesInitial()) {
    getStoreUser().then((value) {
      if (cubitKind != 'null') {
        getMyFavourites();
      }else{
        getFavourite='null';
      }
    });
  }

  final GetMyFavouritesUseCase getMyFavouritesUseCase;
  final ChangeStatusFavouritesUseCase changeStatusFavouritesUseCase;

  List<MainItemModel>? mainItemModel;
  List<MainProjectItemModel>? mainProjectItemModel;
  String message = '';
  bool favourite=false;
  String cubitKind ='';
  String getFavourite ='';

  LoginDataModel? loginDataModel;

  Future<void> getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginDataModel loginDataModel;
    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      loginDataModel = LoginDataModel.fromJson(userMap);
      this.loginDataModel = loginDataModel;
    }
  }

  getMyFavourites() async {
    getFavourite='';
    emit(FavouritesLoading());
    Either<Failure, FavouritesModel> response =
        await getMyFavouritesUseCase(loginDataModel!.data!.accessToken!);
    emit(
      response.fold(
        (failure) => FavouritesFailure(),
        (response) {
          mainItemModel = response.data!.postsFavourites;
          mainProjectItemModel = response.data!.projectsFavourites;
          return FavouritesLoaded();
        },
      ),
    );
  }

  Future<void> changeFavouritesStatus(String id, String modelKind) async {
    message = 'loading';
    if (loginDataModel != null) {
      Either<Failure, StatusResponse> response =
          await changeStatusFavouritesUseCase(
              [id, loginDataModel!.data!.accessToken!, modelKind]);
      response.fold((l) {
        return responseMessageFavourites('There are some Errors');
      }, (response) {
        response.code == 200
            ? responseMessageFavourites(response.message)
            : responseMessageFavourites(response.message);
      });
    } else {
      getStoreUser().whenComplete(() async {
        Either<Failure, StatusResponse> response =
            await changeStatusFavouritesUseCase(
                [id, loginDataModel!.data!.accessToken!, modelKind]);
        response.fold((l) {
          return responseMessageFavourites('There are some Errors');
        }, (response) {
          response.code == 200
              ? responseMessageFavourites(response.message)
              : responseMessageFavourites(response.message);
        });
      });
    }
  }

  String responseMessageFavourites(String message) {
    if (message == 'Success add to favorite') {
      favourite = true;
      this.message = message;
    } else if (message == 'Success remove from favorite') {
      favourite = false;
      this.message = message;
    } else {
      favourite = false;
      this.message = message;
    }
    return message;
  }
}
