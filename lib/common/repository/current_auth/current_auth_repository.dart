import 'package:flutter_auth_cubits/common/model/current_auth_model.dart';

abstract class CurrentAuthRepository {
  Future<CurrentAuthModel> getCurrentUser(String accessToken);
}
