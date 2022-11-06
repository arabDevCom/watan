import '../../../home_page/data/models/main_item_data_model.dart';
import '../../domain/entities/agent_list_domain_model.dart';

class AgentProfileListModel extends AgentProfileList{
  AgentProfileListModel({required super.data});

  factory AgentProfileListModel.fromJson(Map<String, dynamic> json) => AgentProfileListModel(
    data: List<AgentModel>.from(json["data"].map((x) => AgentModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };

}