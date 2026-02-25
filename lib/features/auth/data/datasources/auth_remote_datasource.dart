import 'dart:async';

class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (email == 'network@error.com') throw TimeoutException('No network');
    if (password != 'password123') throw Exception('Invalid credentials');
    return {
      'access_token': 'mock_access_token',
      'refresh_token': 'mock_refresh_token',
      'user': {
        'id': '1',
        'name': 'Awa Fall',
        'email': email,
        'role': 'admin',
        'phone': '+221770000001',
      }
    };
  }

  Future<Map<String, dynamic>> register(String name, String email, String password, String role) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return {
      'access_token': 'mock_access_token',
      'refresh_token': 'mock_refresh_token',
      'user': {'id': '2', 'name': name, 'email': email, 'role': role}
    };
  }

  Future<void> forgotPassword(String email) async => Future.delayed(const Duration(milliseconds: 300));
}
