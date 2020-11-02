import 'package:test/test.dart';

import 'package:ForDev/validation/protocols/protocols.dart';
import 'package:ForDev/validation/validators/validators.dart';

class EmailValidation implements FieldValidation {
  final String field;

  EmailValidation(this.field);

  String validate(String value) {
    return null;
  }
}

void main() {
  EmailValidation sut;

  setUp(() {
    sut = EmailValidation('any_field');
  });
  test('Should return null if email is empty ', () {
    expect(sut.validate('any_value'), null);
  });

  test('Should return null if email is null ', () {
    expect(sut.validate(null), null);
  });

  test('Should return null if email is valid ', () {
    expect(sut.validate('tiago_jvo@outlook.com'), null);
  });
}
