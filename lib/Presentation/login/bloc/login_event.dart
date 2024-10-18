part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class TogglePasswordVisibility extends LoginEvent {

}