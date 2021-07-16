import 'package:login_using_bloc/auth/form_submission.dart';

class LoginState {
  final String username;
  bool get idValidUsername=>username.length>3;
  final String password;
  bool get isValidPassword=>password.length >6;
  final FormSubmissionStatus formStatus;
  LoginState({
    this.username = '',
    this.password = '',
    this.formStatus=const IntialFormStatus(),
  });
  LoginState copyWith({
    String username,
    String password,
    FormSubmissionStatus formStatus,
  }){
    return LoginState(
      username: username??this.username,
      password: password??this.password,
      formStatus: formStatus??this.formStatus,
    );
  }
}
