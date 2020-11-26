import 'package:ForDev/validation/validators/validators.dart';
import 'package:test/test.dart';
import 'package:ForDev/presentation/protocols/protocols.dart';

void main() {
  CompareFieldsValidation sut;

  setUp(() {
    sut = CompareFieldsValidation(
        field: 'any_field', valueToCompare: 'any_value');
  });
  test('Should return InvalidFieldError if values are not equal', () {
    final error = sut.validate('');
    expect(error, ValidationError.invalidField);
  });

  test('Should return null if values are equal', () {
    final error = sut.validate('any_value');
    expect(error, isNull);
  });
}
