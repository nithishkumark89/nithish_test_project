part of 'login_bloc.dart';

@immutable
sealed class LoginState {
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class PasswordInitial extends LoginState {
  final bool isObscured;

  PasswordInitial(this.isObscured);

  @override
  List<Object> get props => [isObscured];
}