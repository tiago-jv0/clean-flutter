import 'dart:async';

import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

abstract class Validation {
  String validate({@required String field, @required String value});
}

class ValidationSpy extends Mock implements Validation {}

class LoginState {
  String emailError;
}

class StreamLoginPresenter {
  final Validation validation;

  final StreamController _controller = StreamController<LoginState>.broadcast();

  LoginState _state = LoginState();

  Stream<String> get emailErrorStream =>
      _controller.stream.map((state) => state.emailError);

  StreamLoginPresenter({@required this.validation});

  void validateEmail(String email) {
    _state.emailError = validation.validate(field: 'email', value: email);
    _controller.add(_state);
  }
}

void main() {
  StreamLoginPresenter sut;
  ValidationSpy validation;
  String email;
  setUp(() {
    validation = ValidationSpy();
    sut = StreamLoginPresenter(validation: validation);

    final email = faker.internet.email();
  });
  test('should call validation with correct email', () {
    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });

  test('should emit validation error if email fails', () {
    when(validation.validate(
            field: anyNamed('field'), value: anyNamed('value')))
        .thenReturn('error');

    expectLater(sut.emailErrorStream, emits('error'));

    sut.validateEmail(email);
  });
}
