import 'package:flutter/material.dart';
import 'package:flutter_auth_cubits/common/repository/current_auth/current_auth_repository_implement.dart';
import 'package:flutter_auth_cubits/common/service/current_auth_api_service.dart';
import 'package:flutter_auth_cubits/ui/profile/cubit/profile_cubit.dart';
import 'package:flutter_auth_cubits/ui/profile/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  final String accessToken;

  const ProfileView({Key? key, required this.accessToken}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    print('GELDIMI: ${widget.accessToken}');
    _profileCubit = ProfileCubit(
      CurrentAuthRepositoryImplements(
        currentAuthService: CurrenrAuthApiService(),
      ),
    );
    _profileCubit.getCurrentUser(widget.accessToken);
  }

  @override
  void dispose() {
    _profileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _profileCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, currentState) {
            if (currentState is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            ///else if (currentState is ProfileSuccess) {
            /// return ederek UI GOSTERİLECEK
            //}
            else if (currentState is ProfileFailed) {
              return const Center(child: Text('Failed to load profile.'));
            } else {
              return const Center(child: Text('Unknown state.'));
            }
          },
        ),
      ),
    );
  }
}
