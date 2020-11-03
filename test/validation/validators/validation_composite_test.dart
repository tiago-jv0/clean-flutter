import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import 'package:ForDev/presentation/protocols/protocols.dart';
import 'package:ForDev/validation/protocols/protocols.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  String validate({@required String field, @required String value}) {
    return null;
  }
}

class FieldValidationSpy extends Mock implements FieldValidation {}

void main() {
  test('Should return null if all valdiations returns null or empty', () {
    final validationOne = FieldValidationSpy();
    when(validationOne.field).thenReturn('any_field');
    when(validationOne.validate(any)).thenReturn(null);

    final validationTwo = FieldValidationSpy();
    when(validationTwo.field).thenReturn('any_field');
    when(validationTwo.validate(any)).thenReturn(null);

    final sut = ValidationComposite([]);

    final error = sut.validate(field: 'any_field', value: 'any_value');

    expect(error, null);
  });
}
