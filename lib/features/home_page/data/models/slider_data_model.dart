import '../../domain/entities/slider_domain_model.dart';

class SliderModel extends HomeSlider {
  const SliderModel({
    super.data,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        data: List<DatumModel>.from(
            json["data"].map((x) => DatumModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumModel extends Datum {
  const DatumModel({
    super.image,
    super.link,
  });

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        image: json["image"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "link": link,
      };
}
