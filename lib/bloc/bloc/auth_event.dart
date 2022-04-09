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
  SignUpRequested({required this.email, required this.password});
}

class SignOutRequested extends AuthEvent {}
