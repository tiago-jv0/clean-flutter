import 'package:equatable/equatable.dart';

import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';

class RequiredFieldValidation extends Equatable implements FieldValidation {
  final String field;

  RequiredFieldValidation(this.field);

  @override
  List get props => [field];

  ValidationError validate(Map input) {
    return input[field]?.isNotEmpty == true
        ? null
        : ValidationError.requiredField;
  }
}
