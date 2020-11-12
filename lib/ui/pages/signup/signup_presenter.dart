abstract class SignUpPresenter {
  Stream<String> get nameErrorStream;
  Stream<String> get emailErrorStream;
  Stream<String> get passwordErrorStream;
  Stream<String> get passwordConfirmationErrorStream;

  void validateEmail(String email);
  void validateName(String name);
  void validatePassword(String password);
  void validatePasswordConfirmation(String passwordConfirmation);
}
