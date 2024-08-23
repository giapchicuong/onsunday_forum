import 'package:dio/dio.dart';
import 'package:onsunday_forum/features/auth/dtos/login_dto.dart';
import 'package:onsunday_forum/features/auth/dtos/login_success_dto.dart';

class AuthApiClient {
  final Dio dio;

  AuthApiClient(this.dio);

  Future<LoginSuccessDto> login(LoginDto loginDto) async {
    final response = await dio.post('/auth/login', data: {
      'username': loginDto.username,
      'password': loginDto.password,
    });

    return LoginSuccessDto.fromJson(response.data);
  }
}
