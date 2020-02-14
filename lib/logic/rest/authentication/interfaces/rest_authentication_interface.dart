abstract class AuthenticationInterface {

  Future<String> sendAuthenticationRequest(String email, String password);
  Future<bool> checkValidToken(String token);
  Future<bool> sendDeauthenticationRequest();

}