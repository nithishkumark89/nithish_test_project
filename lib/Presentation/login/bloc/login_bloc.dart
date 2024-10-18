import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nithishkumar_test_project/Database/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;
  bool _isObscured = true;
  LoginBloc(this.apiService) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());  // Use emit instead of yield

      final response = await apiService.login(event.email, event.password);

      if (response.containsKey('error')) {
        emit(LoginFailure(response['error']));  // Emit failure state
      } else {
        emit(LoginSuccess('Login successful!'));  // Emit success state
      }
    });

    on<TogglePasswordVisibility>((event, emit) {
      _isObscured = !_isObscured; // Toggle visibility state
      emit(PasswordInitial(_isObscured)); // Emit the new state with visibility info
    });

  }
}

