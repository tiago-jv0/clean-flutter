import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../pages.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (context) {
          widget.presenter.isLoadingStream.listen((bool isLoading) {
            if (isLoading) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });

          widget.presenter.mainErrorStream.listen((mainError) {
            if (mainError != null) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  mainError,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.red[900],
              ));
            }
          });

          return SingleChildScrollView(
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
                            stream: widget.presenter.emailErrorStream,
                            builder: (context, snapshot) {
                              return TextFormField(
                                onChanged: widget.presenter.validateEmail,
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    icon: Icon(
                                      Icons.email,
                                      color:
                                          Theme.of(context).primaryColorLight,
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
                              stream: widget.presenter.passwordErrorStream,
                              builder: (context, snapshot) {
                                return TextFormField(
                                  onChanged: widget.presenter.validatePassword,
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
                            stream: widget.presenter.isFormValidStream,
                            builder: (context, snapshot) {
                              return RaisedButton(
                                onPressed: snapshot.data == true
                                    ? widget.presenter.auth
                                    : null,
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
          );
        }),
      ),
    );
  }
}
