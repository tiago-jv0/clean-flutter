import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:ForDev/data/http/http.dart';

import 'package:ForDev/infra/http/http.dart';

class ClientSpy extends Mock implements Client {}

void main() {
  HttpAdapter sut;
  ClientSpy client;
  String url;

  setUp(() {
    client = ClientSpy();
    sut = HttpAdapter(client: client);
    url = faker.internet.httpUrl();
  });

  group('shared', () {
    test('should throw ServerError if invalid method is provided', () async {
      final future = sut.request(
          url: url, method: 'invalid_method', body: {'any_key': 'any_value'});

      expect(future, throwsA(HttpError.serverError));
    });
  });

  group('post', () {
    PostExpectation mockRequest() => when(
        client.post(any, body: anyNamed('body'), headers: anyNamed('headers')));

    void mockResponse(int statusCode,
        {String body = '{"any_key":"any_value"}'}) {
      mockRequest()
          .thenAnswer((realInvocation) async => Response(body, statusCode));
    }

    void mockError() {
      mockRequest().thenThrow(Exception());
    }

    setUp(() {
      mockResponse(200);
    });
    test('should call POST with correct values', () async {
      await sut
          .request(url: url, method: 'post', body: {'any_key': 'any_value'});

      verify(
        client.post(url,
            headers: {
              'content-type': 'application/json',
              'accept': 'application/json'
            },
            body: '{"any_key":"any_value"}'),
      );
    });

    test('should call POST without body', () async {
      await sut.request(url: url, method: 'post');

      verify(client.post(any, headers: anyNamed('headers')));
    });

    test('should return data if post returns 200', () async {
      final response = await sut.request(
        url: url,
        method: 'post',
      );

      expect(response, {'any_key': 'any_value'});
    });

    test('should return null if post returns 200 with no data', () async {
      mockResponse(200, body: '');

      final response = await sut.request(
        url: url,
        method: 'post',
      );

      expect(response, null);
    });

    test('should return null if post returns 204', () async {
      mockResponse(204, body: '');

      final response = await sut.request(
        url: url,
        method: 'post',
      );

      expect(response, null);
    });

    test('should return null if post returns 204 with data', () async {
      mockResponse(204);

      final response = await sut.request(
        url: url,
        method: 'post',
      );

      expect(response, null);
    });

    test('should return BadRequestError if post returns 400 with no data',
        () async {
      mockResponse(400, body: '');

      final future = sut.request(
        url: url,
        method: 'post',
      );

      expect(future, throwsA(HttpError.badRequest));
    });

    test('should return BadRequestError if post returns 400', () async {
      mockResponse(400);

      final future = sut.request(
        url: url,
        method: 'post',
      );

      expect(future, throwsA(HttpError.badRequest));
    });
    test('should return UnauthorizedError if post returns 401', () async {
      mockResponse(401);

      final future = sut.request(
        url: url,
        method: 'post',
      );

      expect(future, throwsA(HttpError.unauthorized));
    });

    test('should return ForbiddenError if post returns 403', () async {
      mockResponse(403);

      final future = sut.request(
        url: url,
        method: 'post',
      );

      expect(future, throwsA(HttpError.forbidden));
    });

    test('should return NotFoundError if post returns 404', () async {
      mockResponse(404);

      final future = sut.request(
        url: url,
        method: 'post',
      );

      expect(future, throwsA(HttpError.notFound));
    });

    test('should return ServerError if post returns 500', () async {
      mockResponse(500);

      final future = sut.request(
        url: url,
        method: 'post',
      );

      expect(future, throwsA(HttpError.serverError));
    });

    test('should return ServerError if post throws', () async {
      mockError();

      final future = sut.request(
        url: url,
        method: 'post',
      );

      expect(future, throwsA(HttpError.serverError));
    });
  });

  group('Get', () {
    PostExpectation mockRequest() =>
        when(client.get(any, headers: anyNamed('headers')));

    void mockResponse(int statusCode,
        {String body = '{"any_key":"any_value"}'}) {
      mockRequest()
          .thenAnswer((realInvocation) async => Response(body, statusCode));
    }

    setUp(() {
      mockResponse(200);
    });
    test('should call GET with correct values', () async {
      await sut.request(url: url, method: 'get');

      verify(client.get(
        url,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json'
        },
      )).called(1);
    });

    test('should return data if get returns 200', () async {
      final response = await sut.request(
        url: url,
        method: 'get',
      );

      expect(response, {'any_key': 'any_value'});
    });

    test('should return null if get returns 200 with no data', () async {
      mockResponse(200, body: '');

      final response = await sut.request(
        url: url,
        method: 'get',
      );

      expect(response, null);
    });

    test('should return null if get returns 204', () async {
      mockResponse(204, body: '');

      final response = await sut.request(
        url: url,
        method: 'get',
      );

      expect(response, null);
    });

    test('should return null if get returns 204 with data', () async {
      mockResponse(204);

      final response = await sut.request(
        url: url,
        method: 'get',
      );

      expect(response, null);
    });

    test('should return BadRequestError if get returns 400', () async {
      mockResponse(400, body: '');

      final future = sut.request(
        url: url,
        method: 'get',
      );

      expect(future, throwsA(HttpError.badRequest));
    });

    test('should return BadRequestError if get returns 400', () async {
      mockResponse(400);

      final future = sut.request(
        url: url,
        method: 'get',
      );

      expect(future, throwsA(HttpError.badRequest));
    });

    test('should return UnauthorizedError if get returns 401', () async {
      mockResponse(401);

      final future = sut.request(
        url: url,
        method: 'get',
      );

      expect(future, throwsA(HttpError.unauthorized));
    });
  });
}
