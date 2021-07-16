abstract class LoginEvent{

}

class LoginUseNameChanged extends LoginEvent{
  final String username;
  LoginUseNameChanged({ this.username});
}
class LoginPasswordChanged extends LoginEvent{
  final String password;
  LoginPasswordChanged({ this.password});
}
class   LoginSubmitted extends LoginEvent{

}