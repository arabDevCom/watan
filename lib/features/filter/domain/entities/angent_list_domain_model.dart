// To parse this JSON data, do
//
//     final filterAgentList = filterAgentListFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/agent_list_data_model.dart';

FilterAgentList filterAgentListFromJson(String str) =>
    FilterAgentListModel.fromJson(json.decode(str));

String filterAgentListToJson(FilterAgentListModel data) =>
    json.encode(data.toJson());

class FilterAgentList extends Equatable{
  const FilterAgentList({
    required this.data,
  });

  final List<FilterAgentListDatumModel>? data;


  @override
  List<Object?> get props => [data];
}

class FilterAgentListDatum extends Equatable{
  const FilterAgentListDatum({
    required this.id,
    required this.name,
    required this.image,
    required this.about,
    required this.phone,
    required this.email,
    required this.languages,
    required this.password,
    required this.facebook,
    required this.instagram,
    required this.twitter,
    required this.snapchat,
    required this.phoneCode,
    required this.whatsapp,
    required this.userId,
    required this.companyId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? image;
  final String? about;
  final String? phone;
  final String? email;
  final List<String>? languages;
  final String? password;
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? snapchat;
  final String? phoneCode;
  final String? whatsapp;
  final int? userId;
  final int? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  @override
  List<Object?> get props => [
    id,
    name,
    image,
    about,
    phone,
    email,
    languages,
    password,
    facebook,
    instagram,
    twitter,
    snapchat,
    phoneCode,
    whatsapp,
    userId,
    companyId,
    createdAt,
    updatedAt,
  ];
}
