import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

abstract class Validation {
  String validate({@required String field, @required String value});
}

class ValidationSpy extends Mock implements Validation {}

class StreamLoginPresenter {
  final Validation validation;

  StreamLoginPresenter({@required this.validation});

  void validateEmail(String email) {
    validation.validate(field: 'email', value: email);
  }
}

void main() {
  StreamLoginPresenter sut;
  ValidationSpy validationSpy;
  String email;
  setUp(() {
    validationSpy = ValidationSpy();
    sut = StreamLoginPresenter(validation: validationSpy);

    final email = faker.internet.email();
  });
  test('should call validation with correct email', () {
    sut.validateEmail(email);

    verify(validationSpy.validate(field: 'email', value: email)).called(1);
  });
}
