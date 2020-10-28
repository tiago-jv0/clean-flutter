import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../pages.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LoginHeader(),
              Headline1(text: 'Login'),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Form(
                  child: Column(
                    children: [
                      StreamBuilder<String>(
                          stream: presenter.emailErrorStream,
                          builder: (context, snapshot) {
                            return TextFormField(
                              onChanged: presenter.validateEmail,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  icon: Icon(
                                    Icons.email,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                  errorText: snapshot.data?.isEmpty == true
                                      ? null
                                      : snapshot.data),
                              keyboardType: TextInputType.emailAddress,
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                        child: StreamBuilder<String>(
                            stream: presenter.passwordErrorStream,
                            builder: (context, snapshot) {
                              return TextFormField(
                                onChanged: presenter.validatePassword,
                                decoration: InputDecoration(
                                    labelText: 'Senha',
                                    errorText: snapshot.data?.isEmpty == true
                                        ? null
                                        : snapshot.data,
                                    icon: Icon(
                                      Icons.lock,
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    )),
                                obscureText: true,
                              );
                            }),
                      ),
                      StreamBuilder<bool>(
                          stream: presenter.isFormValidStream,
                          builder: (context, snapshot) {
                            return RaisedButton(
                              onPressed: snapshot.data == true ? () {} : null,
                              child: Text('Entrar'.toUpperCase()),
                            );
                          }),
                      FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.person),
                          label: Text('Criar conta'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
