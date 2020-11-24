import 'translations.dart';

class PtBr implements Translations {
  String get msgEmailInUse => 'O email já está sendo usado.';
  String get msgInvalidField => 'Campo Inválido.';
  String get msgInvalidCredentials => 'Credenciais inválidas.';
  String get msgRequiredField => 'Campo Obrigatório.';
  String get msgUnexpected =>
      'Algo errado aconteceu. Tente novamente em breve.';

  String get addAccount => 'Criar conta';
  String get confirmPassword => 'Confirmar Senha';
  String get email => 'Email';
  String get enter => 'Entrar';
  String get login => 'Login';
  String get name => 'Nome';
  String get password => 'Senha';
}
