import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../core/constants/api_constants.dart';
import '../model/user_model.dart';

class AuthApiService {
  final Dio _dio = Dio();

  Future<UserModel> login(String username, String password) async {
    try {
      final response = await _dio.post(
        ApiConstants.authLoginUrl,
        data: {
          'username': username,
          'password': password,
          'expiresInMins': 30,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      debugPrint('**** API Response **** : ${response.data}');
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Login failed: ${response.statusMessage}');
      }
    } catch (e) {
      debugPrint('Error during login: $e');
      rethrow;
    }
  }
}
