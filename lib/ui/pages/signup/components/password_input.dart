import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Senha',
          icon: Icon(
            Icons.lock,
            color: Theme.of(context).primaryColorLight,
          )),
      obscureText: true,
    );
  }
}
