import 'package:faker/faker.dart';
import 'package:test/test.dart';

import 'package:ForDev/presentation/protocols/protocols.dart';

import 'package:ForDev/validation/validators/validators.dart';

void main() {
  MinLengthValidation sut;

  setUp(() {
    sut = MinLengthValidation(field: 'any_field', size: 5);
  });
  test('Should return error if value is empty', () {
    final error = sut.validate('');
    expect(error, ValidationError.invalidField);
  });

  test('Should return error if value is null', () {
    final error = sut.validate(null);
    expect(error, ValidationError.invalidField);
  });

  test('Should return error if value is less than min size', () {
    final error = sut.validate(faker.randomGenerator.string(4, min: 1));
    expect(error, ValidationError.invalidField);
  });

  test('Should return null if value is equal to min size', () {
    final error = sut.validate(faker.randomGenerator.string(5, min: 5));
    expect(error, isNull);
  });

  test('Should return null if value is greater than min size', () {
    final error = sut.validate(faker.randomGenerator.string(10, min: 6));
    expect(error, isNull);
  });
}
