import 'package:flutter/material.dart';

class Login extends StatelessWidget {
final _FormKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lofinForm(),
    );
  }
  Widget _lofinForm(){
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

  Widget _passwordFeild() {
    return TextFormField(
      obscureText: true,
      validator: (value)=>null,
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        hintText: "Password",
      ),
    );
  }

  Widget _usernamedFeild() {
    return TextFormField(
      validator: (value)=>null,

      // obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: "Password",
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(onPressed: () {}, child: Text('Login'));
  }
}
