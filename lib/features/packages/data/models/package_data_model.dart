import '../../domain/entities/package_domain_model.dart';

class PackageModel extends Package {
  PackageModel({required super.data});

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        data: List<PackageDatumModel>.from(
            json["data"].map((x) => PackageDatumModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PackageDatumModel extends PackageDatum {
  PackageDatumModel({
    required super.id,
    required super.value,
    required super.type,
    required super.numberOfDays,
    required super.createdAt,
    required super.updatedAt,
  });
  factory PackageDatumModel.fromJson(Map<String, dynamic> json) => PackageDatumModel(
    id: json["id"],
    value: json["price"],
    type: json["type"],
    numberOfDays: json["number_of_days"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": value,
    "type": type,
    "number_of_days": numberOfDays,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

}
