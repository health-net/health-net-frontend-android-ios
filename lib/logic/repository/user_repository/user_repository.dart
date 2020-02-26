import 'interfaces/key_storage_interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class UserRepository implements KeyStorageInterface{

  final keyStore = new FlutterSecureStorage();

  bool deleteAllExistingToken() {
    keyStore.deleteAll();
    throw UnimplementedError();
  }

  @override
  bool deleteTokenByKey(String key) {
    if (["", null].contains(key))
      return false;
    keyStore.delete(key: key);
    return true;
  }

  @override
  Future<Map<String, String>> getAllTokens() async{
    return await keyStore.readAll();
  }

  @override
  Future<String> getTokenByKey(String key) async{
    if (["", null].contains(key))
      return null;
    return await keyStore.read(key: key);
  }

  @override
  bool setNewToken(String key, String value) {
    if (["", null].contains(key)||["", null].contains(value))
      return false;
    keyStore.write(key: key, value: value);
    return true;
  }

  
}