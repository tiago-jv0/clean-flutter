import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class ClientSpy extends Mock implements Client {}

class HttpAdapter {
  final Client client;

  HttpAdapter({this.client});

  Future<void> request({@required String url, @required String method}) async {
    await client.post(url);
  }
}

void main() {
  group('post', () {
    test('should call POST with correct values', () async {
      final client = ClientSpy();
      final sut = HttpAdapter(client: client);
      final url = faker.internet.httpUrl();

      await sut.request(url: url, method: 'post');

      verify(client.post(url));
    });
  });
}
