abstract class AuthenticationInterface {

  Future<String> sendAuthenticationRequest(String email, String password);
  Future<bool> sendDeauthenticationRequest();

}