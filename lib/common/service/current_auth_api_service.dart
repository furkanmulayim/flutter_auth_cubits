import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_cubits/common/model/current_auth_model.dart';

import '../../core/constants/api_constants.dart';

class CurrenrAuthApiService {
  final Dio _dio = Dio();

  Future<CurrentAuthModel> fetchUserData(String accessToken) async {
    try {
      final response = await _dio.get(
        ApiConstants.authMeUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      debugPrint('**** Current API Response **** : ${response.data}');
      if (response.statusCode == 200) {
        return CurrentAuthModel.fromMap(response.data);
      } else {
        throw Exception('Login failed: ${response.statusMessage}');
      }
    } catch (e) {
      debugPrint('Error during login: $e');
      if (e is DioException) {
        debugPrint('DioException: ${e.response?.data}');
      }
      rethrow;
    }
  }
}
