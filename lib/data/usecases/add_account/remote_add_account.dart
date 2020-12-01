import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';

import '../../http/http.dart';
import '../../models/models.dart';

class RemoteAddAccount implements AddAccount {
  final HttpClient<Map> httpClient;
  final String url;

  RemoteAddAccount({@required this.httpClient, @required this.url});

  Future<AccountEntity> add(AddAccountParams params) async {
    try {
      final body = RemoteAddAccountParams.fromDomain(params).toJson();
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);
      return RemoteAccountModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      switch (error) {
        case HttpError.forbidden:
          throw DomainError.emailInUse;
        default:
          throw DomainError.unexpected;
      }
    }
  }
}

class RemoteAddAccountParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  RemoteAddAccountParams(
      {@required this.email,
      @required this.name,
      @required this.password,
      @required this.passwordConfirmation});

  @override
  List get props => [name, email, password, passwordConfirmation];

  factory RemoteAddAccountParams.fromDomain(AddAccountParams params) {
    return RemoteAddAccountParams(
        email: params.email,
        name: params.name,
        password: params.password,
        passwordConfirmation: params.passwordConfirmation);
  }

  Map toJson() => {
        'email': email,
        'name': name,
        'password': password,
        'passwordConfirmation': passwordConfirmation,
      };
}
