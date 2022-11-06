part of 'package_cubit.dart';

abstract class PackageState extends Equatable{
  @override
  List<Object?> get props => [];
}

class PackageInitial extends PackageState {}

class PackageLoading extends PackageState {}
class PackageLoaded extends PackageState {
  final Package package;

  PackageLoaded(this.package);

  @override
  List<Object?> get props => [package];
}
class PackageError extends PackageState {}


class AddPackageLoaded extends PackageState {
  final AddPackageModel addPackageModel;

  AddPackageLoaded(this.addPackageModel);

  @override
  List<Object?> get props => [addPackageModel];
}


class PageDispose extends PackageState {}
