import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import './login_presenter.dart';

import 'components/components.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  LoginPage(this.presenter);

  @override
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (context) {
          presenter.isLoadingStream.listen((bool isLoading) {
            if (isLoading) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });

          presenter.mainErrorStream.listen((mainError) {
            if (mainError != null) {
              showErrorMessage(context, mainError);
            }
          });

          presenter.navigateToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.offAllNamed(page);
            }
          });

          return GestureDetector(
            onTap: _hideKeyboard,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginHeader(),
                  Headline1(text: 'Login'),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Provider(
                      create: (ctx) => presenter,
                      child: Form(
                        child: Column(
                          children: [
                            EmailInput(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 32),
                              child: PasswordInput(),
                            ),
                            LoginButton(),
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
            ),
          );
        }),
      ),
    );
  }
}
