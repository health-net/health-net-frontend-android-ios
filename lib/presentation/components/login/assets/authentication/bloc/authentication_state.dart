part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  final String authToken;
  const AuthenticationState(this.authToken);
}

///Used as Bloc initial state. Will unconditionally
///check KeyStore/Keychain for a token.
class AuthenticationUninitialized extends AuthenticationState {
  AuthenticationUninitialized() : super(null);

  @override
  List<Object> get props =>[];
}


///Bloc state that identify a non-existant token 
///in KeyStore/Keychain (empty string or null)
class AuthenticationUnauthenticated extends AuthenticationState {
  final String storedEmail;
  AuthenticationUnauthenticated(this.storedEmail) : super(null);

  @override
  List<Object> get props =>[];
}

///Bloc state that identify the existance of a token in KeyStore/KeyChain
///validated by the backend.
class AuthenticationAuthenticated extends AuthenticationState {
  AuthenticationAuthenticated(String authToken) : super(authToken);

  @override
  List<Object> get props => [authToken];
}

class AuthenticationFailed extends AuthenticationState{
  AuthenticationFailed(this.statusCode) : super(null);
  final int statusCode;
  
  @override
  List<Object> get props =>[statusCode];
  
}