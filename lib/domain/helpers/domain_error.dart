enum DomainError { unexpected, invalidCredentials, emailInUse }

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return 'Credenciais inválidas.';
      case DomainError.emailInUse:
        return 'O email já está sendo usado';
      default:
        return 'Algo errado aconteceu. Tente novamente em breve.';
    }
  }
}
