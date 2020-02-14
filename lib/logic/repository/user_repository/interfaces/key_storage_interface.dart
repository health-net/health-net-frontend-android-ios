//import 'dart:async';

abstract class KeyStorageInterface {


bool deleteTokenByKey(String key);

bool deleteAllExistingToken();

Future<String> getTokenByKey(String key);

Future<Map<String, String>> getAllTokens();

bool setNewToken(String key, String value);
}