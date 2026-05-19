import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api/dio_client.dart';
import '../core/constants/api_constants.dart';

class AuthService {
  final DioClient _dioClient = DioClient();

  Future<Map<String, dynamic>> login(String email, String password) async {
    // Test Credentials Bypass
    if (email == 'test@test.com' && password == '123456') {
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', 'fake_test_token_123');
      return {'success': true, 'data': {'message': 'Test login successful'}};
    }

    try {
      final response = await _dioClient.dio.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        // Save token to SharedPreferences assuming the API returns a token
        final token = response.data['token'] ?? response.data['data']?['token'];
        if (token != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
        }
        return {'success': true, 'data': response.data};
      }
      return {'success': false, 'message': 'Invalid response from server'};
    } on DioException catch (e) {
      String errorMessage = 'Login failed. Network or Server error.';
      if (e.response?.statusCode == 500) {
        errorMessage = 'Server is experiencing issues (500 Error). Please try again later.';
      } else if (e.response != null && e.response?.data != null && e.response?.data is Map && e.response?.data['message'] != null) {
        errorMessage = e.response?.data['message'];
      }
      return {'success': false, 'message': errorMessage};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }
}
