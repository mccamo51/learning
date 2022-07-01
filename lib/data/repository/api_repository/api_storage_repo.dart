import 'package:dynamic_form/data/request/login_request.dart';
import 'package:dynamic_form/data/response/login_response.dart';

abstract class ApiRepository {
  Future<dynamic> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest user);
  Future<void> logOut();
}
