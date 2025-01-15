import 'package:bloc/bloc.dart';
import 'package:flutter_auth_cubits/common/repository/current_auth/current_auth_repository.dart';
import 'package:flutter_auth_cubits/ui/profile/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final CurrentAuthRepository currentAuthRepository;

  ProfileCubit(this.currentAuthRepository) : super(ProfileInitial());

  Future<void> getCurrentUser(String accessToken) async {
    emit(ProfileLoading());
    try {
      final currentUserDetail =
          await currentAuthRepository.getCurrentUser(accessToken);
      emit(ProfileSuccess(currentUser: currentUserDetail));
    } catch (e) {
      emit(ProfileFailed());
      rethrow;
    }
  }
}
