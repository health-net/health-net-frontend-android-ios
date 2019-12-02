import 'dart:async';

import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final credentialStorage = new FlutterSecureStorage();

class UserRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    //TODO delete token from Keychain(IOS)/Keystore(Android)
    
    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    
    //TODO insert token from Keychain(IOS)/Keystore(Android)
    return;
  }

  Future<bool> hasToken() async {
   /* if(await(credentialStorage.read(/*inserire chiave ottenuta da backend*/)))
      return true;
    else
      return false;
  }*/
  return false;
}