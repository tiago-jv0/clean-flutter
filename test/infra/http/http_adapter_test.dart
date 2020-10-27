import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:ForDev/data/http/http.dart';

class ClientSpy extends Mock implements Client {}

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter({this.client});

  Future<Map> request(
      {@required String url, @required String method, Map body}) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };

    final jsonBody = body != null ? json.encode(body) : null;

    final response = await client.post(url, headers: headers, body: jsonBody);

    return json.decode(response.body);
  }
}

void main() {
  HttpAdapter sut;
  ClientSpy client;
  String url;

  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client: client);
    url = faker.internet.httpUrl();
  });

  group('post', () {
    test('should call POST with correct values', () async {
      when(client.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((realInvocation) async =>
              Response('{"any_key":"any_value"}', 200));

      await sut
          .request(url: url, method: 'post', body: {'any_key': 'any_value'});

      verify(client.post(url,
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
          },
          body: '{"any_key":"any_value"}'));
    });

    test('should call POST without body', () async {
      when(client.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((realInvocation) async =>
              Response('{"any_key":"any_value"}', 200));

      await sut.request(url: url, method: 'post');

      verify(client.post(any, headers: anyNamed('headers')));
    });

    test('should return data if post returns 200', () async {
      when(client.post(any, headers: anyNamed('headers'))).thenAnswer(
          (realInvocation) async => Response('{"any_key":"any_value"}', 200));

      final response = await sut.request(
        url: url,
        method: 'post',
      );

      expect(response, {'any_key': 'any_value'});
    });
  });
}
