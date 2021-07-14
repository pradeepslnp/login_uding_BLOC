import 'package:login_using_bloc/auth/form_submission.dart';

class LoginState {
  final String? username;
  final String? password;
  final FormSubmissionStatus formStatus;
  LoginState({
    this.username = '',
    this.password = '',
    this.formStatus=const IntialFormStatus(),
  });
  LoginState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }){
    return LoginState(
      username: username??this.username,
      password: password??this.password,
      formStatus: formStatus??this.formStatus,
    );
  }
}
