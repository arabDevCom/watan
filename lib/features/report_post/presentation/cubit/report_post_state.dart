part of 'report_post_cubit.dart';

abstract class ReportPostState {}

class ReportPostInitial extends ReportPostState {}

class NewImagePicked extends ReportPostState {}

class ReportPostLoading extends ReportPostState {}
class ReportPostLoaded extends ReportPostState {}
class ReportPostError extends ReportPostState {}
