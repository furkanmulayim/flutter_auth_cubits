import 'package:flutter/material.dart';
import 'package:flutter_auth_cubits/common/repository/current_auth/current_auth_repository_implement.dart';
import 'package:flutter_auth_cubits/common/service/current_auth_api_service.dart';
import 'package:flutter_auth_cubits/ui/profile/cubit/profile_cubit.dart';
import 'package:flutter_auth_cubits/ui/profile/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  final String accessToken;

  const ProfileView({super.key, required this.accessToken});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    _profileCubit = ProfileCubit(
      CurrentAuthRepositoryImplements(
        currentAuthService: CurrenrAuthApiService(),
      ),
    );
    if (widget.accessToken.isNotEmpty) {
      _profileCubit.getCurrentUser(widget.accessToken);
    }
  }

  @override
  void dispose() {
    _profileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profileCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, currentState) {
            if (currentState is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (currentState is ProfileSuccess) {
              debugPrint("PROFILE SUCCESS :D ");
            } else if (currentState is ProfileFailed) {
              return const Center(child: Text('Failed to load profile.'));
            }
            return const Center(child: Text('GENEL'));
          },
        ),
      ),
    );
  }
}
