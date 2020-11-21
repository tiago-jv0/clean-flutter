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
        return 'Credenciais inválidas.';
      case UIError.emailInUse:
        return 'O email já está sendo usado';
      case UIError.requiredField:
        return 'Campo Obrigatório.';
      case UIError.invalidField:
        return 'Campo Inválido.';
      default:
        return 'Algo errado aconteceu. Tente novamente em breve.';
    }
  }
}
