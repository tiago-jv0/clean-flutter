import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../pages.dart';

import './components/components.dart';

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
              showErrorMessage(context, mainError);
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
                  child: Provider(
                    create: (ctx) => widget.presenter,
                    child: Form(
                      child: Column(
                        children: [
                          EmailInput(),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 32),
                            child: StreamBuilder<String>(
                                stream: widget.presenter.passwordErrorStream,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    onChanged:
                                        widget.presenter.validatePassword,
                                    decoration: InputDecoration(
                                        labelText: 'Senha',
                                        errorText:
                                            snapshot.data?.isEmpty == true
                                                ? null
                                                : snapshot.data,
                                        icon: Icon(
                                          Icons.lock,
                                          color: Theme.of(context)
                                              .primaryColorLight,
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
