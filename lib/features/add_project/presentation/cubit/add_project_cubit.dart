import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/response_message.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/map_failure_message.dart';
import '../../../add/domain/entities/add_ads_model.dart';
import '../../../add/domain/use_cases/add_project_use_case.dart';
import '../../../filter/data/models/amenities_data_model.dart';
import '../../../filter/data/models/cities_data_model.dart';
import '../../../filter/data/models/cities_location_data_model.dart';
import '../../../filter/domain/use_cases/get_amenities_use_case.dart';
import '../../../filter/domain/use_cases/get_cities_location_use_case.dart';
import '../../../filter/domain/use_cases/get_cities_use_case.dart';
import '../../../login/data/models/login_data_model.dart';

part 'add_project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit(
    this.getCitiesUseCase,
    this.getAmenitiesUseCase,
    this.getCitiesLocationUseCase,
    this.addProjectUseCase,
  ) : super(AddProjectInitial()) {
    getAllFilterCities();
    getAllFilterAmenities();
  }

  final GetCitiesUseCase getCitiesUseCase;
  final GetAmenitiesUseCase getAmenitiesUseCase;
  final GetCitiesLocationUseCase getCitiesLocationUseCase;
  final AddProjectUseCase addProjectUseCase;

  late CitiesFilterModel citiesFilterModel;
  late CitiesLocationsModel citiesLocationsModel;
  AmenitiesFilterModel? amenitiesFilterModel;

  bool isCitiesDropdown = false;
  bool isCitiesLocationsDropdown = false;

  List<String> citiesEn = [];
  List<String> citiesAr = [];
  List<String> citiesKu = [];
  List<String> citiesLocationEn = [];
  List<String> citiesLocationAr = [];
  List<String> citiesLocationKu = [];
  List<int> amenitiesId = [];
  List<MultipartFile> images = [];
  List<MultipartFile> floorPlans = [];
  List<String> paymentPlanTitle = [];
  List<String> paymentPlanPresent = [];
  List<int> unitPlanPrice = [];
  List<int> unitPlanArea = [];
  List<String> unitPlanBedroom = [];
  List<String> unitPlanBathroom = [];

  late List<String> image;
  late List<String> floorPlan;
  XFile? video;
  LoginDataModel? loginDataModel;

  String statusProject = 'new';
  String currency = '';
  int cityId = 0;
  int locationId = 0;
  int type = -1;
  int propertySelected = -1;

  String btnText = '';
  int selectedCityIndex = 0;
  int selectedLocationIndex = 0;


  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController paymentTitleController = TextEditingController();
  TextEditingController paymentPresentController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();

  getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginDataModel loginDataModel;
    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      loginDataModel = LoginDataModel.fromJson(userMap);
      this.loginDataModel = loginDataModel;
    }
  }

  convertImage(String path) async {
    MultipartFile image = MultipartFile.fromFileSync(path);
    images.add(image);
  }

  convertFloorPlan(String path) async {
    MultipartFile floorPlan = MultipartFile.fromFileSync(path);
    floorPlans.add(floorPlan);
  }

  getCities() {
    for (var element in citiesFilterModel.data!) {
      citiesEn.add("${element.nameEn!}/${element.id}/");
      citiesAr.add("${element.nameAr!}/${element.id}/");
      citiesKu.add("${element.nameKu!}/${element.id}/");
    }
  }

  getCitiesLocations() {
    for (var element in citiesLocationsModel.data!) {
      citiesLocationEn.add("${element.nameEn!}/${element.id}/");
      citiesLocationAr.add("${element.nameAr!}/${element.id}/");
      citiesLocationKu.add("${element.nameKu!}/${element.id}/");
    }
  }

  clearCitiesLocations() {
    citiesLocationEn.clear();
    citiesLocationAr.clear();
    citiesLocationKu.clear();
  }

  getAllFilterCities() async {
    emit(AddProjectCitiesLoading());
    Either<Failure, CitiesFilterModel> response =
        await getCitiesUseCase(NoParams());
    emit(
      response.fold(
          (failure) => AddProjectCitiesError(
              MapFailureMessage.mapFailureToMessage(failure)),
          (citiesFilterModel) {
        this.citiesFilterModel = citiesFilterModel;
        getCities();
        isCitiesDropdown = true;
        return AddProjectCitiesLoaded(citiesFilterModel);
      }),
    );
  }

  getAllLocationOfCitiesById(String id) async {
    emit(AddProjectCitiesLocationLoading());
    Either<Failure, CitiesLocationsModel> response =
        await getCitiesLocationUseCase(id);
    emit(
      response.fold(
          (failure) => AddProjectCitiesLocationError(
              MapFailureMessage.mapFailureToMessage(failure)),
          (citiesLocationsModel) {
        this.citiesLocationsModel = citiesLocationsModel;
        getCitiesLocations();
        isCitiesLocationsDropdown = true;
        return AddProjectCitiesLocationLoaded(citiesLocationsModel);
      }),
    );
  }

  getAllFilterAmenities() async {
    emit(AddProjectAmenitiesLoading());
    Either<Failure, AmenitiesFilterModel> response =
        await getAmenitiesUseCase(NoParams());
    emit(
      response.fold(
          (failure) => AddProjectAmenitiesError(
              MapFailureMessage.mapFailureToMessage(failure)),
          (amenitiesFilterModel) {
        this.amenitiesFilterModel = amenitiesFilterModel;
        return AddProjectAmenitiesLoaded(amenitiesFilterModel);
      }),
    );
  }

  addProjectPost(String token) async {
    emit(AddProjectPostLoading());
    final response = await addProjectUseCase(AddAdsModel(
      projectStatus: statusProject,
      areaId: cityId,
      subAreaId: locationId,
      type: type,
      titleAr: titleController.text,
      titleEn: titleController.text,
      titleKu: titleController.text,
      descriptionAr: descController.text,
      descriptionEn: descController.text,
      descriptionKu: descController.text,
      areaRange:unitPlanArea.isEmpty?'0':
          "${unitPlanArea.reduce((value, element) => min(value, element))} - ${unitPlanArea.reduce((value, element) => max(value, element))}",
      paymentTitleList: paymentPlanTitle,
      paymentPresentList: paymentPlanPresent,
      unitPlanAreaList: unitPlanArea,
      unitPlanPriceList: unitPlanPrice,
      unitPlanBathroomList: unitPlanBathroom,
      unitPlanBedroomList: unitPlanBedroom,
      minPrice: unitPlanPrice.isEmpty?'0':unitPlanPrice
          .reduce((value, element) => min(value, element))
          .toString(),
      maxPrice: unitPlanPrice.isEmpty?'0':unitPlanPrice
          .reduce((value, element) => max(value, element))
          .toString(),
      amenities: amenitiesId,
      images: images,
      floorPlans: floorPlan,
      floorPlanesImage: floorPlans,
      videos: video != null ? [video!.path] : [],
      longitude: 30.123,
      latitude: 20.123,
      phone: phoneController.text,
      whatsapp: whatsappController.text,
      token: token,
    ));
    response.fold(
      (failure) {
        emit(
          AddProjectPostError(
            MapFailureMessage.mapFailureToMessage(failure),
          ),
        );
        Future.delayed(
          const Duration(seconds: 2),
          () {
            changeState();
          },
        );
      },
      (status) {
        if (status.code == 200) {
          emit(AddProjectPostLoaded(status));
          Future.delayed(
            const Duration(seconds: 1),
            () {
              changeState();
            },
          );
        } else {
          emit(AddProjectPostErrorResponse(status));
          Future.delayed(
            const Duration(seconds: 1),
            () {
              changeState();
            },
          );
        }
      },
    );
  }

  changeState() {
    titleController.clear();
    descController.clear();
    paymentTitleController.clear();
    paymentPresentController.clear();
    nameController.clear();
    phoneController.clear();
    whatsappController.clear();
    video = null;
    cityId = 0;
    locationId = 0;
    type = -1;
    statusProject = 'new';
    unitPlanBedroom.clear();
    unitPlanBathroom.clear();
    unitPlanPrice.clear();
    unitPlanArea.clear();
    paymentPlanTitle.clear();
    paymentPlanPresent.clear();
    floorPlan.clear();
    floorPlans.clear();

    propertySelected = -1;
    emit(ProjectChangeState());
  }

  addPaymentPlans() {
    paymentPlanTitle.add(paymentTitleController.text);
    paymentPlanPresent.add(paymentPresentController.text);
    paymentTitleController.clear();
    paymentPresentController.clear();
  }

  removePaymentPlans(int index) {
    paymentPlanTitle.removeAt(index);
    paymentPlanPresent.removeAt(index);
  }

  addUnitPlan() {
    unitPlanPrice.add(int.parse(priceController.text));
    unitPlanArea.add(int.parse(areaController.text));
    unitPlanBedroom.add(bedroomController.text);
    unitPlanBathroom.add(bathroomController.text);
    priceController.clear();
    areaController.clear();
    bedroomController.clear();
    bathroomController.clear();
    emit(ChangePaymentState());
    Future.delayed(const Duration(seconds: 1), () {
      emit(ChangeUnitPlanState());
    });
  }

  removeUnitPlan(int index) {
    unitPlanPrice.removeAt(index);
    unitPlanArea.removeAt(index);
    unitPlanBedroom.removeAt(index);
    unitPlanBathroom.removeAt(index);
    emit(ChangePaymentState());
    Future.delayed(const Duration(seconds: 1), () {
      emit(ChangeUnitPlanState());
    });
  }
}
