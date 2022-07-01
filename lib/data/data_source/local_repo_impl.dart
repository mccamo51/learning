import 'package:dynamic_form/data/repository/local_storage_repo/local_storage_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _prefToken = "token";
// const _prefUserName = "name";
const _prefUser = "user";

class LocalRepositoryImpl extends LocalStorageRepo {
  @override
  Future<void> clearAllData() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  @override
  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_prefToken) ?? "";
  }

  @override
  Future getUser() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_prefUser) ?? {};
  }

  @override
  Future saveUser(user) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(_prefUser, user);
    return user;
  }

  @override
  Future saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(_prefToken, token);
  }
}
