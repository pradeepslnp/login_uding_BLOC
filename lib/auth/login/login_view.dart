import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_using_bloc/auth/auth_repo.dart';
import 'package:login_using_bloc/auth/form_submission.dart';
import 'package:login_using_bloc/auth/login/loginevent.dart';
import 'package:login_using_bloc/auth/login/loginstate.dart';

import 'login_bloc.dart';

class Login extends StatelessWidget {
  final _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: _lofinForm(),
      ),
    );
  }

  Widget _lofinForm() {
    return Form(
        key: _FormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _usernamedFeild(),
              _passwordFeild(),
              _loginButton(),
            ],
          ),
        ));
  }

// Widget _loginForm(){
//   return Form(
//     key: _FormKey,
//     child: Padding(padding: EdgeInsets.symmetric(horizontal: 40),

//     ),
//   );
// }
  Widget _passwordFeild() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        onChanged: (value) => context
            .read<LoginBloc>()
            .add(LoginPasswordChanged(password: value)),
        validator: (value) =>
            state.isValidPassword ? null : ' password is too short',
        decoration: InputDecoration(
          icon: Icon(Icons.security),
          hintText: "Password",
        ),
      );
    });
  }

  Widget _usernamedFeild() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          validator: (value) =>
              state.idValidUsername ? null : ' username is too short',
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginUseNameChanged(username: value),
              ), // obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: "Username",
          ),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_FormKey.currentState.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                }
              },
              child: Text('Login'));
    });
  }
}
