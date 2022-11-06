import 'package:dio/dio.dart';
import 'package:elwatn/core/api/base_api_consumer.dart';
import 'package:elwatn/core/api/end_points.dart';

import '../../domain/entities/add_package_model.dart';
import '../../domain/entities/package_domain_model.dart';
import '../models/package_data_model.dart';

abstract class BasePackageDataSource {
  Future<Package> getListOfPackage();

  Future<AddPackageModel> addPackage(AddPackageModel addPackageModel);
}

class PackageDataSource extends BasePackageDataSource {
  final BaseApiConsumer baseApiConsumer;

  PackageDataSource(this.baseApiConsumer);

  @override
  Future<Package> getListOfPackage() async {
    final response = await baseApiConsumer.get(EndPoints.packagesUrl);
    return PackageModel.fromJson(response);
  }

  @override
  Future<AddPackageModel> addPackage(AddPackageModel addPackageModel) async {
    final response = await baseApiConsumer.post(
      EndPoints.addPackageUrl,
      body: addPackageModel.toJson(),
      options: Options(
        headers: {"Authorization": addPackageModel.token},
      ),
    );
    return AddPackageModel.responseDataFromJson(response);
  }
}
