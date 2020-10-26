import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:ForDev/domain/usecases/authentication.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    final body = {'email': params.email, 'password': params.secret};
    await httpClient.request(url: this.url, method: 'post', body: body);
  }
}

abstract class HttpClient {
  Future<void> request(
      {@required String url, @required String method, Map body});
}

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
}
