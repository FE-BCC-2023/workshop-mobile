part of 'auth_bloc.dart';

abstract class AuthEvent  {
  const AuthEvent();

  
}

class IsHasLogin extends AuthEvent{}

class LoginEvent extends AuthEvent {
  String email;
  String password;
  LoginEvent({
    required this.email,
    required this.password,
  });

}

class RegisterEvent extends AuthEvent {
  String email;
  String password;
  RegisterEvent({
    required this.email,
    required this.password,
  });

}

class LogoutEvent extends AuthEvent{}
