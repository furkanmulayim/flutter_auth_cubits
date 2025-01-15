import 'package:flutter_auth_cubits/common/model/current_auth_model.dart';
import 'package:flutter_auth_cubits/common/repository/current_auth/current_auth_repository.dart';
import 'package:flutter_auth_cubits/common/service/current_auth_api_service.dart';

class CurrentAuthRepositoryImplements extends CurrentAuthRepository {
  final CurrenrAuthApiService currentAuthService;

  CurrentAuthRepositoryImplements({required this.currentAuthService});

  @override
  Future<CurrentAuthModel> getCurrentUser(String accessToken) async {
    return await currentAuthService.fetchUserData(accessToken);
  }
}
