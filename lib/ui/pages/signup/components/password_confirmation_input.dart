import 'package:flutter/material.dart';

class PasswordConfirmationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirmar senha',
        icon: Icon(
          Icons.person,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      keyboardType: TextInputType.name,
    );
  }
}
