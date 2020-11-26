import 'package:ForDev/validation/validators/validators.dart';
import 'package:test/test.dart';

void main() {
  CompareFieldsValidation sut;

  setUp(() {
    sut = CompareFieldsValidation(
        field: 'any_field', valueToCompare: 'any_value');
  });

  test('Should return null if values are equal', () {
    final error = sut.validate('any_value');
    expect(error, isNull);
  });
}
