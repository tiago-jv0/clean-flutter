import 'package:meta/meta.dart';

import '../../presentation/protocols/protocols.dart';

import '../protocols/protocols.dart';

class CompareFieldsValidation implements FieldValidation {
  String field;
  String valueToCompare;
  CompareFieldsValidation(
      {@required this.field, @required this.valueToCompare});

  ValidationError validate(String value) {
    return value == valueToCompare ? null : ValidationError.invalidField;
  }
}
