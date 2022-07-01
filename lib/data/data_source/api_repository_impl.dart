import 'dart:developer';

import 'package:dynamic_form/data/exceptions/auth_exception.dart';
import 'package:dynamic_form/data/repository/api_repository/api_storage_repo.dart';
import 'package:dynamic_form/data/response/login_response.dart';
import 'package:dynamic_form/data/request/login_request.dart';

class ApiRepositoryImpl extends ApiRepository {
  @override
  Future<dynamic> getUserFromToken(token) async {
    await Future.delayed(const Duration(seconds: 5));

    var user = {"name": "Kofi Annan", "age": "20"};
    var user1 = {"name": "Nana Amo", "age": "60"};

    if (token != "12345") {
      return user;
    } else if (token == "123456") {
      return user1;
    }
    throw AuthException();
  }

  @override
  Future<void> logOut() async {
    await Future.delayed(const Duration(seconds: 5));
    log("Removing token from server");
    return;
  }

  @override
  Future<LoginResponse> login(LoginRequest user) async {
    await Future.delayed(const Duration(seconds: 5));
    var user1 = {"name": "Kofi Annan", "age": "20"};

    if (user.phoneNumber == " 0541544404" && user.password == "123456") {
      return LoginResponse("12345", user1);
    }
    throw AuthException();
  }
}
