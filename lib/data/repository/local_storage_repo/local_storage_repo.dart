abstract class LocalStorageRepo {
  Future<String> getToken();
  Future<void> clearAllData();
  Future<dynamic> getUser();
  Future<void> saveToken(String token);
  Future<dynamic> saveUser(dynamic user);
}
