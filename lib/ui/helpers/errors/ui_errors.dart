import '../helpers.dart';

enum UIError {
  unexpected,
  invalidCredentials,
  emailInUse,
  requiredField,
  invalidField
}

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.invalidCredentials:
        return R.strings.msgInvalidCredentials;
      case UIError.emailInUse:
        return R.strings.msgEmailInUse;
      case UIError.requiredField:
        return R.strings.msgRequiredField;
      case UIError.invalidField:
        return R.strings.msgInvalidField;

      default:
        return R.strings.msgUnexpected;
    }
  }
}
