import 'package:flutter_auth_cubits/common/model/current_auth_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final CurrentAuthModel currentUser;

  ProfileSuccess({required this.currentUser});
}

class ProfileFailed extends ProfileState {}
