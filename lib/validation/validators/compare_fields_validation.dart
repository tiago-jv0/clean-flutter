import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../presentation/protocols/protocols.dart';

import '../protocols/protocols.dart';

class CompareFieldsValidation extends Equatable implements FieldValidation {
  String field;
  String fieldToCompare;
  CompareFieldsValidation(
      {@required this.field, @required this.fieldToCompare});

  @override
  List get props => [field, fieldToCompare];

  ValidationError validate(Map input) {
    return input[field] != null &&
            input[fieldToCompare] != null &&
            input[field] != input[fieldToCompare]
        ? ValidationError.invalidField
        : null;
  }
}
