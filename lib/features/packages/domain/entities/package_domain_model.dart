import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/package_data_model.dart';

Package packageFromJson(String str) => PackageModel.fromJson(json.decode(str));

String packageToJson(PackageModel data) => json.encode(data.toJson());

class Package extends Equatable{
  Package({
    required this.data,
  });

  List<PackageDatumModel>? data;

  @override
  List<Object?> get props => [data];

}

class PackageDatum {
  PackageDatum({
    required this.id,
    required this.value,
    required this.type,
    required this.numberOfDays,
    required this.createdAt,
    required this.updatedAt,
  });

  late int id;
  late String value;
  late String type;
  late int numberOfDays;
  late DateTime createdAt;
  late DateTime updatedAt;
}
