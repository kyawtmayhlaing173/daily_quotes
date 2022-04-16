part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInRequested extends AuthEvent {
  String email;
  String password;
  SignInRequested({required this.email, required this.password});
}

class SignUpRequested extends AuthEvent {
  String email;
  String password;
  String userName;
  SignUpRequested({
    required this.email,
    required this.password,
    required this.userName,
  });
}

class SignOutRequested extends AuthEvent {}
