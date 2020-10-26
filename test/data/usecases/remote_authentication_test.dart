import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:ForDev/domain/usecases/authentication.dart';
import 'package:ForDev/domain/helpers/helpers.dart';

import 'package:ForDev/data/usecases/usecases.dart';
import 'package:ForDev/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;
  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });

  test('should call HttpClient with correct values', () async {
    final email = faker.internet.email();
    final secret = faker.internet.password();

    final params = AuthenticationParams(email: email, secret: secret);

    await sut.auth(params);

    verify(httpClient.request(
        url: url, method: 'post', body: {'email': email, 'password': secret}));
  });

  test('should throw unexpected error if HttpClient returns 400 ', () async {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.badRequest);

    final email = faker.internet.email();
    final secret = faker.internet.password();

    final params = AuthenticationParams(email: email, secret: secret);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
