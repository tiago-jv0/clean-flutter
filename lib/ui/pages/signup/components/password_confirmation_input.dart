import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../signup_presenter.dart';

class PasswordConfirmationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignUpPresenter>(context);

    return StreamBuilder<String>(
      stream: presenter.passwordConfirmationErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: 'Confirmar senha',
            icon: Icon(
              Icons.person,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          keyboardType: TextInputType.name,
          onChanged: presenter.validatePasswordConfirmation,
        );
      },
    );
  }
}
