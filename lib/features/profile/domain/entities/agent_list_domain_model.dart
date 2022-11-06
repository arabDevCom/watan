import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../home_page/data/models/main_item_data_model.dart';
import '../../data/models/agent_list_data_model.dart';

AgentProfileListModel filterResponseFromJson(String str) => AgentProfileListModel.fromJson(json.decode(str));

String filterResponseToJson(AgentProfileListModel data) => json.encode(data.toJson());

class AgentProfileList extends Equatable{
  const AgentProfileList({
    required this.data,
  });

  final List<AgentModel>? data;

  @override
  List<Object?> get props => [data];


}
