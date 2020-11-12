import 'package:ForDev/data/http/http.dart';
import 'package:ForDev/data/usecases/usecases.dart';
import 'package:ForDev/domain/usecases/usecases.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  String url;
  AddAccountParams params;
  HttpClientSpy httpClient;
  RemoteAddAccount sut;

  setUp(() {
    url = faker.internet.httpUrl();
    params = AddAccountParams(
        email: faker.internet.email(),
        name: faker.person.name(),
        password: 'any_password',
        passwordConfirmation: 'any_password');
    httpClient = HttpClientSpy();
    sut = RemoteAddAccount(httpClient: httpClient, url: url);
  });

  test('Should call HttpClient with correct values', () async {
    await sut.add(params);

    verify(httpClient.request(method: 'post', url: url, body: {
      'name': params.name,
      'email': params.email,
      'password': params.password,
      'passwordConfirmation': params.passwordConfirmation,
    }));
  });
}
